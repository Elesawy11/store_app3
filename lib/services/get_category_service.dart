import '../helpers/api.dart';
import '../models/product_model.dart';

class GetCategory {
  Future<List<ProductModel>> getProductOfCategory(
      {required String categoryName}) async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products/category/$categoryName',
    );

    List<ProductModel> productLsit = [];
    for (var product in data) {
      ProductModel productModel = ProductModel.fromJson(product);
      productLsit.add(productModel);
    }
    return productLsit;
  }
}
