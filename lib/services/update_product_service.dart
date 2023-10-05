import 'package:store_app3/helpers/api.dart';
import 'package:store_app3/models/product_model.dart';

class UpdateProduct {
  Future<ProductModel> updateProduct(
      // required dynamic id,
      // required String title,
      // required dynamic price,
      // required String category,
      // required String image,
      ) async {
    Map<String, dynamic> jsonData = {
      'id': 2,
      'title': 'Hello',
      'price': 20,
      'image':
          'https://www.thoughtco.com/thmb/ctxxtfGGeK5f_-S3f8J-jbY-Gp8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/close-up-of-clothes-hanging-in-row-739240657-5a78b11f8e1b6e003715c0ec.jpg',
      'category': 'jewelry',
    };
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/7',
      body: jsonData,
    );
    return ProductModel.fromJson(data);
  }
}
