import 'dart:typed_data';

import 'package:pointycastle/pointycastle.dart';

import 'model/crypto.dart';

const int AES_BLOCK_SIZE = 16; // 16 bytes == 128 bits
const int SHIFTBITS = 7;

class CryptionResult {
  final Uint8List tag, data;
  const CryptionResult({required this.tag, required this.data});
}

class Ocb2Aes128 {
  final BlockCipher _aesEcb128Encyrption;
  final BlockCipher _aesEcb128Decryption;

  Ocb2Aes128({required Uint8List key})
      : this._aesEcb128Encyrption = new BlockCipher('AES/ECB')
          ..init(true, new KeyParameter(key)),
        this._aesEcb128Decryption = new BlockCipher('AES/ECB')
          ..init(false, new KeyParameter(key));

  Uint8List _aesEncrypt(Uint8List plaintext) =>
      _aesEcb128Encyrption.process(plaintext);

  Uint8List _aesDecrypt(Uint8List ciphertext) =>
      _aesEcb128Decryption.process(ciphertext);

  CryptionResult encrypt(
      {required Uint8List plaintext,
      required CryptState state,
      bool increaseClientNonce: true}) {
    if (increaseClientNonce) {
      state.increaseClientNonce();
    }
    int lengthRemaining = plaintext.length;
    Uint8List dst = new Uint8List(plaintext.length);
    Uint8List checksum = new Uint8List(AES_BLOCK_SIZE);
    Uint8List tmp = new Uint8List(AES_BLOCK_SIZE);
    Uint8List delta = _aesEncrypt(state.clientNonce);
    int offset = 0;
    while (lengthRemaining > AES_BLOCK_SIZE) {
      //buffer = plaintext[offset:offset + AES_BLOCK_SIZE]
      Uint8List buffer = plaintext.sublist(offset, offset + AES_BLOCK_SIZE);
      _s2(delta);
      _xor(checksum, checksum, buffer);
      _xor(tmp, delta, buffer);
      tmp = _aesEncrypt(tmp);
      _xor(buffer, delta, tmp);
      //for i, value in enumerate(buffer): dst[i + offset] = value
      dst.setRange(offset, offset + AES_BLOCK_SIZE, buffer);
      lengthRemaining -= AES_BLOCK_SIZE;
      offset += AES_BLOCK_SIZE;
    }
    _s2(delta);
    _zero(tmp);
    int n = lengthRemaining * 8;
    tmp[AES_BLOCK_SIZE - 2] = ((n >> 8) & 0xFF);
    tmp[AES_BLOCK_SIZE - 1] = n & 0xFF;
    _xor(tmp, tmp, delta);
    Uint8List pad = _aesEncrypt(tmp);
    //for i, value in enumerate(plaintext[offset:offset + length_remaining]): tmp[i] = value
    tmp.setRange(0, lengthRemaining, plaintext, offset);
    //for i, value in enumerate(pad[length_remaining:AES_BLOCK_SIZE]): tmp[i + length_remaining] = value
    tmp.setRange(lengthRemaining, AES_BLOCK_SIZE, pad, lengthRemaining);
    _xor(checksum, checksum, tmp);
    _xor(tmp, pad, tmp);

    //for i, value in enumerate(tmp[0:length_remaining]): dst[i + offset] = value
    dst.setRange(offset, offset + lengthRemaining, tmp);
    _s3(delta);
    _xor(tmp, delta, checksum);
    Uint8List tag = _aesEncrypt(tmp);
    return new CryptionResult(tag: tag, data: dst);
  }

  CryptionResult decrypt(
      {required Uint8List ciphertext,
      required int serverNonceLsb,
      required CryptState state,
      bool updateServerNonce: true}) {
    if (updateServerNonce) {
      state.updateServerNonce(serverNonceLsb);
    }
    int lengthRemaining = ciphertext.length;
    Uint8List dst = new Uint8List(ciphertext.length);
    Uint8List checksum = new Uint8List(AES_BLOCK_SIZE);
    Uint8List tmp = new Uint8List(AES_BLOCK_SIZE);
    Uint8List delta = _aesEncrypt(state.serverNonce);
    int offset = 0;

    while (lengthRemaining > AES_BLOCK_SIZE) {
      Uint8List buffer = ciphertext.sublist(offset, offset + AES_BLOCK_SIZE);
      _s2(delta);
      _xor(tmp, delta, buffer);
      tmp = _aesDecrypt(tmp);
      _xor(buffer, delta, tmp);
      //for i, value in enumerate(buffer): dst[i + offset] = value
      dst.setRange(offset, offset + AES_BLOCK_SIZE, buffer);
      _xor(checksum, checksum, buffer);
      lengthRemaining -= AES_BLOCK_SIZE;
      offset += AES_BLOCK_SIZE;
    }
    _s2(delta);
    _zero(tmp);
    int n = lengthRemaining * 8;
    tmp[AES_BLOCK_SIZE - 2] = ((n >> 8) & 0xFF);
    tmp[AES_BLOCK_SIZE - 1] = n & 0xFF;
    _xor(tmp, tmp, delta);
    Uint8List pad = _aesEncrypt(tmp);
    _zero(tmp);
    //  for i, value in enumerate(ciphertext[offset:offset + length_remaining]): tmp[i] = value
    tmp.setRange(0, lengthRemaining, ciphertext, offset);
    _xor(tmp, tmp, pad);
    _xor(checksum, checksum, tmp);
    //  for i, value in enumerate(tmp[0:length_remaining]): dst[i + offset] = value
    dst.setRange(offset, offset + lengthRemaining, tmp);
    _s3(delta);
    _xor(tmp, delta, checksum);
    Uint8List tag = _aesEncrypt(tmp);
    return new CryptionResult(tag: tag, data: dst);
  }
}

void _zero(Uint8List block) {
  for (int i = 0; i < block.length; i++) {
    block[i] = 0;
  }
}

void _s3(Uint8List block) {
  int carry = (block[0] >> SHIFTBITS) & 0x1;
  for (int i = 0; i < AES_BLOCK_SIZE - 1; i++) {
    block[i] ^= ((block[i] << 1) | ((block[i + 1] >> SHIFTBITS) & 0x1)) & 0xFF;
  }
  block[AES_BLOCK_SIZE - 1] ^=
      ((block[AES_BLOCK_SIZE - 1] << 1) ^ (carry * 0x87)) & 0xFF;
}

void _s2(Uint8List block) {
  int carry = (block[0] >> SHIFTBITS) & 0x1;
  for (int i = 0; i < AES_BLOCK_SIZE - 1; i++) {
    block[i] = ((block[i] << 1) | ((block[i + 1] >> SHIFTBITS) & 0x1)) & 0xFF;
  }
  block[AES_BLOCK_SIZE - 1] =
      ((block[AES_BLOCK_SIZE - 1] << 1) ^ (carry * 0x87)) & 0xFF;
}

void _xor(Uint8List dst, Uint8List a, Uint8List b) {
  for (int i = 0; i < AES_BLOCK_SIZE; i++) {
    dst[i] = a[i] ^ b[i];
  }
}
