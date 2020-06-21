import 'dart:math';
import 'dart:typed_data';
import 'package:convert/convert.dart';
import '../lib/src/model/misc.dart' show CryptState;
import '../lib/src/crypto.dart';
import 'dart:convert';

import 'package:pointycastle/pointycastle.dart';

void main() {
  selfTest();
}

void selfTest() {
  Random r = new Random();
  Uint8List nonce = new Uint8List(16);
  Uint8List key = new Uint8List(16);
  for (int i = 0; i < 16; i++) {
    nonce[i] = r.nextInt(256);
    key[i] = r.nextInt(256);
  }
  CryptState state = new CryptState(
      clientNonce: nonce.sublist(0), serverNonce: nonce.sublist(0), key: key);
  Ocb2Aes128 crypto = new Ocb2Aes128(key: key);
  for (int i = 0; i < 10; i++) {
    Uint8List plain = new Uint8List.fromList(
        utf8.encode('The brown fox chases the white rabbit.'));
    Uint8List encoded = _encode(plain, crypto, state);
    print(encoded);
    Uint8List decoded = _decode(encoded, crypto, state);
    print(utf8.decode(decoded));
  }
}

void testVectors() {
  List<int> nonce = hex.decode('000102030405060708090a0b0c0d0e0f');
  Uint8List key =
      new Uint8List.fromList(hex.decode('000102030405060708090a0b0c0d0e0f'));
  Ocb2Aes128 aes = new Ocb2Aes128(key: key);
  CryptState state = new CryptState(
      key: key,
      clientNonce: new Uint8List.fromList(nonce),
      serverNonce: new Uint8List.fromList(nonce));

  for (Map<String, String> testCase in testCases) {
    print('Name ${testCase['N']}');

    Uint8List plain = new Uint8List.fromList(hex.decode(testCase['M']));
    Uint8List cipher = new Uint8List.fromList(hex.decode(testCase['C']));
    Uint8List tag = new Uint8List.fromList(hex.decode(testCase['T']));

    print('Encrypt:');
    CryptionResult encrypted =
        aes.encrypt(plaintext: plain, state: state, increaseClientNonce: false);
    print('Cipher Equal? ' + same(cipher, encrypted.data).toString());
    print('Tags Equal? ' + same(tag, encrypted.tag).toString());

    print('Decrypt:');
    CryptionResult decrypted = aes.decrypt(
        ciphertext: cipher,
        serverNonceLsb: state.serverNonce[0],
        state: state,
        updateServerNonce: false);
    print('Plain Equal? ' + same(plain, decrypted.data).toString());
    print('Tags Equal? ' + same(tag, decrypted.tag).toString());

    print('');
  }
}

void testAes() {
  Uint8List key = hex.decode("E8E9EAEBEDEEEFF0F2F3F4F5F7F8F9FA");
  BlockCipher aesEcb128Encyrption = new BlockCipher('AES/ECB')
    ..init(true, new KeyParameter(key));
  BlockCipher aesEcb128Decryption = new BlockCipher('AES/ECB')
    ..init(false, new KeyParameter(key));

  print(same(
      hex.decode("6743C3D1519AB4F2CD9A78AB09A511BD"),
      aesEcb128Encyrption
          .process(hex.decode("014BAF2278A69D331D5180103643E99A"))));
  print(same(
      hex.decode("014BAF2278A69D331D5180103643E99A"),
      aesEcb128Decryption
          .process(hex.decode("6743C3D1519AB4F2CD9A78AB09A511BD"))));
}

bool same(Uint8List a, Uint8List b) {
  return hex.encode(a) == hex.encode(b);
}

List<Map<String, String>> testCases = const [
  {
    'N': "OCB-AES-128-0B",
    'M': "",
    'C': "",
    'T': "BF3108130773AD5EC70EC69E7875A7B0",
  },
  {
    'N': "OCB-AES-128-8B",
    'M': "0001020304050607",
    'C': "C636B3A868F429BB",
    'T': "A45F5FDEA5C088D1D7C8BE37CABC8C5C",
  },
  {
    'N': "OCB-AES-128-16B",
    'M': "000102030405060708090A0B0C0D0E0F",
    'C': "52E48F5D19FE2D9869F0C4A4B3D2BE57",
    'T': "F7EE49AE7AA5B5E6645DB6B3966136F9",
  },
  {
    'N': "OCB-AES-128-24B",
    'M': "000102030405060708090A0B0C0D0E0F1011121314151617",
    'C': "F75D6BC8B4DC8D66B836A2B08B32A636CC579E145D323BEB",
    'T': "A1A50F822819D6E0A216784AC24AC84C",
  },
  {
    'N': "OCB-AES-128-32B",
    'M': "000102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F",
    'C': "F75D6BC8B4DC8D66B836A2B08B32A636CEC3C555037571709DA25E1BB0421A27",
    'T': "09CA6C73F0B5C6C5FD587122D75F2AA3",
  },
  {
    'N': "OCB-AES-128-40B",
    'M':
        "000102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F2021222324252627",
    'C':
        "F75D6BC8B4DC8D66B836A2B08B32A6369F1CD3C5228D79FD6C267F5F6AA7B231C7DFB9D59951AE9C",
    'T': "9DB0CDF880F73E3E10D4EB3217766688",
  }
];

Uint8List _encode(Uint8List data, Ocb2Aes128 _crypto, CryptState cryptState) {
  CryptionResult result = _crypto.encrypt(plaintext: data, state: cryptState);
  Uint8List encoded = new Uint8List(4 + result.data.lengthInBytes);
  encoded[0] = cryptState.clientNonce[0];
  encoded[1] = result.tag[0];
  encoded[2] = result.tag[1];
  encoded[3] = result.tag[2];
  encoded.setRange(4, encoded.length, result.data);
  return encoded;
}

Uint8List _decode(Uint8List data, Ocb2Aes128 _crypto, CryptState cryptState) {
  int serverNonceLsb = data[0];
  Uint8List reminder = data.buffer.asUint8List(data.offsetInBytes + 4);
  try {
    CryptionResult result = _crypto.decrypt(
        ciphertext: reminder,
        serverNonceLsb: serverNonceLsb,
        state: cryptState);
    bool tagsMatch = data[1] == result.tag[0] &&
        data[2] == result.tag[1] &&
        data[3] == result.tag[2];
    if (tagsMatch) {
      print('All cool');
      return result.data;
    } else {
      tagMissmatch(data.sublist(1, 4), result.tag.sublist(0, 3));
    }
  } on Exception catch (e) {
    print(e);
  }
}

void tagMissmatch(Uint8List expectedTag, Uint8List receivedTag) {
  print('Tag missmatch! Expected $expectedTag but got $receivedTag');
}
