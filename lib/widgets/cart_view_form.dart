import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app3/cubits/cart_cubit/cart_cubit.dart';

import '../models/product_model.dart';
import 'product_form.dart';

class CartViewForm extends StatelessWidget {
  const CartViewForm({
    super.key,
    required this.cart,
    required this.listOfProduct,
  });

  final CartCubit cart;
  final List<ProductModel> listOfProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart Product',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              cart.clearCart();
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: BlocBuilder<CartCubit, CartState>(
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
