import 'package:dio/dio.dart';
import 'package:practice_project/pr/core/network/error_interceptor.dart';

Dio createDio() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com',
      connectTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );
  dio.interceptors.add(ErrorInterceptor());
  return dio;
}