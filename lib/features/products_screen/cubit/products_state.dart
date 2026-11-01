part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}


class ProductInitial extends ProductsState {}

class ProductLoading extends ProductsState {}

class ProductSuccess extends ProductsState {
  final List<ProductModel> products;

  ProductSuccess(this.products);
}

class ProductFailure extends ProductsState {
  final String error;

  ProductFailure(this.error);
}