import 'package:dio/dio.dart';
import '../models/receiver_session_model.dart';
import 'receiver_remote_data_source.dart';

class ReceiverRemoteDataSourceImpl implements ReceiverRemoteDataSource {
  final Dio dio;

  ReceiverRemoteDataSourceImpl({required this.dio});

  @override
  Future<ReceiverSessionModel> createReceiverSession() async {
    // TODO: implement createReceiverSession via POST /receiver-sessions
    throw UnimplementedError();
  }

  @override
  Future<ReceiverSessionModel> getReceiverSession(String sessionId) async {
    // TODO: implement getReceiverSession via GET /receiver-sessions/{session_id}
    throw UnimplementedError();
  }

  @override
  Future<void> attachTransfer({
    required String sessionId,
    required String transferId,
  }) async {
    // TODO: implement attachTransfer via POST /receiver-sessions/{session_id}/attach-transfer
    throw UnimplementedError();
  }

  @override
  Future<void> cancelReceiverSession(String sessionId) async {
    // TODO: implement cancelReceiverSession via DELETE /receiver-sessions/{session_id}
    throw UnimplementedError();
  }
}
