import 'dart:async';
import 'dart:typed_data';
import 'audio_packet.dart';

import '../client_base.dart';
import '../listeners.dart';
import '../model/audio.dart';
import '../model/user.dart';
import 'udp_transport.dart';
import '../utils/utils.dart' show JsonString;

/// An AudioFrame contains encoded audio data and optional positional information.
class AudioFrame with JsonString {
  /// The frame data, encoded according to mumbles frame [specification](https://mumble-protocol.readthedocs.io/en/latest/voice_data.html).
  final Uint8List frame;

  /// The sequence number of this frame.
  ///
  /// Will be -1 if this AudioFrame was created with the [AudioFrame.outgoing] constructor,
  /// and only contain a useful value if this is an incoming frame.
  ///
  /// Copied from the [mumble docs](https://mumble-protocol.readthedocs.io/en/latest/voice_data.html):
  /// The sequence number is used to maintain the packet order when the audio data is
  /// transported over unreliable transports such as UDP.
  ///
  /// *Note*: This field is the frames sequence number, not the packets sequence number! The docs above
  /// describe the packet sequence number. The frame sequence number is calculated by adding its frame
  /// index from within the packet (which might contain multiple frames) to the sequence number of the packet.
  final int sequenceNumber;

  /// Optional positional information for this frame.
  final PositionalInformation? positionalInformation;

  const AudioFrame._incoming(
      {required this.frame,
      this.positionalInformation,
      required this.sequenceNumber});

  /// Creates a frame that should be added to an [AudioFrameSink] to send it to the mumble server.
  ///
  /// The [sequenceNumber] of such an outgoing frame is not known until actuall sending and
  /// thus will always be -1.
  const AudioFrame.outgoing({
    required this.frame,
    this.positionalInformation,
  }) : this.sequenceNumber = -1;

  @override
  Map<String, Object> jsonMap() => new Map<String, Object>()
    ..['frame'] = frame
    ..['sequenceNumber'] = sequenceNumber
    ..['position'] = positionalInformation.toString();
}

/// The client responsible for transmitting audio streams.
abstract class AudioClient with Notifier<AudioListener> {
  static int _sequenceNumber = 1;

  static int get sequenceNumber => _sequenceNumber;

  static void resetSequenceNumber() => _sequenceNumber = 0;

  static int _increaseSequenceNumber(int count) {
    int first = _sequenceNumber;
    _sequenceNumber = _sequenceNumber + count;
    return first;
  }

  /// The maximum time between the receiving of two audio frames before a
  /// [AudioListener.onAudioReceived] `voiceData` stream will be closed.
  ///
  /// See the documentation of [AudioListener.onAudioReceived] for additional
  /// information.
  ///
  /// If set to null during construction (by setting the same-named parameter in
  /// the [ConnectionOptions] passed to [MumbleClient.connect] to null), no timeout
  /// checks will be performed.
  ///
  /// The default value of 500ms (see [ConnectionOptions.incomingAudioStreamTimeout])
  /// is relative high. Some applications may want to use a lower value.
  Duration? get incomingAudioStreamTimeout;

  /// If this client should use udp.
  bool get shouldUseUdp;

  /// The udp latency or null if currently not using udp.
  Duration? get udpLatency;

  /// If audio is currently transmitted using udp. If this is false, tcp transport is used.
  ///
  /// This can only be `true` if [shouldUseUdp] is set.
  /// There are variouse reasons why udp is not used even if [shouldUseUdp], e.g.
  /// the servers udp heartbeats are not receieved or the nonce is currently out of sync.
  ///
  /// The value of this field may change over time. For example when switching back to udp after using tcp.
  bool get udpCurrentlyAvailable;

  Future<void> close();

  /// Initiates audio transport.
  ///
  /// To whisper a user, register it as voice target first and then pass the targets id to this method.
  ///
  /// The required `codec` parameter tells dumble how to formate the data.
  /// `framesPerPacket` is always forced to `1` when using opus as codec.
  ///
  /// See the [Mumble voice data specification](https://mumble-protocol.readthedocs.io/en/latest/voice_data.html) for mor details.
  AudioFrameSink sendAudio(
      {required AudioCodec codec,
      int voiceTarget: normalTalking,
      int framesPerPacket});
}

class AudioClientBase extends AudioClient {
  final MumbleClientBase _client;
  final UdpTransport? _udpTransport;
  final List<_UdpErrorReceiver> _overUdp;
  final List<AudioFrameSink> _sinks;
  final Map<int, _AudioFrameStream> _streams;

  bool _udpAvailable;

  @override
  bool get udpCurrentlyAvailable => shouldUseUdp && _udpAvailable;

  @override
  Duration? get udpLatency => shouldUseUdp ? _udpTransport!.latency : null;

  @override
  bool get shouldUseUdp => _udpTransport != null;

  @override
  final Duration? incomingAudioStreamTimeout;

  static Future<AudioClientBase> withRemoteHostLookup(
      MumbleClientBase client,
      bool shouldUseUdp,
      Object? localBindAddress,
      int localPort,
      Duration? incomingAudioStreamTimeout) async {
    UdpTransport? transport;
    if (shouldUseUdp) {
      transport = await UdpTransport.withRemoteHostLookup(
          cryptStateProvider: client,
          localBindAddress: localBindAddress,
          localPort: localPort,
          remoteHost: client.options.host,
          remotePort: client.options.port);
    }
    return new AudioClientBase(client, transport, incomingAudioStreamTimeout);
  }

  AudioClientBase(
      this._client, this._udpTransport, this.incomingAudioStreamTimeout)
      : this._udpAvailable = false,
        this._overUdp = <_UdpErrorReceiver>[],
        this._streams = new Map<int, _AudioFrameStream>(),
        this._sinks = <AudioFrameSink>[] {
    if (shouldUseUdp) {
      _udpTransport!
          .useUdp(onResyncRequest: _client.requestCryptStateResync)
          .listen(_onUdpAvailabilityChange);
      _udpTransport!.audio
          .listen((IncomingAudioPacket packet) => feed(packet, true));
    }
  }

  @override
  Future<void> close() async {
    List<Future> closeFutures = <Future>[];
    for (Stream<AudioFrame> stream in _streams.values) {
      closeFutures.add((stream as _AudioFrameStream).close());
    }
    _streams.clear();
    for (AudioFrameSink sink in _sinks) {
      closeFutures.add((sink as AudioFrameSinkBase).close(gracefully: false));
    }
    _sinks.clear();
    _overUdp.clear();
    _udpTransport?.close();
    await Future.wait(closeFutures);
  }

  void _onUdpAvailabilityChange(bool available) {
    _udpAvailable = available;
    if (!_udpAvailable) {
      try {
        throw new UdpPingException();
      } on UdpPingException catch (error, stackTrace) {
        for (_UdpErrorReceiver receiver in _overUdp) {
          receiver.onUdpError(error, stackTrace);
          if (receiver is _AudioFrameStream) {
            _streams.remove(receiver.userId);
          } else {
            _sinks.remove(receiver);
          }
        }
        _overUdp.clear();
      }
    }
  }

  void feed(IncomingAudioPacket packet, bool fromUdp) {
    _AudioFrameStream? stream = _streams[packet.sessionId];
    if (stream == null) {
      if (!hasListeners) {
        // If we have no listeners, we don't need a new stream
        // since if it would be created, no one would notice
        return;
      }
      stream = new _AudioFrameStream(packet.sessionId,
          incomingAudioStreamTimeout, () => _endOfTransmission(stream!));
      _streams[packet.sessionId] = stream;
      if (fromUdp) {
        _overUdp.add(stream);
      }
      User? user = _client.getUsers()[packet.sessionId];
      for (AudioListener listener in listeners) {
        listener.onAudioReceived(
            stream, packet.codec, user, TalkMode.values[packet.target]);
      }
    }
    int sequenceNumber = packet.sequenceNumber;
    for (Uint8List frame in packet.frames) {
      stream.add(new AudioFrame._incoming(
          sequenceNumber: sequenceNumber,
          frame: frame,
          positionalInformation: packet.positionalInformation));
      sequenceNumber++;
    }
    if (packet.endOfTransmission) {
      _endOfTransmission(stream);
    }
  }

  void _endOfTransmission(_AudioFrameStream stream) {
    stream.close();
    _streams.remove(stream.userId);
  }

  @override
  AudioFrameSink sendAudio(
      {required AudioCodec codec,
      int voiceTarget: normalTalking,
      int framesPerPacket = 1}) {
    framesPerPacket = codec == AudioCodec.opus ? 1 : framesPerPacket;
    AudioFrameSinkBase sink;
    if (udpCurrentlyAvailable) {
      sink = new AudioFrameSinkUdp(
          _udpTransport!, codec, framesPerPacket, voiceTarget);
      _overUdp.add(sink as AudioFrameSinkUdp);
    } else {
      sink = new AudioFrameSinkTunnel(
          _client, codec, framesPerPacket, voiceTarget);
    }
    _sinks.add(sink);
    return sink;
  }
}

typedef void AudioErrorCallback(dynamic error, [StackTrace? stackTrace]);

/// A sink for [AudioFrame]s that should be transported to the Mumble server.
///
/// Use the [onError] callback to receive transport errors.
abstract class AudioFrameSink extends StreamSink<AudioFrame> {
  /// Invoked when an audio error occurs
  AudioErrorCallback? onError;

  /// The currently used audio codec
  final AudioCodec codec;

  AudioFrameSink({required AudioCodec codec, this.onError})
      : this.codec = assertNotPing(codec);
}

class AudioFrameSinkTunnel extends AudioFrameSinkBase {
  final MumbleClientBase _client;

  AudioFrameSinkTunnel(
      this._client, AudioCodec codec, int length, int voiceTarget,
      [AudioErrorCallback? onError])
      : super(codec, length, voiceTarget, onError);

  @override
  void sendPacket(OutgoingAudioPacket packet) {
    _client.tunnelAudioPacket(packet);
  }

  @override
  bool get usingTunnel => true;
}

class AudioFrameSinkUdp extends AudioFrameSinkBase with _UdpErrorReceiver {
  final UdpTransport _transport;

  AudioFrameSinkUdp(
      this._transport, AudioCodec codec, int length, int voiceTarget,
      [AudioErrorCallback? onError])
      : super(codec, length, voiceTarget, onError);

  @override
  bool get usingTunnel => false;

  @override
  void sendPacket(OutgoingAudioPacket packet) {
    _transport.writePacket(packet);
  }

  @override
  void onUdpError(Object error, StackTrace stackTrace) {
    addError(error, stackTrace);
    _done.complete();
  }
}

abstract class AudioFrameSinkBase extends AudioFrameSink {
  static final List<Uint8List> _empty = <Uint8List>[new Uint8List(0)];

  final List<List<int>?> _frameBuffer;
  final int _voiceTarget;

  Completer<void> _done;
  int _frameBufferIndex;
  PositionalInformation? _positionalInformation;

  bool get usingTunnel;

  AudioFrameSinkBase(AudioCodec codec, int length, this._voiceTarget,
      [AudioErrorCallback? onError])
      : this._done = new Completer<void>(),
        this._frameBuffer = new List<List<int>?>.filled(length, null),
        this._frameBufferIndex = 0,
        super(codec: codec, onError: onError);

  @override
  void add(AudioFrame event) {
    if (!_done.isCompleted) {
      _frameBuffer[_frameBufferIndex] = event.frame;
      _frameBufferIndex++;
      _positionalInformation = event.positionalInformation;
      if (_frameBufferIndex == _frameBuffer.length) {
        _flush(false);
      }
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    if (onError != null) {
      onError!(error, stackTrace);
    }
  }

  List<Uint8List> _frameSublist() {
    List<Uint8List> frames = <Uint8List>[];
    for (int i = 0; i < _frameBufferIndex; i++) {
      List<int>? list = _frameBuffer[i];
      if (list == null) {
        throw new StateError(
            'The frame buffer index does not match the actuall frame buffer, this should never happen and is a critical error!');
      } else if (list is Uint8List) {
        frames.add(list);
      } else {
        frames.add(new Uint8List.fromList(list));
      }
    }
    return frames;
  }

  void _flush(bool eot) {
    List<Uint8List> frames = _frameSublist();
    if (frames.isEmpty) {
      frames = _empty;
    }
    OutgoingAudioPacket packet = new OutgoingAudioPacket(
        codec: codec,
        sequenceNumber: AudioClient._increaseSequenceNumber(_frameBufferIndex),
        frames: frames,
        voiceTarget: _voiceTarget,
        positionalInformation: _positionalInformation,
        endOfTransmission: eot);
    _frameBufferIndex = 0;
    sendPacket(packet);
  }

  void sendPacket(OutgoingAudioPacket packet);

  @override
  Future<void> addStream(Stream<AudioFrame> stream) async {
    await for (AudioFrame element in stream) {
      add(element);
    }
  }

  @override
  Future close({bool gracefully: true}) async {
    if (!_done.isCompleted) {
      if (gracefully) _flush(true);
      _done.complete();
    }
  }

  @override
  Future get done => _done.future;
}

mixin _UdpErrorReceiver {
  void onUdpError(Object error, StackTrace stackTrace);
}

class _AudioFrameStream extends StreamView<AudioFrame> with _UdpErrorReceiver {
  final StreamController<AudioFrame> _controller;
  final int userId;
  final void Function() onTimeout;

  _AudioFrameStream._(
      this.userId, Duration? timeout, this._controller, this.onTimeout)
      : super(timeout == null
            ? _controller.stream
            : _controller.stream.timeout(timeout,
                onTimeout: ((EventSink<AudioFrame> sink) {
                onTimeout();
              })));

  factory _AudioFrameStream(
      int userId, Duration? timeout, void Function() onTimeout) {
    StreamController<AudioFrame> controller =
        new StreamController<AudioFrame>.broadcast();
    return new _AudioFrameStream._(userId, timeout, controller, onTimeout);
  }

  void add(AudioFrame packet) {
    _controller.add(packet);
  }

  Future<void> close() => _controller.close();

  @override
  void onUdpError(Object error, StackTrace stackTrace) {
    _controller.addError(error, stackTrace);
  }
}
