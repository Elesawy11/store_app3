part of 'create_cubit.dart';

@immutable
sealed class CreateState {}

final class CreateInitial extends CreateState {}
final class CreateLoading extends CreateState {}
final class CreateFailure extends CreateState {
  final String errMessage;

  CreateFailure(this.errMessage);
}
final class CreateSuccess extends CreateState {
  final ProductModel productModel;

  CreateSuccess({required this.productModel});
}
