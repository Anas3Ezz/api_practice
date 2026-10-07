import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:practice_project/core/network/dio_factory.dart';
import 'package:practice_project/features/products/data/datasources/product_api.dart';
import 'package:practice_project/features/products/data/repositories/product_repository_impl.dart';
import 'package:practice_project/features/products/domain/repositories/product_repository.dart';
import 'package:practice_project/features/products/presentation/cubits/product_cubit.dart';
import 'package:practice_project/features/products/presentation/cubits/product_detail_cubit.dart';

final getIt = GetIt.instance;

void setUpGetIt() {
  getIt.registerLazySingleton<Dio>(() => createDio());
  getIt.registerLazySingleton<ProductApi>(() => ProductApi(getIt()));
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(productApi: getIt()),
  );
  getIt.registerFactory<ProductCubit>(() => ProductCubit(repository: getIt()));
  getIt.registerFactory<ProductDetailCubit>(
    () => ProductDetailCubit(repository: getIt()),
  );
}
