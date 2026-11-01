import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practice_project/features/products_screen/data/models/products_model.dart';
import 'package:practice_project/features/products_screen/data/repo/product_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
    final ProductRepo productRepo;

  ProductsCubit(this.productRepo) : super(ProductInitial());


  Future<void> getProducts() async {
    emit(ProductLoading());

    try {
      final product = await productRepo.getProducts();
      emit(ProductSuccess(product));
    } catch (e) {
    emit(ProductFailure(e.toString()));
    }
  }

  
}
