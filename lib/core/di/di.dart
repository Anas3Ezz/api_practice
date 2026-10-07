import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:practice_project/core/network/dio_factory.dart';
import 'package:practice_project/feature/products/data/datasources/product_api.dart';
import 'package:practice_project/feature/products/data/repo/product_repository_impl.dart';
import 'package:practice_project/feature/products/domain/repositories/product_repository.dart';

final getit = GetIt.instance;

void setUpGetIt() {
  getit.registerLazySingleton<Dio>(() => createDio());

  getit.registerLazySingleton<ProductApi>(() => ProductApi(getit()));
 getit.registerLazySingleton<ProductRepository>(
  () => ProductRepositoryImpl(productApi: getit()),
);
}
