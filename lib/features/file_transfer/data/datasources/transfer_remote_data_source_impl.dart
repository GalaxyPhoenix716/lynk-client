
import 'package:client/features/file_transfer/data/datasources/transfer_remote_data_source.dart';
import 'package:dio/dio.dart';

class TransferRemoteDataSourceImpl implements TransferRemoteDataSource {
  final Dio dio;

  TransferRemoteDataSourceImpl({required this.dio});

  @override
  Future<TransferModel> createTransfer(List<FileItemModel> files) async {
    // TODO: implement createTransfer via POST /transfers
    throw UnimplementedError();
  }

  @override
  Future<void> completeFileUpload({
    required String transferId,
    required String fileId,
  }) async {
    // TODO: implement completeFileUpload via POST /transfers/{transfer_id}/files/{file_id}/complete
    throw UnimplementedError();
  }

  @override
  Future<TransferModel> getTransferMetadata(String transferId) async {
    // TODO: implement getTransferMetadata via GET /transfers/{transfer_id}
    throw UnimplementedError();
  }

  @override
  Future<List<FileItemModel>> getDownloadUrls({
    required String transferId,
    List<String>? fileIds,
  }) async {
    // TODO: implement getDownloadUrls via POST /transfers/{transfer_id}/downloads
    throw UnimplementedError();
  }

  @override
  Future<void> cancelTransfer(String transferId) async {
    // TODO: implement cancelTransfer via DELETE /transfers/{transfer_id}
    throw UnimplementedError();
  }
}
