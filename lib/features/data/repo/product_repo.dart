import 'package:practice_project/core/networking/dio_helper.dart';
import 'package:practice_project/features/data/model/model.dart';

class ProductRepo {


  Future<List<ProductModel>> getProduct()async{
   final product = await DioHelper.getProduct(url: 'products');

   List<ProductModel> products = [];

   for (var item in product.data['products']) {
    products.add(ProductModel.fromJson(item));
     
   }
return products;
  }
}