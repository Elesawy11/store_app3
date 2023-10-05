import 'package:flutter/material.dart';
import 'package:store_app3/helpers/api.dart';
import 'package:store_app3/models/product_model.dart';

class GetAllProduct {
  Future<List<ProductModel>> getAllProduct() async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products',
    );

    List<ProductModel> productLsit = [];
    for (var product in data) {
      ProductModel productModel = ProductModel.fromJson(product);
      productLsit.add(productModel);
    }
    return productLsit;
  }
}
