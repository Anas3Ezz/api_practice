import 'package:practice_project/feature/products/data/datasources/product_remote_data_source.dart';
import 'package:practice_project/feature/products/data/model/product_model.dart';
import 'package:practice_project/feature/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository{

  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl({required this.productRemoteDataSource});
  @override
  Future<List<ProductModel>> getProducts() {
  return productRemoteDataSource.getProducts();
  }

  @override
  Future<ProductModel> getProductById(int id) {
    return productRemoteDataSource.getProductById(id);
  }
}