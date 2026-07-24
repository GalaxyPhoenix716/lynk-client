import 'dart:io';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'encrypt_file_use_case.g.dart';

class EncryptFileUseCase {
  /// Encrypts an input file using AES-256-CBC and returns the encrypted file.
  /// The 16-byte random IV is prepended to the output file payload.
  Future<File> execute({
    required File inputFile,
    required String aesKey32Bytes,
  }) async {
    final key = enc.Key.fromUtf8(aesKey32Bytes);
    final iv = enc.IV.fromSecureRandom(16);

    final encrypter = enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc));
    final fileBytes = await inputFile.readAsBytes();
    final encrypted = encrypter.encryptBytes(fileBytes, iv: iv);

    final outputFile = File('${inputFile.path}.enc');
    final builder = BytesBuilder();
    builder.add(iv.bytes);
    builder.add(encrypted.bytes);

    await outputFile.writeAsBytes(builder.toBytes());
    return outputFile;
  }

  Uint8List executeBytes({
    required Uint8List inputBytes,
    required String aesKey32Bytes,
  }) {
    final key = enc.Key.fromUtf8(aesKey32Bytes);
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
