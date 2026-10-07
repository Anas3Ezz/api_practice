part of 'product_detail_cubit.dart';

@immutable
sealed class ProductDetailState {}

final class ProductDetailInitial extends ProductDetailState {}

final class ProductDetailLoading extends ProductDetailState {}

final class ProductDetailSuccess extends ProductDetailState {
  final Product product;

  ProductDetailSuccess(this.product);
}

final class ProductDetailError extends ProductDetailState {
  final String message;

  ProductDetailError(this.message);
}
