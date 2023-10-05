import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/store_cubit/store_cubit.dart';
import 'category_list_view.dart';
import 'product_sliver_grid.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<StoreCubit, StoreState>(
        builder: (context, state) {
          if (state is StoreLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is StoreFailure) {
            return Center(
              child: Text(state.errMessage),
            );
          } else if (state is StoreSuccess) {
            return CustomScrollView(
              clipBehavior: Clip.none,
              physics: const BouncingScrollPhysics(),
              slivers: [
                const SliverToBoxAdapter(
                  child: CategoryListView(),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 24,
                  ),
                ),
                ProductSliverGrid(
                  productList: state.products,
                )
              ],
            );
          }
          return const Text('Wrrrrrong');
        },
      
    );
  }
}
