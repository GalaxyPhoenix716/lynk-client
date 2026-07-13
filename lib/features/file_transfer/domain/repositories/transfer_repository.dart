import '../../../../core/errors/result.dart';
import '../entities/file_item.dart';
import '../entities/transfer.dart';

abstract class TransferRepository {
  Future<Result<Transfer>> createTransfer(List<FileItem> files);
  
  Future<Result<void>> completeFileUpload({
    required String transferId,
    required String fileId,
  });

  Future<Result<Transfer>> getTransferMetadata(String transferId);

  Future<Result<List<FileItem>>> getDownloadUrls({
    required String transferId,
    List<String>? fileIds,
  });

  Future<Result<void>> cancelTransfer(String transferId);
}
