import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app3/models/product_model.dart';

import '../../services/add_product.dart';

part 'create_state.dart';

class CreateCubit extends Cubit<CreateState> {
  CreateCubit() : super(CreateInitial());

  void creatProduct( {required String title,required dynamic price,required String category}) async {
    emit(CreateLoading());
    try {
      ProductModel product = await AddProduct().addProduct(title: title,price: price,category: category);
      emit(CreateSuccess(productModel: product));
    } catch (e) {
      emit(CreateFailure(e.toString()));
    }
  }
}
