import 'package:dio/dio.dart';
import 'package:practice_project/core/network/api_client.dart';
import 'package:practice_project/core/network/api_exception.dart';

Future<void> main() async {
ApiClient apiClient = ApiClient();

try {
  final data = await apiClient.get('/products/999999');
} on ApiException catch (e) {
  print(e.message);
  print(e.statusCode);
}




}