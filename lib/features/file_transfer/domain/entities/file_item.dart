import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_item.freezed.dart';

enum FileStatus { pending, uploaded, failed }

@freezed
abstract class FileItem with _$FileItem {
  const factory FileItem({
    required String id,
    required String name,
    required int size,
    required String contentType,
    required FileStatus status,
    String? uploadUrl,
    String? downloadUrl,
  }) = _FileItem;
}
