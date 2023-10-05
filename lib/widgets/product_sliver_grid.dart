import 'package:flutter/material.dart';
import 'package:store_app3/models/product_model.dart';

import 'product_form.dart';

class ProductSliverGrid extends StatelessWidget {
  const ProductSliverGrid({
    super.key,
    required this.productList,
  });
  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.70,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return ProductForm(
            productModel: productList[index],
          );
        });
  }
}
