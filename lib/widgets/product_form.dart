import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app3/cubits/cart_cubit/cart_cubit.dart';
import 'package:store_app3/cubits/favorite_cuibt/favorite_cubit.dart';
import 'package:store_app3/models/product_model.dart';
import 'package:store_app3/views/update_view.dart';

class ProductForm extends StatelessWidget {
  final ProductModel productModel;
  const ProductForm({super.key, required this.productModel});
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<FavoriteProvider>(context);
    final favorite = BlocProvider.of<FavoriteCubit>(context);
    final cart = BlocProvider.of<CartCubit>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return UpdateView(productModel: productModel);
            },
          ),
        );
      },
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 220,
                width: 200,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffEFF3FC),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    Positioned(
                      left: 6,
                      top: 25,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.white,
                        ),
                        child: BlocListener<CartCubit, CartState>(
                          listener: (context, state) {},
                          child: IconButton(
                            onPressed: () {
                              cart.addToCart(productModel);
                            },
                            icon: const Icon(
                              Icons.add_shopping_cart,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 25,
                      left: 6,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.white,
                        ),
                        child: BlocBuilder<FavoriteCubit, FavoriteState>(
                          builder: (context, state) {
                            return IconButton(
                              onPressed: () {
                                favorite.toggleFavorite(productModel);
                              },
                              icon: Icon(
                                favorite.isExist(productModel)
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: Colors.red,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      right: 22,
                      bottom: 0,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: Image.network(
                          productModel.image,
                          cacheWidth: 120,
                          cacheHeight: 200,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                productModel.title.length <= 11
                    ? productModel.title
                    : productModel.title.substring(0, 11),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                '\$${productModel.price}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
