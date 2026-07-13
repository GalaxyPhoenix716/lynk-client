import '../../../../core/errors/result.dart';
import '../../domain/entities/receiver_session.dart';
import '../../domain/repositories/receiver_repository.dart';
import '../datasources/receiver_remote_data_source.dart';

class ReceiverRepositoryImpl implements ReceiverRepository {
  final ReceiverRemoteDataSource remoteDataSource;

  ReceiverRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Result<ReceiverSession>> createReceiverSession() async {
    // TODO: implement createReceiverSession
    throw UnimplementedError();
  }

  @override
  Future<Result<ReceiverSession>> getReceiverSession(String sessionId) async {
    // TODO: implement getReceiverSession
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> attachTransfer({
    required String sessionId,
    required String transferId,
  }) async {
    // TODO: implement attachTransfer
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> cancelReceiverSession(String sessionId) async {
    // TODO: implement cancelReceiverSession
    throw UnimplementedError();
  }
}
