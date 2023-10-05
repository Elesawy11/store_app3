import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/favorite_cuibt/favorite_cubit.dart';
import '../models/product_model.dart';
import 'product_form.dart';

class FavoriteViewForm extends StatelessWidget {
  const FavoriteViewForm({
    super.key,
    required this.favorite,
    required this.listOfProduct,
  });

  final FavoriteCubit favorite;
  final List<ProductModel> listOfProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite Product',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              favorite.clearFavorite();
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          return GridView.builder(
            itemCount: listOfProduct.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.70,
            ),
            itemBuilder: (context, index) {
              return ProductForm(productModel: listOfProduct[index]);
            },
          );
        },
      ),
    );
  }
}
