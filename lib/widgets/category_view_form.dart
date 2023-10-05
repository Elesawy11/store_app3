import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app3/cubits/category_cubit/category_cubit.dart';
import 'package:store_app3/widgets/product_form.dart';

class CategoryViewForm extends StatelessWidget {
  const CategoryViewForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CategoryFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is CategorySuccess) {
          return GridView.builder(
            itemCount: state.categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.70,
            ),
            itemBuilder: (context, index) {
              return ProductForm(productModel: state.categories[index]);
            },
          );
        } else {
          return const Center(
            child: Text('there is an error'),
          );
        }
      },
    );
  }
}
