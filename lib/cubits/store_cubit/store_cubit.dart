import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app3/models/product_model.dart';
import 'package:store_app3/services/get_all_product_service.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(StoreInitial());

  void getProducts() async {
    emit(StoreLoading());
    try {
      List<ProductModel> productList = await GetAllProduct().getAllProduct();
      emit(
        StoreSuccess(products: productList),
      );
    } catch (e) {
      emit(
        StoreFailure(e.toString()),
      );
    }
  }
}
