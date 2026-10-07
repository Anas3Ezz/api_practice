class ProductModel {
  final int id;
  final String title;
  final double price;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }
}