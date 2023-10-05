part of 'store_cubit.dart';

@immutable
abstract class StoreState {}

final class StoreInitial extends StoreState {}

final class StoreLoading extends StoreState {}

final class StoreFailure extends StoreState {
  final String errMessage;

  StoreFailure(this.errMessage);
}

final class StoreSuccess extends StoreState {
  final List<ProductModel> products;

  StoreSuccess({required this.products});
}
