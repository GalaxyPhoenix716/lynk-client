import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

class UploadService {
  final Dio _dio = Dio();

  Future<void> uploadFileToR2({
    required String name,
    required int size,
    required String contentType,
    required String uploadUrl,
    File? file,
    Uint8List? bytes,
    required void Function(int sent, int total) onProgress,
    CancelToken? cancelToken,
  }) async {
    dynamic uploadData;

    if (kIsWeb) {
      if (bytes == null) {
        throw ArgumentError('File bytes must be provided for Web uploads');
      }
      uploadData = bytes;
    } else {
      if (file == null) {
        throw ArgumentError('File object must be provided for Native uploads');
      }
      uploadData = file.openRead();
    }

    await _dio.put(
      uploadUrl,
      data: uploadData,
      options: Options(
        headers: {
          Headers.contentLengthHeader: size,
          Headers.contentTypeHeader: contentType,
        },
      ),
      onSendProgress: onProgress,
      cancelToken: cancelToken,
    );
  }
}
