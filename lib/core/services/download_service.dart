import 'package:dio/dio.dart';

class DownloadService {
  final Dio _dio = Dio();

  Future<void> downloadFileFromR2({
    required String downloadUrl,
    required String savePath,
    required void Function(int received, int total) onProgress,
    CancelToken? cancelToken,
  }) async {
    await _dio.download(
      downloadUrl,
      savePath,
      onReceiveProgress: onProgress,
      cancelToken: cancelToken,
    );
  }
}
