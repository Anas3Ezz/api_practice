import 'package:get_it/get_it.dart';
import 'package:practice_project/core/network/api_client.dart';
import 'package:practice_project/feature/products/data/datasources/product_remote_data_source.dart';
import 'package:practice_project/feature/products/data/repo/product_repository_impl.dart';
import 'package:practice_project/feature/products/domain/repositories/product_repository.dart';

final getit = GetIt.instance;

void setUpGetIt() {
  getit.registerLazySingleton<ApiClient>(() => ApiClient());
  getit.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSource(apiClient: getit()),
  );
  getit.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      productRemoteDataSource: getit(),
    ),
  );
}
