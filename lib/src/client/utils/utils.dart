import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';

//////////////////////////////
// Helper functions

const HEX_CHARACTERS = '0123456789abcdef';

Uint8List arrayify(dynamic value) {

  // Return buffers as a new byte array
  if (value is Uint8List) {
    return Uint8List.fromList(value.toList());
  }

  if (value is String && RegExp(r'^0x([0-9a-f][0-9a-f])*$', caseSensitive: false).hasMatch(value)) {
    int length = (value.length - 2) ~/ 2;
    Uint8List result = Uint8List(length);
    int offset = 2;
    for (int i = 0; i < length; i++) {
      result[i] = int.parse(value.substring(offset, offset + 2), radix: 16);
      offset += 2;
    }
    return result;
  }

  throw ArgumentError('Invalid input value: $value');
}

String hexlify(dynamic data) {
  final bytes = arrayify(data);

  String result = '0x';
  for (int i = 0; i < bytes.length; i++) {
    final v = bytes[i];
    result += HEX_CHARACTERS[(v & 0xf0) >> 4] + HEX_CHARACTERS[v & 0x0f];
  }
  return result;
}

/// Function to take a byte array and split into chunks of a given size
///
/// [bytes] - The byte array to chunk
/// [chunkSize] - The size of each chunk
/// and returns an array of byte arrays of a specified size
List<Uint8List> chunkAndPadBytes(Uint8List bytes, int chunkSize) {
  List<Uint8List> chunks = [];

  for (int offset = 0; offset < bytes.length; offset += chunkSize) {
    Uint8List chunk = Uint8List(chunkSize);
    chunk.setRange(0, bytes.length - offset > chunkSize ? chunkSize : bytes.length - offset, bytes, offset);
    chunks.add(chunk);
  }

  Uint8List lastChunk = chunks.last;
  int remainingBytes = bytes.length % chunkSize;
  int paddedChunkLength = remainingBytes + ((8 - (remainingBytes % 8)) % 8);
  Uint8List newChunk = lastChunk.sublist(0, paddedChunkLength);
  chunks[chunks.length - 1] = newChunk;

  return chunks;
}

///////////////////////////////
// Extensions

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
