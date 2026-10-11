import 'package:json_annotation/json_annotation.dart';
import 'package:practice_project/pr/features/products/data/models/product_model.dart';

part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponse {
  final List<ProductModel> products;
  final int total;

  ProductsResponse({required this.products, required this.total});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);
}