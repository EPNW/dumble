import 'dart:io';
import 'model/misc.dart';
import 'audio_packet.dart';
import 'dart:typed_data';
import 'dart:async';
import 'package:meta/meta.dart';
import 'crypto.dart';
import 'client.dart' show CryptStateProvider;

class UdpPingException implements Exception {
  @override
  String toString() =>
      'UdpPingException: Pinging not successfull. This means that the udp transport is too unreliable at the moment. This may change when pinging is succesfull again.';
}

class UdpTransport {
  final InternetAddress remoteHost;
  final dynamic localBindAddress;
  final int localPort;
  final int remotePort;

  final Duration pingIntervall;
  final Duration timeout;

  RawDatagramSocket _transport;
  bool _pingingSuccessfull;
  Completer<void> _pinging;
  final Ocb2Aes128 _crypto;
  final CryptStateProvider _client;

  bool get pingingSuccessfull => _pingingSuccessfull;

  final StreamController<AudioPacket> _audio;

  Stream<AudioPacket> get audio => _audio.stream;

  Duration get latency => _latency;
  Duration _latency;

  UdpTransport(
      {@required this.remoteHost,
      @required this.localPort,
      @required this.remotePort,
      @required this.localBindAddress,
      @required CryptStateProvider cryptStateProvider,
      Duration pingIntervall,
      Duration timeout})
      : this.pingIntervall = pingIntervall ?? const Duration(seconds: 2),
        this.timeout = timeout ?? const Duration(seconds: 5),
        this._audio = new StreamController<AudioPacket>.broadcast(),
        this._pingingSuccessfull = false,
        this._client = cryptStateProvider,
        this._crypto = new Ocb2Aes128(key: cryptStateProvider.cryptState.key);

  static Future<UdpTransport> withRemoteHostLookup(
      {@required String remoteHost,
      @required int localPort,
      @required int remotePort,
      @required dynamic localBindAddress,
      @required CryptStateProvider cryptStateProvider,
      Duration pingIntervall,
      Duration timeout}) async {
    return new UdpTransport(
        remoteHost: (await InternetAddress.lookup(remoteHost,
                type: (localBindAddress == null
                    ? InternetAddressType.IPv4
                    : InternetAddressType.any)))
            .first,
        localPort: localPort,
        remotePort: remotePort,
        localBindAddress: localBindAddress,
        cryptStateProvider: cryptStateProvider,
        pingIntervall: pingIntervall,
        timeout: timeout);
  }

  void close() {
    _pinging?.complete();
  }

  Stream<bool> useUdp({void Function() onResyncRequest}) async* {
    StreamSubscription receiving;
    try {
      _pinging = new Completer<void>();
      _transport = await RawDatagramSocket.bind(
          localBindAddress ?? InternetAddress.anyIPv4, localPort);
      DateTime lastPingReceived;
      receiving = _transport
          .handleError((dynamic error, StackTrace stackTrace) async {
            //TODO
            print(error); //TODO
            print(stackTrace); //TODO
          }, test: (dynamic error) => error is SocketException)
          .where((RawSocketEvent event) => event == RawSocketEvent.read)
          .map((RawSocketEvent _) => _transport.receive())
          .where((Datagram datagram) => datagram != null)
          .map(_decodeDatagram)
          .where((AudioPacket packet) => packet != null)
          .handleError((dynamic error, StackTrace stackTrace) {
            if (onResyncRequest != null && error is NonceOutOfSyncException) {
              onResyncRequest();
            } else {
              lastPingReceived = null;
              throw error; //TODO debug
            }
          })
          .listen((AudioPacket packet) {
            if (packet.type == AudioPacketType.ping) {
              lastPingReceived = new DateTime.now();
              _latency = lastPingReceived.difference(
                  new DateTime.fromMillisecondsSinceEpoch(
                      packet.pingTimestamp));
            } else {
              _audio.add(packet);
            }
          });
      DateTime lastPingSended;
      while (!_pinging.isCompleted) {
        lastPingSended = new DateTime.now();
        AudioPacket ping = new AudioPacket.ping(
            pingTimestamp: lastPingSended.millisecondsSinceEpoch);
        await writePacket(ping);
        await Future.any(
            <Future>[Future.delayed(pingIntervall), _pinging.future]);
        if (!_pinging.isCompleted) {
          if (lastPingReceived != null) {
            if (lastPingReceived.difference(lastPingSended) >= timeout) {
              if (_pingingSuccessfull) {
                _pingingSuccessfull = false;
                _latency = null;
                yield false;
              }
            } else {
              if (!_pingingSuccessfull) {
                _pingingSuccessfull = true;
                yield true;
              }
            }
          }
        }
      }
    } finally {
      await receiving?.cancel();
      await _audio.close();
      _transport?.close();
    }
  }

  Uint8List _encode(Uint8List data) {
    CryptionResult result =
        _crypto.encrypt(plaintext: data, state: _client.cryptState);
    Uint8List encoded = new Uint8List(4 + result.data.lengthInBytes);
    encoded[0] = _client.cryptState.clientNonce[0];
    encoded[1] = result.tag[0];
    encoded[2] = result.tag[1];
    encoded[3] = result.tag[2];
    encoded.setRange(4, encoded.length, result.data);
    return encoded;
  }

  Uint8List _decode(Uint8List data) {
    int serverNonceLsb = data[0];
    Uint8List reminder =
        data.buffer.asUint8List(data.offsetInBytes + 4, data.lengthInBytes - 4);
    try {
      CryptionResult result = _crypto.decrypt(
          ciphertext: reminder,
          serverNonceLsb: serverNonceLsb,
          state: _client.cryptState);
      bool tagsMatch = data[1] == result.tag[0] &&
          data[2] == result.tag[1] &&
          data[3] == result.tag[2];
      if (tagsMatch) {
        return result.data;
      } else {
        throw new _DecryptionException.tagMissmatch(
            data.sublist(1, 4), result.tag.sublist(0, 3));
      }
    } on NonceOutOfSyncException {
      rethrow;
    }
  }

  AudioPacket _decodeDatagram(Datagram datagram) {
    try {
      if (datagram.address == remoteHost && datagram.port == remotePort) {
        return new AudioPacket.incoming(data: _decode(datagram.data));
      } else {
        return null;
      }
    } on _DecryptionException {
      return null;
    }
  }

  void writePacket(AudioPacket packet) {
    _BufferSink sink = new _BufferSink();
    packet.writeTo(sink);
    sink.close();
    Uint8List encoded = _encode(sink.data);
    _transport.send(encoded, remoteHost, remotePort);
  }
}

class _DecryptionException implements Exception {
  final String _msg;
  const _DecryptionException.tagMissmatch(
      Uint8List expectedTag, Uint8List receivedTag)
      : this._msg = 'Tag missmatch! Expected $expectedTag but got $receivedTag';

  @override
  String toString() => _msg;
}

class _BufferSink extends StreamSink<List<int>> {
  final Completer<void> _done;
  final List<List<int>> _buffer;
  Uint8List _data;
  Uint8List get data => _done.isCompleted ? _data : null;

  _BufferSink()
      : this._buffer = new List<List<int>>(),
        this._done = new Completer<void>();

  @override
  void add(List<int> event) {
    if (!_done.isCompleted) {
      _buffer.add(event);
    }
  }

  @override
  void addError(Object error, [StackTrace stackTrace]) {
    throw error;
  }

  @override
  Future<void> addStream(Stream<List<int>> stream) async {
    await for (List<int> element in stream) {
      add(element);
    }
  }

  @override
  Future<void> close() {
    if (!_done.isCompleted) {
      int size = 0;
      for (List<int> list in _buffer) {
        size += list.length;
      }
      _data = new Uint8List(size);
      int index = 0;
      for (List<int> list in _buffer) {
        _data.setRange(index, index + list.length, list);
        index += list.length;
      }
      _done.complete();
    }
    return new Future<void>.value();
  }

  @override
  Future<void> get done => _done.future;
}
