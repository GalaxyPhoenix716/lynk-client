import 'package:freezed_annotation/freezed_annotation.dart';
import 'file_item.dart';

part 'transfer.freezed.dart';

enum TransferStatus { uploading, ready, expired, cancelled }

@freezed
abstract class Transfer with _$Transfer {
  const factory Transfer({
    required String id,
    required TransferStatus status,
    required int totalFiles,
    required int totalSize,
    int? expiresMultiplier,
    required List<FileItem> files,
  }) = _Transfer;
}
