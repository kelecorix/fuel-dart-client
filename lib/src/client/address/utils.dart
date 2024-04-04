import 'dart:typed_data';

import 'package:fuel_api/src/client/address/fuel_bech32.dart';
import 'package:bitcoin_bech32_ng/bitcoin_bech32_ng.dart';
import 'package:fuel_api/src/client/utils/uint.dart';
import 'dart:convert' show utf8;
import 'package:hex/hex.dart';

import 'package:fuel_api/src/client/utils/utils.dart';

/// Fuel Network HRP (human-readable part) for bech32 encoding
const FUEL_BECH32_HRP_PREFIX = 'fuel';

/// Decodes a Bech32 address string into Decoded
Fuel fromBech32(String address) {
  var d = fuel.decode(address);
  return d;
}

// Get String representation of Bech32 addr
String fromBench32Pub(String address){
  return fuel.decode(address).scriptPubKey;
}


/// Converts a B256 address string into Bech32
String toBech32(String address) {

  //  bech32m.toWords(arrayify(hexlify(address)))

  String hexAddr = toHexString(address); //HEX.encode(utf8.encode(address));
  Uint8List data = hexStringtoUint8List(hexAddr);

  var d = arrayify(hexlify(address));

  return fuel.encode(Fuel(FUEL_BECH32_HRP_PREFIX, d));
}

/// Determines if a given string is Bech32 format
bool isBech32(String address) {
  var a = address.startsWith(FUEL_BECH32_HRP_PREFIX);
  var h = fromBech32(address).hrp;

  return address.startsWith(FUEL_BECH32_HRP_PREFIX)
      && fromBech32(address).hrp == FUEL_BECH32_HRP_PREFIX;
}

/// Determines if a given string is B256 format
bool isB256(String address) {
  return address.length == 66 && RegExp(r'^(0x)[0-9a-f]{64}$', caseSensitive: false).hasMatch(address);
}


////////////////////////
// hexlify



/////
/// arrayify