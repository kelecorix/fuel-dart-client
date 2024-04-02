import 'dart:convert';
import 'package:bitcoin_bech32_ng/bitcoin_bech32_ng.dart';

/// An instance of the default implementation of the FuelCodec
const FuelCodec fuel = FuelCodec();

/// A codec which converts a Segwit class to its String representation and vice versa.
class FuelCodec extends Codec<Fuel, String> {
  const FuelCodec();

  @override
  FuelDecoder get decoder => FuelDecoder();
  @override
  FuelEncoder get encoder => FuelEncoder();

  @override
  String encode(Fuel data) {
    return FuelEncoder().convert(data);
  }

  @override
  Fuel decode(String data) {
    return FuelDecoder().convert(data);
  }
}

/// This class converts a Fuel class instance to a String.
class FuelEncoder extends Converter<Fuel, String> with FuelValidations {
  @override
  String convert(Fuel input) {
    var program = input.program;

    if (isTooShortProgram(program)) {
      throw InvalidProgramLength('too short');
    }

    if (isTooLongProgram(program)) {
      throw InvalidProgramLength('too long');
    }

    var data = _convertBits(program, 8, 5, true);

    return bech32m.encode(Bech32m(input.hrp, data));
  }
}

/// This class converts a String to a Fuel class instance.
class FuelDecoder extends Converter<String, Fuel> with FuelValidations {
  @override
  Fuel convert(String input) {
    var decoded = bech32m.decode(input);

    if (isEmptyProgram(decoded.data)) {
      throw InvalidProgramLength('empty');
    }

    var program = _convertBits(decoded.data, 5, 8, false);

    if (isTooShortProgram(program)) {
      throw InvalidProgramLength('too short');
    }

    if (isTooLongProgram(program)) {
      throw InvalidProgramLength('too long');
    }

    return Fuel("fuel", program);
  }
}

/// Generic validations for a Fuel class.
class FuelValidations {
  bool isEmptyProgram(List<int> data) {
    return data.isEmpty;
  }

  bool isTooLongProgram(List<int> program) {
    return program.length > 40;
  }

  bool isTooShortProgram(List<int> program) {
    return program.length < 2;
  }
}

/// A representation of a Fuel Bech32 address. This class can be used to obtain the `scriptPubKey`.
class Fuel {
  Fuel(this.hrp, this.program);

  final String hrp;
  final List<int> program;

  String get scriptPubKey {
    return program
        .map((c) => c.toRadixString(16).padLeft(2, '0'))
        .toList()
        .join('');
  }
}

List<int> _convertBits(List<int> data, int from, int to, bool pad) {
  var acc = 0;
  var bits = 0;
  var result = <int>[];
  var maxv = (1 << to) - 1;

  data.forEach((v) {
    if (v < 0 || (v >> from) != 0) {
      throw Exception();
    }
    acc = (acc << from) | v;
    bits += from;
    while (bits >= to) {
      bits -= to;
      result.add((acc >> bits) & maxv);
    }
  });

  if (pad) {
    if (bits > 0) {
      result.add((acc << (to - bits)) & maxv);
    }
  }
  return result;
}

List<int> toWords(List<int> data ) {
  return _convertBits(data, 8, 5, true);
}
