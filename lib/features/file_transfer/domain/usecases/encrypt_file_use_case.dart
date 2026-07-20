import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'encrypt_file_use_case.g.dart';

class EncryptFileUseCase {
  /// Foundation for client-side file encryption (Sender Flow).
  /// Currently returns the original file unchanged (pass-through).
  /// Replace with AES-256-GCM / ChaCha20-Poly1305 encryption when ready.
  Future<File> execute({required File file, String? secretKey}) async {
    // TODO: Implement client-side encryption logic
    return file;
  }
}

@riverpod
EncryptFileUseCase encryptFileUseCase(Ref ref) {
  return EncryptFileUseCase();
}
