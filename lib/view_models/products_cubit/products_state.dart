part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class LayoutInitial extends ProductsState {}

final class GetProductsSuccess extends ProductsState {}

final class GetProductsLoading extends ProductsState {}

final class GetProductsFailure extends ProductsState {
  final String message;
  GetProductsFailure({required this.message});
}
