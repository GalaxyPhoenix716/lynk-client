import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'encrypt_file_use_case.g.dart';

class EncryptFileUseCase {
  static String _sanitizeKey(String key) {
    final clean = key.trim();
    if (clean.length == 32) return clean;
    if (clean.length > 32) return clean.substring(0, 32);
    return clean.padRight(32, '0');
  }

  /// Encrypts an input file using AES-256-CBC and returns the encrypted file.
  /// The 16-byte random IV is prepended to the output file payload.
  /// Execution is offloaded to a background Dart Isolate to ensure UI smoothness.
  Future<File> execute({
    required File inputFile,
    required String aesKey32Bytes,
  }) async {
    final inputPath = inputFile.path;
    final outputPath = '$inputPath.enc';
    final keyStr = _sanitizeKey(aesKey32Bytes);

    await Isolate.run(() async {
      final key = enc.Key.fromUtf8(keyStr);
      final iv = enc.IV.fromSecureRandom(16);

      final encrypter = enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc));
      final fileBytes = await File(inputPath).readAsBytes();
      final encrypted = encrypter.encryptBytes(fileBytes, iv: iv);

      final builder = BytesBuilder();
      builder.add(iv.bytes);
      builder.add(encrypted.bytes);

      await File(outputPath).writeAsBytes(builder.toBytes());
    });

    return File(outputPath);
  }

  Uint8List executeBytes({
    required Uint8List inputBytes,
    required String aesKey32Bytes,
  }) {
    final keyStr = _sanitizeKey(aesKey32Bytes);
    final key = enc.Key.fromUtf8(keyStr);
    final iv = enc.IV.fromSecureRandom(16);

    final encrypter = enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc));
    final encrypted = encrypter.encryptBytes(inputBytes, iv: iv);

    final builder = BytesBuilder();
    builder.add(iv.bytes);
    builder.add(encrypted.bytes);
    return builder.toBytes();
  }
}

@riverpod
EncryptFileUseCase encryptFileUseCase(Ref ref) {
  return EncryptFileUseCase();
}
