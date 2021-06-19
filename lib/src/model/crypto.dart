import 'dart:typed_data';
import 'package:meta/meta.dart';

import '../generated/Mumble.pb.dart' as Proto;
import '../utils.dart' show JsonString;

class NonceOutOfSyncException implements Exception {}

/// Tries to create a new CrytState.
///
/// Some fields might be missing in the proto message so we fall back to
/// the current CryptState. BUT if this is actually the first CryptState message
/// received there is no current CryptState to fall back to, so in this case we
/// return null since we can not construct a valid object.
@protected
CryptState? cryptStateFromProto(
    Proto.CryptSetup crypt, CryptState? currentCryptState) {
  Uint8List? clientNonce =
      (crypt.hasClientNonce() && crypt.clientNonce.isNotEmpty)
          ? new Uint8List.fromList(crypt.clientNonce)
          : null;
  Uint8List? serverNonce =
      (crypt.hasServerNonce() && crypt.serverNonce.isNotEmpty)
          ? new Uint8List.fromList(crypt.serverNonce)
          : null;
  Uint8List? key = (crypt.hasKey() && crypt.key.isNotEmpty)
      ? new Uint8List.fromList(crypt.key)
      : null;
  if (currentCryptState != null) {
    return new CryptState._(
        key: key ?? currentCryptState.key,
        clientNonce: clientNonce ?? currentCryptState.clientNonce,
        serverNonce: serverNonce ?? currentCryptState.serverNonce);
  } else if (clientNonce != null && serverNonce != null && key != null) {
    return new CryptState._(
        key: key, clientNonce: clientNonce, serverNonce: serverNonce);
  } else {
    return null;
  }
}

class CryptState with JsonString {
  final Uint8List key;
  Uint8List get clientNonce => _clientNonce;
  Uint8List get serverNonce => _serverNonce;

  Uint8List _clientNonce;
  Uint8List _serverNonce;

  CryptState._(
      {required this.key,
      required Uint8List clientNonce,
      required Uint8List serverNonce})
      : this._serverNonce = serverNonce,
        this._clientNonce = clientNonce;

  void increaseClientNonce() {
    _passOn(_clientNonce, 0);
  }

  void updateServerNonce(int uint8Lsb) {
    int difference = uint8Lsb - serverNonce[0];
    if (difference != 1) {
      //packets were received out of order
      if (difference > 30) {
        //30 seems to be arbitrary; it's used in the official client source, so I use it here
        //we wrapped around back to zero, they are still on high numbers
        //solution: we copy their lsb and undo the wraping
        serverNonce[0] = uint8Lsb;
        _passBack(serverNonce, 1);
      } else if (difference < -30) {
        //they wrapped around back to zero, we are still on high numbers
        //solution: we copy their lsb and wrap too
        serverNonce[0] = uint8Lsb;
        _passOn(serverNonce, 1);
      } else if (difference == 0) {
        // we either missed some multiple of exactly 255 packets, or they sent two packets with the same nonce
        // this should pretty much never happen unless the server screws up, or the network is REALLY bad
        throw new NonceOutOfSyncException();
      } else {
        //messages might be out of order here but its not so bad that we need wraping
        //solution: just copy their lsb and hope thats enough...
        serverNonce[0] = uint8Lsb;
      }
    } else {
      //no wrapping here, all messages in order, just copy their lsb
      serverNonce[0] = uint8Lsb;
    }
  }

  ///Increases the byte at offset by one.
  ///If it overflows (greater than 255) it sets it to 0 and increases the byte at offset+1 by one, and so on.
  ///If the last byte also overflowes true is returned, false otherwise.
  bool _passOn(Uint8List target, int offset) {
    for (int i = offset; i < target.length; i++) {
      int j = target[i] + 1;
      if (j <= 255) {
        target[i] = j;
        return false;
      } else {
        target[i] = 0;
      }
    }
    //Overflow
    return true;
  }

  ///Decreases the byte at offset by one.
  ///If it underflows (smaller than 0) it sets it to 255 and decreases the byte at offset+1 by one, and so on.
  ///If the last byte also underflows true is returned, false otherwise.
  bool _passBack(Uint8List target, int offset) {
    for (int i = offset; i < target.length; i++) {
      int j = target[i] - 1;
      if (j >= 0) {
        target[i] = j;
        return false;
      } else {
        target[i] = 255;
      }
    }
    //Underflow
    return true;
  }

  @override
  Map<String, Object> jsonMap() => new Map<String, Object>()
    ..['key'] = key
    ..['clientNonce'] = clientNonce
    ..['serverNonce'] = serverNonce;
}
