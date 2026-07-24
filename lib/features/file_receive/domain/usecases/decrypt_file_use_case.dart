import 'dart:io';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'decrypt_file_use_case.g.dart';

class DecryptFileUseCase {
  /// Decrypts an encrypted file using AES-256-CBC and returns the decrypted file.
  /// The first 16 bytes are extracted as the IV, and the rest is decrypted.
  Future<File> execute({
    required File encryptedFile,
    required String aesKey32Bytes,
    required String outputPath,
  }) async {
    final encryptedBytes = await encryptedFile.readAsBytes();
    if (encryptedBytes.length < 16) {
      throw const FormatException(
        'Encrypted file payload is truncated or invalid',
      );
    }

    final ivBytes = encryptedBytes.sublist(0, 16);
    final ciphertext = encryptedBytes.sublist(16);

    final key = enc.Key.fromUtf8(aesKey32Bytes);
    final iv = enc.IV(ivBytes);

    final encrypter = enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc));
    final decryptedBytes = encrypter.decryptBytes(
      enc.Encrypted(ciphertext),
      iv: iv,
    );

    final outputFile = File(outputPath);
    await outputFile.writeAsBytes(decryptedBytes);
    return outputFile;
  }

  /// Decrypts encrypted bytes in-memory for Web targets
  Uint8List executeBytes({
    required Uint8List encryptedBytes,
    required String aesKey32Bytes,
  }) {
    if (encryptedBytes.length < 16) {
      throw const FormatException(
        'Encrypted bytes payload is truncated or invalid',
      );
    }

    final ivBytes = encryptedBytes.sublist(0, 16);
    final ciphertext = encryptedBytes.sublist(16);

    final key = enc.Key.fromUtf8(aesKey32Bytes);
    final iv = enc.IV(ivBytes);

    final encrypter = enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc));
    return Uint8List.fromList(
      encrypter.decryptBytes(enc.Encrypted(ciphertext), iv: iv),
    );
  }
}

@riverpod
DecryptFileUseCase decryptFileUseCase(Ref ref) {
  return DecryptFileUseCase();
}
