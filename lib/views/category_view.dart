import 'package:flutter/material.dart';
import 'package:store_app3/widgets/category_view_form.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 1,
        title: Text(
          categoryName,
          style:const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: const CategoryViewForm(),
    );
  }
}
