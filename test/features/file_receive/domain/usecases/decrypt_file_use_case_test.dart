import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:client/features/file_transfer/domain/usecases/encrypt_file_use_case.dart';
import 'package:client/features/file_receive/domain/usecases/decrypt_file_use_case.dart';

void main() {
  group('DecryptFileUseCase', () {
    final encryptUseCase = EncryptFileUseCase();
    final decryptUseCase = DecryptFileUseCase();

    late File originalFile;
    late File encryptedFile;
    late File decryptedFile;
    late String aesKey;
    const testContent =
        'Secure client-side end-to-end decryption verification payload.';

    setUp(() async {
      originalFile = File('original_payload_test.txt');
      originalFile.writeAsStringSync(testContent);
      aesKey = 'abcdefghijklmnopqrstuvwxyz123456'; // 32 bytes

      encryptedFile = await encryptUseCase.execute(
        inputFile: originalFile,
        aesKey32Bytes: aesKey,
      );

      decryptedFile = File('decrypted_payload_test.txt');
    });

    tearDown(() {
      if (originalFile.existsSync()) originalFile.deleteSync();
      if (encryptedFile.existsSync()) encryptedFile.deleteSync();
      if (decryptedFile.existsSync()) decryptedFile.deleteSync();
    });

    test(
      'execute extracts prepended IV and decrypts AES-256-CBC ciphertext back to original plaintext',
      () async {
        final result = await decryptUseCase.execute(
          encryptedFile: encryptedFile,
          aesKey32Bytes: aesKey,
          outputPath: decryptedFile.path,
        );

        expect(result.existsSync(), true);
        expect(result.readAsStringSync(), testContent);
      },
    );
  });
}
