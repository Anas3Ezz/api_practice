import 'package:dio/dio.dart';
import 'package:practice_project/core/network/api_exception.dart';
import 'package:practice_project/feature/products/data/datasources/product_api.dart';
import 'package:practice_project/feature/products/data/model/product_model.dart';
import 'package:practice_project/feature/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductApi productApi;

  ProductRepositoryImpl({required this.productApi});

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await productApi.getProducts();
      return response.products;
    } on DioException catch (e) {
      throw _toApiException(e);
    }
  }

  @override
  Future<ProductModel> getProductById(int id) async {
    try {
      return await productApi.getProductById(id);
    } on DioException catch (e) {
      throw _toApiException(e);
    }
  }

  ApiException _toApiException(DioException e) {
    final error = e.error;
    return error is ApiException
        ? error
        : ApiException(message: 'Something went wrong');
  }
}