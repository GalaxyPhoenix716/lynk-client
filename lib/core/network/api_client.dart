import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'dart:io';

class ApiClient {
  final Dio _dio;

  ApiClient({Dio? dio}) : _dio = dio ?? Dio() {
    _dio.options.baseUrl = _getBaseUrl();
    _dio.options.connectTimeout = const Duration(seconds: 15);
    _dio.options.receiveTimeout = const Duration(seconds: 15);
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (obj) => debugPrint('DioLog: $obj'),
    ));
  }

  static String _getBaseUrl() {
    // Default base URL for local development.
    // If running on Android emulator, localhost is mapped to 10.0.2.2.
    // For iOS simulator, it remains 127.0.0.1 / localhost.
    try {
      if (Platform.isAndroid) {
        return 'http://10.0.2.2:8000/api/v1';
      }
    } catch (_) {
      // Fallback if Platform is not supported (e.g. web)
    }
    return 'http://localhost:8000/api/v1';
  }

  Dio get dio => _dio;
}
