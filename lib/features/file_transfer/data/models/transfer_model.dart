import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/transfer.dart';
import 'file_item_model.dart';

part 'transfer_model.freezed.dart';
part 'transfer_model.g.dart';

@freezed
abstract class TransferModel with _$TransferModel {
  const factory TransferModel({
    @JsonKey(name: 'transfer_id') required String id,
    required TransferStatus status,
    @JsonKey(name: 'total_files') required int totalFiles,
    @JsonKey(name: 'total_size') required int totalSize,
    @JsonKey(name: 'expires_in') int? expiresMultiplier,
    required List<FileItemModel> files,
  }) = _TransferModel;

  factory TransferModel.fromJson(Map<String, dynamic> json) => _$TransferModelFromJson(json);

  factory TransferModel.fromEntity(Transfer entity) {
    return TransferModel(
      id: entity.id,
      status: entity.status,
      totalFiles: entity.totalFiles,
      totalSize: entity.totalSize,
      expiresMultiplier: entity.expiresMultiplier,
      files: entity.files.map((f) => FileItemModel.fromEntity(f)).toList(),
    );
  }
}

extension TransferModelX on TransferModel {
  Transfer toEntity() {
    return Transfer(
      id: id,
      status: status,
      totalFiles: totalFiles,
      totalSize: totalSize,
      expiresMultiplier: expiresMultiplier,
      files: files.map((f) => f.toEntity()).toList(),
    );
  }
}
