import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app3/models/product_model.dart';
import 'package:store_app3/services/get_category_service.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  void getCategory({required String categoryName}) async {
    emit(CategoryLoading());
    try {
      List<ProductModel> categoryList =
          await GetCategory().getProductOfCategory(categoryName: categoryName);
          print(categoryList);
      emit(CategorySuccess(categories: categoryList));
    } catch (e) {
      emit(CategoryFailure(e.toString()));
    }
  }
}
