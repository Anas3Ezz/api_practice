import 'package:dio/dio.dart';
import 'package:practice_project/feature/products/data/model/product_model.dart';
import 'package:practice_project/feature/products/data/model/products_response.dart';
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