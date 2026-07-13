import '../../../../core/errors/result.dart';
import '../../domain/entities/file_item.dart';
import '../../domain/entities/transfer.dart';
import '../../domain/repositories/transfer_repository.dart';
import '../datasources/transfer_remote_data_source.dart';

class TransferRepositoryImpl implements TransferRepository {
  final TransferRemoteDataSource remoteDataSource;

  TransferRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Result<Transfer>> createTransfer(List<FileItem> files) async {
    // TODO: implement createTransfer
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> completeFileUpload({
    required String transferId,
    required String fileId,
  }) async {
    // TODO: implement completeFileUpload
    throw UnimplementedError();
  }

  @override
  Future<Result<Transfer>> getTransferMetadata(String transferId) async {
    // TODO: implement getTransferMetadata
    throw UnimplementedError();
  }

  @override
  Future<Result<List<FileItem>>> getDownloadUrls({
    required String transferId,
    List<String>? fileIds,
  }) async {
    // TODO: implement getDownloadUrls
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> cancelTransfer(String transferId) async {
    // TODO: implement cancelTransfer
    throw UnimplementedError();
  }
}
