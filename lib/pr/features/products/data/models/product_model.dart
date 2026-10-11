import 'package:json_annotation/json_annotation.dart';
import 'package:practice_project/pr/features/products/domain/entities/product.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final int id;
  final String title;
  final double price;

  ProductModel({required this.id, required this.title, required this.price});

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Product toDomain() => Product(id: id, title: title, price: price);
}