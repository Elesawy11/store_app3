import 'package:flutter/material.dart';
import 'package:store_app3/models/product_model.dart';


class FavoriteProvider extends ChangeNotifier {
  List<ProductModel> productList = [];
  void toggleFavorite(ProductModel productModel) {
    final isExist = productList.contains(productModel);
    if (isExist) {
      productList.remove(productModel);
    } else {
      productList.add(productModel);
    }

    notifyListeners();
  }

  bool isExist(ProductModel productModel) {
    final isExist = productList.contains(productModel);
    return isExist;
  }

  void clearFavorite() {
    productList = [];
    notifyListeners();
  }
}
