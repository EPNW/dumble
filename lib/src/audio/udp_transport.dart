import 'dart:io';
import '../model/crypto.dart';
import 'audio_packet.dart';
import 'dart:typed_data';
import 'dart:async';
import '../crypto.dart';
import '../client.dart' show CryptStateProvider;
import '../utils.dart' show FilterNullStream;

class UdpPingException implements Exception {
  @override
  String toString() =>
      'UdpPingException: Pinging not successfull. This means that the udp transport is too unreliable at the moment. This may change when pinging is succesfull again.';
}

typedef void ResyncRequestHandler();

abstract class UdpTransport {
  InternetAddress get remoteHost;
  Object? get localBindAddress;
  int get localPort;
  int get remotePort;
  Duration get pingIntervall;
  Duration get timeout;
  bool get pingingSuccessfull;
  Stream<IncomingAudioPacket> get audio;
  Duration? get latency;

  void writePacket(AudioPacket packet);
  Stream<bool> useUdp({ResyncRequestHandler? onResyncRequest});
  void close();

  static Future<UdpTransport> withRemoteHostLookup(
      {required String remoteHost,
      required int localPort,
      required int remotePort,
      Object? localBindAddress,
      required CryptStateProvider cryptStateProvider,
      Duration? pingIntervall,
      Duration? timeout}) async {
    return new _UdpTransportBase(
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
}

class _UdpTransportBase extends UdpTransport {
  @override
  final InternetAddress remoteHost;
  @override
  final Object? localBindAddress;
  @override
  final int localPort;
  @override
  final int remotePort;

  @override
  final Duration pingIntervall;
  @override
  final Duration timeout;

  RawDatagramSocket? _transport;
  bool _pingingSuccessfull;
  Completer<void>? _pinging;
  final Ocb2Aes128 _crypto;
  final CryptStateProvider _client;

  @override
  bool get pingingSuccessfull => _pingingSuccessfull;

  final StreamController<IncomingAudioPacket> _audio;

  @override
  Stream<IncomingAudioPacket> get audio => _audio.stream;

  @override
  Duration? get latency => _latency;
  Duration? _latency;

  _UdpTransportBase(
      {required this.remoteHost,
      required this.localPort,
      required this.remotePort,
      required this.localBindAddress,
      required CryptStateProvider cryptStateProvider,
      Duration? pingIntervall,
      Duration? timeout})
      : this.pingIntervall = pingIntervall ?? const Duration(seconds: 2),
        this.timeout = timeout ?? const Duration(seconds: 5),
        this._audio = new StreamController<IncomingAudioPacket>.broadcast(),
        this._pingingSuccessfull = false,
        this._client = cryptStateProvider,
        this._crypto = new Ocb2Aes128(key: cryptStateProvider.cryptState.key);

  @override
  void close() {
    Completer<void>? pinging = _pinging;
    if (pinging != null) {
      if (!pinging.isCompleted) {
        pinging.complete();
      }
    }
  }

  @override
  Stream<bool> useUdp({ResyncRequestHandler? onResyncRequest}) async* {
    StreamSubscription? receiving;
    try {
      _pinging = new Completer<void>();
      _transport = await RawDatagramSocket.bind(
          localBindAddress ?? InternetAddress.anyIPv4, localPort);
      DateTime? lastPingReceived;
      receiving = _transport!
          .handleError((dynamic error, StackTrace? stackTrace) async {
            //TODO
            print(error); //TODO
            print(stackTrace); //TODO
          }, test: (dynamic error) => error is SocketException)
          .where((RawSocketEvent event) => event == RawSocketEvent.read)
          .map<Datagram?>((RawSocketEvent _) => _transport!.receive())
          .filterNull()
          .map(_decodeDatagram)
          .filterNull()
          .handleError((dynamic error, StackTrace stackTrace) {
            if (onResyncRequest != null && error is NonceOutOfSyncException) {
              onResyncRequest();
            } else {
              lastPingReceived = null;
              throw error; //TODO debug
            }
          })
          .listen((AudioPacket packet) {
            if (packet is PingPacket) {
              DateTime now = new DateTime.now();
              lastPingReceived = now;
              _latency = now.difference(new DateTime.fromMillisecondsSinceEpoch(
                  packet.pingTimestamp));
            } else if (packet is IncomingAudioPacket) {
              _audio.add(packet);
            } else {
              throw new ArgumentError(
                  'It should be impossible to recieve anything else then a PingPacket or IncomingAudioPacket here!' +
                      'Recieved ${packet.runtimeType}: $packet');
            }
          });
      DateTime lastPingSended;
      while (_stillPinging()) {
        lastPingSended = new DateTime.now();
        writePacket(new PingPacket.outgoing(
            pingTimestamp: lastPingSended.millisecondsSinceEpoch));
        await Future.any(
            <Future>[Future.delayed(pingIntervall), _pinging!.future]);
        if (_stillPinging()) {
          if (lastPingReceived != null) {
            if (lastPingReceived!.difference(lastPingSended) >= timeout) {
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
      _transport = null;
      _latency = null;
      _pinging = null;
    }
  }

  bool _stillPinging() {
    if (_pinging != null) {
      return _pinging!.isCompleted;
    } else {
      return false;
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

  AudioPacket? _decodeDatagram(Datagram datagram) {
    try {
      if (datagram.address == remoteHost && datagram.port == remotePort) {
        return decodeIncoming(data: _decode(datagram.data));
      } else {
        return null;
      }
    } on _DecryptionException {
      return null;
    }
  }

  @override
  void writePacket(AudioPacket packet) {
    RawDatagramSocket? transport = _transport;
    if (transport != null) {
      _BufferSink sink = new _BufferSink();
      packet.writeTo(sink);
      sink.closeSync();
      Uint8List encoded = _encode(sink.data);
      transport.send(encoded, remoteHost, remotePort);
    } else {
      //TODO maybe just ignore since udp is connection less in the first place? Or introduce a return value and return false?
      throw new StateError('Can not write a packet on a unbound socket!');
    }
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
  Uint8List? _data;
  bool get isDone => _done.isCompleted;
  Uint8List get data => isDone
      ? _data!
      : throw new StateError(
          'Accessing the data is only allowed after this sink is done!');

  _BufferSink()
      : this._buffer = <List<int>>[],
        this._done = new Completer<void>();

  @override
  void add(List<int> event) {
    if (!isDone) {
      _buffer.add(event);
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    throw error;
  }

  @override
  Future<void> addStream(Stream<List<int>> stream) async {
    await for (List<int> element in stream) {
      add(element);
    }
  }

  @override
  Future<void> close() async {
    closeSync();
  }

  void closeSync() {
    if (!isDone) {
      int size = 0;
      for (List<int> list in _buffer) {
        size += list.length;
      }
      Uint8List data = new Uint8List(size);
      int index = 0;
      for (List<int> list in _buffer) {
        data.setRange(index, index + list.length, list);
        index += list.length;
      }
      _data = data;
      _done.complete();
    }
  }

  @override
  Future<void> get done => _done.future;
}
