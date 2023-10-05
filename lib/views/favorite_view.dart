import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/favorite_cuibt/favorite_cubit.dart';
import '../widgets/favorite_view_form.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final favorite = BlocProvider.of<FavoriteCubit>(context);

    final listOfProduct = favorite.productList;

    return FavoriteViewForm(
      favorite: favorite,
      listOfProduct: listOfProduct,
    );
  }
}
