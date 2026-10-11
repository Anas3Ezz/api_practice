import 'package:dio/dio.dart';
import 'package:practice_project/pr/features/products/data/models/product_model.dart';
import 'package:practice_project/pr/features/products/data/models/products_response.dart';
import 'package:retrofit/retrofit.dart';

part 'product_api.g.dart';

@RestApi()
abstract class ProductApi {
  factory ProductApi(Dio dio, {String baseUrl}) = _ProductApi;

  @GET('/products')
  Future<ProductsResponse> getProducts();

  @GET('/products/{id}')
  Future<ProductModel> getProductById(@Path('id') int id);
}