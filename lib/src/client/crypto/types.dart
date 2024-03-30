import 'dart:typed_data';
import 'dart:async';

abstract class Keystore {
  late String data;
  late String iv;
  late String salt;
}

abstract class IScryptParams {
  late Uint8List password;
  late Uint8List salt;
  late int n;
  late int p;
  late int r;
  late int dklen;
}

enum Encoding {utf8, base64, hex} //'utf-8' | 'base64' | 'hex'

abstract class CryptoApi {
  Uint8List bufferFromString(String string, [Encoding encoding = Encoding.utf8]);
  Future<T> decrypt<T>(String password, Keystore keystore);
  Future<Keystore> encrypt<T>(String password, T data);
  Uint8List keyFromPassword(String password, Uint8List saltBuffer);
  String stringFromBuffer(Uint8List buffer, [Encoding encoding = Encoding.utf8]);
  Uint8List randomBytes(int length);
  Uint8List scrypt(IScryptParams params);
  Uint8List keccak256(Uint8List data);
  Future<Uint8List> encryptJsonWalletData(Uint8List data, Uint8List key, Uint8List iv);
  Future<Uint8List> decryptJsonWalletData(Uint8List data, Uint8List key, Uint8List iv);
}

