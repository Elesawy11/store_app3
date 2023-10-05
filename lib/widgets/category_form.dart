import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app3/cubits/category_cubit/category_cubit.dart';
import 'package:store_app3/views/category_view.dart';

import '../models/category_model.dart';

class CategoryForm extends StatelessWidget {
  const CategoryForm({
    super.key,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<CategoryCubit>(context)
              .getCategory(categoryName: categoryModel.categoryName);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CategoryView(
              categoryName: categoryModel.categoryName,
            );
          }));
        },
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.orange,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(categoryModel.image),
            ),
          ),
          child: Center(
              child: Text(
            categoryModel.categoryName,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )),
        ),
      ),
    );
  }
}
