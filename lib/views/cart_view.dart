import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app3/cubits/cart_cubit/cart_cubit.dart';
import 'package:store_app3/widgets/cart_view_form.dart';

class CartView extends StatelessWidget {
  const CartView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cart = BlocProvider.of<CartCubit>(context);

    final listOfProduct = cart.productList;

    return CartViewForm(
      cart: cart,
      listOfProduct: listOfProduct,
    );
  }
}
