import 'package:practice_project/core/network/api_client.dart';
import 'package:practice_project/feature/products/data/model/product_model.dart';

class ProductRemoteDataSource{
 final ApiClient apiClient ;

  ProductRemoteDataSource({required this.apiClient});


  Future<List<ProductModel>> getProducts()async{
  final response =  await apiClient.get('/products');
  final list = response['products'] as List;

  return list.map((e) => ProductModel.fromJson(e as Map<String , dynamic>),).toList();
  }


  Future<ProductModel> getProductById(int id) async {
      final response =  await apiClient.get('/products/$id');
return ProductModel.fromJson(response as Map<String , dynamic>);
  // 1. call apiClient.get('/products/$id')
  // 2. return ProductModel.fromJson(...) of the result
}
}