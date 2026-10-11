import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practice_project/pr/core/network/api_exception.dart';
import 'package:practice_project/pr/features/products/domain/entities/product.dart';
import 'package:practice_project/pr/features/products/domain/repositories/product_repository.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this.repository}) : super(ProductInitial());

 final ProductRepository repository;


 Future<void> getProducts()async{
  emit(ProductLoading());
  print('GGG');
try {
  final products = await repository.getProducts();
 emit(ProductSuccess(products));
} on ApiException catch (e) {
  emit(ProductError(e.message));
}

 }
}
