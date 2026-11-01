import 'package:dio/dio.dart';

class DioHelper {
 static late Dio dio ;

static void init(){
  dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com',
       receiveDataWhenStatusError: true,
       headers: {
          'Content-Type': 'application/json',
        },
    )
  );


}


  static Future<Response> getData({ required String url,}) async {
    return await dio.get(
      url,
    );
  }
}

