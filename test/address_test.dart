import 'package:fuel_api/fuel_api.dart';
import 'package:fuel_api/src/client/address/utils.dart' as utils;
import 'package:fuel_api/src/client/ed25519_keypair.dart';
import 'package:test/test.dart';

String PUBLIC_KEY =
    '0x2f34bc0df4db0ec391792cedb05768832b49b1aa3a2dd8c30054d1af00f67d00b74b7acbbf3087c8e0b1a4c343db50aa471d21f278ff5ce09f07795d541fb47e';
String ADDRESS_B256 = '0xef86afa9696cf0dc6385e2c407a6e159a1103cefb7e2ae0636fb33d3cb2a9e4a';
String ADDRESS_B256_EVM_PADDED = '0x00000000000000000000000007a6e159a1103cefb7e2ae0636fb33d3cb2a9e4a';
String ADDRESS_EVM = '0x07a6e159a1103cefb7e2ae0636fb33d3cb2a9e4a';
String ADDRESS_BECH32 = 'fuel1a7r2l2tfdncdccu9utzq0fhptxs3q080kl32up3klvea8je2ne9qrqnt6n';
var ADDRESS_WORDS = [
  29,
  30,
  3,
  10,
  31,
  10,
  11,
  9,
  13,
  19,
  24,
  13,
  24,
  24,
  28,
  5,
  28,
  11,
  2,
  0,
  15,
  9,
  23,
  1,
  11,
  6,
  16,
  17,
  0,
  15,
  7,
  15,
  22,
  31,
  17,
  10,
  28,
  1,
  17,
  22,
  31,
  12,
  25,
  29,
  7,
  18,
  25,
  10,
  19,
  25,
  5,
  0,
];
var ADDRESS_BYTES = [
  239,
  134,
  175,
  169,
  105,
  108,
  240,
  220,
  99,
  133,
  226,
  196,
  7,
  166,
  225,
  89,
  161,
  16,
  60,
  239,
  183,
  226,
  174,
  6,
  54,
  251,
  51,
  211,
  203,
  42,
  158,
  74,
];

String expectedAddress = 'fuel1785jcs4epy625cmjuv9u269rymmwv6s6q2y9jhnw877nj2j08ehqce3rxf';
String expectedB256Address = '0xf1e92c42b90934aa6372e30bc568a326f6e66a1a0288595e6e3fbd392a4f3e6e';

void main() {
  // test('should understand bech32 address', () {
  //   final Ed25519Keypair kp1 = Ed25519Keypair.generate();
  //   Keypair keypair = Keypair();
  //   keypair.secretKey = kp1.secretKey;
  //   keypair.publicKey = kp1.publicKey;
  //   keypair.mnemonic = kp1.mnemonic;
  //
  //   final kp2 = Ed25519Keypair(keypair); // Ed25519Keypair and Keypair different types
  //
  //   expect(kp1.publicKey, kp2.publicKey);
  // });
  //
  // test('is B256?', () {
  //   utils.isB256("");
  // });
  //
  test('is Bech32?', () {
    var res = utils.isBech32(ADDRESS_BECH32);
    //print(res);
    expect(res, true);
  });

  test('toBech32 (b256 to bech32)', () {
    var res = utils.toBech32(ADDRESS_B256);
    //print(res);
    expect(res, ADDRESS_BECH32);
  });

  // test('from Bech32?', () {
  //   var res = utils.fromBech32(ADDRESS_BECH32);
  //   print(res.scriptPubKey);
  //   expect(res.scriptPubKey, expectedB256Address);
  // });
}
