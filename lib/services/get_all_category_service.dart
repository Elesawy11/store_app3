import 'dart:convert';

import 'package:store_app3/helpers/api.dart';
import 'package:http/http.dart' as http;

class GetAllCategory {
  Future<List<dynamic>> getAllCategory() async {
    try {
      List<dynamic> categoryList = await Api().get(
        url: 'https://fakestoreapi.com/products/categories',
      );

      print(categoryList);
      return categoryList;
    } catch (e) {
      print(e.toString());
    }
    return [];
  }
}
