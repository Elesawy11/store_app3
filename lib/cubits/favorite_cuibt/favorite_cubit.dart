import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app3/models/product_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  List<ProductModel> productList = [];
  void toggleFavorite(ProductModel productModel) {
    final isExist = productList.contains(productModel);
    if (isExist) {
      productList.remove(productModel);
      emit(FavoriteRemove());
    } else {
      productList.add(productModel);
      emit(FavoriteAdd());
    }
  }

  bool isExist(ProductModel productModel) {
    final isExist = productList.contains(productModel);
    return isExist;
  }

  void clearFavorite() {
    productList.clear();

    emit(FavoriteRemoveLlist());
  }
}
