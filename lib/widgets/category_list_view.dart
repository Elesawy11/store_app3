import 'package:flutter/material.dart';
import 'package:store_app3/widgets/category_form.dart';

import '../models/category_model.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });
  final List<CategoryModel> categoryList = const [
    CategoryModel(
      categoryName: 'electronics',
      image: 'assets/images/electronics.jpg',
    ),
    CategoryModel(
      categoryName: "jewelery",
      image: 'assets/images/jewelry.jpg',
    ),
    CategoryModel(
      categoryName: "men's clothing",
      image: 'assets/images/mens_clothing.jpg',
    ),
    CategoryModel(
      categoryName: "women's clothing",
      image: 'assets/images/womens_clothing.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            return CategoryForm(
              categoryModel: categoryList[index],
            );
          }),
    );
  }
}
