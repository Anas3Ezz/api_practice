import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practice_project/core/network/api_exception.dart';
import 'package:practice_project/feature/products/data/model/product_model.dart';
import 'package:practice_project/feature/products/domain/repositories/product_repository.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit({required this.repository}) : super(ProductDetailInitial());
 final ProductRepository repository;


  Future<void> getProductById(int id)async{
    emit(ProductDetailLoading());
    try {
      final product = await repository.getProductById(id);
      emit(ProductDetailSuccess(product));
    } on ApiException catch (e) {
      emit(ProductDetailError(e.message));
    }
  }
}
