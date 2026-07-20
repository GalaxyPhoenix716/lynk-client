import 'package:flutter_test/flutter_test.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:client/features/file_transfer/presentation/providers/upload_notifier.dart';
import 'package:client/features/file_transfer/presentation/providers/upload_state.dart';

void main() {
  group('UploadState', () {
    test('initial state has empty selectedFiles and idle phase', () {
      const state = UploadState();
      expect(state.selectedFiles, isEmpty);
      expect(state.phase, UploadPhase.idle);
      expect(state.totalSize, 0);
    });

    test('totalSize calculates total byte size correctly', () {
      final state = UploadState(
        selectedFiles: [
          PlatformFile(name: 'a.txt', size: 100),
          PlatformFile(name: 'b.jpg', size: 250),
        ],
      );
      expect(state.totalSize, 350);
    });
  });

  group('UploadNotifier', () {
    test('removeFile removes file at index and updates phase', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(uploadProvider.notifier);
      notifier.setFilesForTesting([
        PlatformFile(name: 'a.txt', size: 100),
        PlatformFile(name: 'b.jpg', size: 200),
      ]);

      expect(container.read(uploadProvider).selectedFiles.length, 2);

      notifier.removeFile(0);

      final state = container.read(uploadProvider);
      expect(state.selectedFiles.length, 1);
      expect(state.selectedFiles.first.name, 'b.jpg');
      expect(state.phase, UploadPhase.selecting);
    });

    test('removeFile resets phase to idle when all files are removed', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(uploadProvider.notifier);
      notifier.setFilesForTesting([
        PlatformFile(name: 'a.txt', size: 100),
      ]);

      notifier.removeFile(0);

      final state = container.read(uploadProvider);
      expect(state.selectedFiles, isEmpty);
      expect(state.phase, UploadPhase.idle);
    });

    test('cancelUpload updates phase to cancelled', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final notifier = container.read(uploadProvider.notifier);
      notifier.cancelUpload();

      final state = container.read(uploadProvider);
      expect(state.phase, UploadPhase.cancelled);
    });
  });
}
