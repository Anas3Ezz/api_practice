import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practice_project/features/data/model/model.dart';
import 'package:practice_project/features/data/repo/product_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepo) : super(ProductsInitial());

  ProductRepo productRepo;


  Future<void> getProduct()async{
    emit(ProductsLoading());

    try {
     final response =await productRepo.getProduct();
     emit(ProductsSucess(products: response));
      
    } catch (e) {
      emit(ProductsError(error: e.toString()));
    }
  }
}
