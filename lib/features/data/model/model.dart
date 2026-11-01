class ProductModel {
  final String title;
  final String description;
  final String category;
  final double price;
  final String thumbnail;

  const ProductModel({
    required this.title,
    required this.description,
    required this.category,
    required this.price, required this.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: (json['price'] as num).toDouble(),
       thumbnail: json['thumbnail'],

    );
  }


}