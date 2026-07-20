import 'package:flutter_test/flutter_test.dart';
import 'package:client/features/file_transfer/data/models/file_item_model.dart';
import 'package:client/features/file_transfer/domain/entities/file_item.dart';

void main() {
  group('FileItemModel', () {
    const testModel = FileItemModel(
      id: 'fid_123',
      name: 'photo.jpg',
      size: 1024,
      contentType: 'image/jpeg',
      status: FileStatus.uploaded,
      uploadUrl: 'https://r2.mock/upload',
      downloadUrl: 'https://r2.mock/download',
    );

    test('fromJson parses complete JSON correctly', () {
      final json = {
        'file_id': 'fid_123',
        'file_name': 'photo.jpg',
        'file_size': 1024,
        'content_type': 'image/jpeg',
        'status': 'uploaded',
        'upload_url': 'https://r2.mock/upload',
        'download_url': 'https://r2.mock/download',
      };

      final model = FileItemModel.fromJson(json);
      expect(model.id, 'fid_123');
      expect(model.name, 'photo.jpg');
      expect(model.size, 1024);
      expect(model.contentType, 'image/jpeg');
      expect(model.status, FileStatus.uploaded);
      expect(model.uploadUrl, 'https://r2.mock/upload');
      expect(model.downloadUrl, 'https://r2.mock/download');
    });

    test('toJson converts model to Map correctly', () {
      final json = testModel.toJson();

      expect(json['file_id'], 'fid_123');
      expect(json['file_name'], 'photo.jpg');
      expect(json['file_size'], 1024);
      expect(json['content_type'], 'image/jpeg');
      expect(json['status'], 'uploaded');
      expect(json['upload_url'], 'https://r2.mock/upload');
      expect(json['download_url'], 'https://r2.mock/download');
    });

    test('fromEntity creates valid FileItemModel', () {
      const entity = FileItem(
        id: 'fid_456',
        name: 'video.mp4',
        size: 2048,
        contentType: 'video/mp4',
        status: FileStatus.pending,
      );

      final model = FileItemModel.fromEntity(entity);

      expect(model.id, 'fid_456');
      expect(model.name, 'video.mp4');
      expect(model.size, 2048);
      expect(model.contentType, 'video/mp4');
      expect(model.status, FileStatus.pending);
    });
  });
}
