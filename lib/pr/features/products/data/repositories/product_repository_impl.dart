import 'package:dio/dio.dart';
import 'package:practice_project/pr/core/network/api_exception.dart';
import 'package:practice_project/pr/features/products/data/datasources/product_api.dart';
import 'package:practice_project/pr/features/products/domain/entities/product.dart';
import 'package:practice_project/pr/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductApi productApi;

  ProductRepositoryImpl({required this.productApi});

  @override
  Future<List<Product>> getProducts() async {
    try {
      final response = await productApi.getProducts();
      return response.products.map((m) => m.toDomain()).toList();
    } on DioException catch (e) {
      throw _toApiException(e);
    }
  }

  @override
  Future<Product> getProductById(int id) async {
    try {
      final model = await productApi.getProductById(id);
      return model.toDomain();
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