import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:client/features/file_transfer/domain/usecases/encrypt_file_use_case.dart';

void main() {
  group('EncryptFileUseCase', () {
    final useCase = EncryptFileUseCase();
    late File tempFile;
    late String aesKey;

    setUp(() {
      tempFile = File('dummy_encrypt_test.txt');
      tempFile.writeAsStringSync('Hello World from cryptographic tests!');
      // 32-character key
      aesKey = '12345678901234567890123456789012';
    });

    tearDown(() {
      if (tempFile.existsSync()) {
        tempFile.deleteSync();
      }
      final encFile = File('${tempFile.path}.enc');
      if (encFile.existsSync()) {
        encFile.deleteSync();
      }
    });

    test(
      'execute encrypts input file and outputs prepended 16-byte IV header + ciphertext',
      () async {
        final encryptedFile = await useCase.execute(
          inputFile: tempFile,
          aesKey32Bytes: aesKey,
        );

        expect(encryptedFile.existsSync(), true);

        final encryptedBytes = encryptedFile.readAsBytesSync();
        // Original size is 37 bytes.
        // PKCS7 padding of 37 bytes gives 48 bytes of ciphertext.
        // IV is 16 bytes. Total expected length is 16 + 48 = 64 bytes.
        expect(encryptedBytes.length, 64);

        // Ensure ciphertext is different from plain text
        final plainTextBytes = tempFile.readAsBytesSync();
        final ciphertextBytes = encryptedBytes.sublist(16);
        expect(ciphertextBytes, isNot(equals(plainTextBytes)));
      },
    );
  });
}
