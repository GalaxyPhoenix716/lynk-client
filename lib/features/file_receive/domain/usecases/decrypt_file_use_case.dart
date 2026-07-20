import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'decrypt_file_use_case.g.dart';

class DecryptFileUseCase {
  /// Foundation for client-side file decryption in the receiver feature.
  /// Currently returns the original file unchanged (pass-through).
  /// Replace with AES-256-GCM / ChaCha20-Poly1305 decryption when ready.
  Future<File> execute({required File file, String? secretKey}) async {
    // TODO: Implement client-side decryption logic
    return file;
  }
}

@riverpod
DecryptFileUseCase decryptFileUseCase(Ref ref) {
  return DecryptFileUseCase();
}
