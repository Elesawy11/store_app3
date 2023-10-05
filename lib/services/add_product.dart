import 'package:store_app3/helpers/api.dart';
import 'package:store_app3/models/product_model.dart';

class AddProduct {
  Future<ProductModel> addProduct({
    required String title,
    required dynamic price,
    required String category,
    // required String image,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': 'Hello',
        'category': category,
        'image':
            'https://www.thoughtco.com/thmb/ctxxtfGGeK5f_-S3f8J-jbY-Gp8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/close-up-of-clothes-hanging-in-row-739240657-5a78b11f8e1b6e003715c0ec.jpg'
      },
    );
    return ProductModel.fromJson(data);
  }
}

// import 'package:store_app3/helpers/api.dart';
// import 'package:store_app3/models/product_model.dart';

// class AddProduct {
//   Future<ProductModel> addProduct({
//     required String title,
//     // required double price,
//     // required String category,
//     // required String image,
//   }) async {
//     ProductModel productModel = await Api().post(
//       url: 'https://fakestoreapi.com/products',
//       body: {
//         'title': title,
//       'price': 25,
//       'description': 'Hello',
//       'category': 'jewelary',
//       'image': 'https://www.thoughtco.com/thmb/ctxxtfGGeK5f_-S3f8J-jbY-Gp8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/close-up-of-clothes-hanging-in-row-739240657-5a78b11f8e1b6e003715c0ec.jpg'
//       },
//     );
//     return productModel;
//   }
// }

