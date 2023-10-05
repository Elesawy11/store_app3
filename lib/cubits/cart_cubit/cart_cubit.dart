import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app3/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<ProductModel> productList = [];

  void addToCart(ProductModel productModel) {
    final isExist = productList.contains(productModel);
    if (isExist) {
      productList.remove(productModel);
      emit(CartRemove());
    } else {
      productList.add(productModel);
      emit(CartAdd());
    }
  }

  void clearCart() {
    productList.clear();
    emit(CartRemoveList());
  }
}
