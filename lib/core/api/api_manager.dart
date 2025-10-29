import 'package:dio/dio.dart';

import 'api_constants.dart';

class ApiManager {

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  /// 🟢 GET Request
  static Future<Response> getData({
    required String endpoint,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// 🟡 POST Request
  static Future<Response> postData({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// 🟠 PUT Request
  static Future<Response> putData({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: data,
        options: Options(headers: headers),
      );
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// 🔴 DELETE Request
  static Future<Response> deleteData({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        data: data,
        options: Options(headers: headers),
      );
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// ⚙️ Error Handler
  static String _handleError(dynamic error) {
    if (error is DioException) {
      if (error.response != null) {
        return 'Error ${error.response?.statusCode}: ${error.response?.data}';
      } else {
        return 'Network error: ${error.message}';
      }
    } else {
      return 'Unexpected error: $error';
    }
  }
}
