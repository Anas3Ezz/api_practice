import 'package:dio/dio.dart';

class DioHelper {
static late  Dio dio;

static void init(){
  dio = Dio(
    BaseOptions(
      receiveDataWhenStatusError: true,
      baseUrl: 'https://dummyjson.com/',
      headers: {
         'Content-Type': 'application/json',
      }
    )
  );
}

static Future<Response> getProduct({required String url})async{
  return await dio.get(url);
}
}