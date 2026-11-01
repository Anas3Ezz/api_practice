import 'package:practice_project/core/network/dio_helper.dart';
import 'package:practice_project/features/products_screen/data/models/products_model.dart';

class ProductRepo {
  Future<List<ProductModel>> getProducts() async {
    final response = await DioHelper.getData(
      url: '/products',
    );

    List<ProductModel> products = [];

    for (var item in response.data['products']) {
      products.add(ProductModel.fromJson(item));
    }

    return products;
  }
}