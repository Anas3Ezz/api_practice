
import 'package:dio/dio.dart';
import 'package:practice_project/core/network/api_exception.dart';

class ApiClient {

  final _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 3),
      baseUrl: 'https://dummyjson.com'
    ),
  );

Future<dynamic> get(
  String path, {
  Map<String, dynamic>? queryParameters,
}) async {
  try {
    final response = await _dio.get(path, queryParameters: queryParameters);
    return response.data;
  } on DioException catch (e) {
    throw ApiException(
      message: _messageFor(e.type),
      statusCode: e.response?.statusCode,
    );
  }
}

String _messageFor(DioExceptionType type) {
  return switch (type) {
    DioExceptionType.connectionTimeout ||
    DioExceptionType.receiveTimeout ||
    DioExceptionType.sendTimeout =>
      'Connection timed out',
    DioExceptionType.connectionError => 'No internet connection',
    DioExceptionType.badResponse => 'Server error',
    DioExceptionType.cancel => 'Request cancelled',
    _ => 'Something went wrong',
  };
}

}