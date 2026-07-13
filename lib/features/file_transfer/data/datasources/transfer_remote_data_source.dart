

abstract class TransferRemoteDataSource {
  Future<TransferModel> createTransfer(List<FileItemModel> files);

  Future<void> completeFileUpload({
    required String transferId,
    required String fileId,
  });

  Future<TransferModel> getTransferMetadata(String transferId);

  Future<List<FileItemModel>> getDownloadUrls({
    required String transferId,
    List<String>? fileIds,
  });

  Future<void> cancelTransfer(String transferId);
}

class FileItemModel {
}

class TransferModel {
}
