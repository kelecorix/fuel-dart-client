import 'package:bech32/bech32.dart';
import 'package:convert/convert.dart';

/// Fuel Network HRP (human-readable part) for bech32 encoding
const FUEL_BECH32_HRP_PREFIX = 'fuel';

/// Decodes a Bech32 address string into Decoded
Decoded fromBech32(String address) {
  return bech32Decode(address);
}

/// Converts a B256 address string into Bech32
String toBech32(String address) {
  return bech32Encode(
    FUEL_BECH32_HRP_PREFIX,
    bech32.convertBits(hex.decode(address), 8, 5, true),
  );
}

/// Determines if a given string is Bech32 format
bool isBech32(dynamic address) {
  if (address is! String) return false;
  return address.startsWith(FUEL_BECH32_HRP_PREFIX) && fromBech32(address).hrp == FUEL_BECH32_HRP_PREFIX;
}

/// Determines if a given string is B256 format
bool isB256(String address) {
  return address.length == 66 && RegExp(r'^(0x)[0-9a-f]{64}$', caseSensitive: false).hasMatch(address);
}

