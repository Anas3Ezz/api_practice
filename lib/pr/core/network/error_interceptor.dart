import 'package:dio/dio.dart';
import 'package:practice_project/pr/core/network/api_exception.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final apiException = ApiException(
      message: _messageFor(err.type),
      statusCode: err.response?.statusCode,
    );

    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: apiException,
      ),
    );
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