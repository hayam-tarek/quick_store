part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class GetCategoriesLoading extends CategoriesState {}

final class GetCategoriesSuccess extends CategoriesState {}

final class GetCategoriesFailure extends CategoriesState {
  final String message;
  GetCategoriesFailure({required this.message});
}

final class GetCategoryProductsLoading extends CategoriesState {}

final class GetCategoryProductsSuccess extends CategoriesState {}

final class GetCategoryProductsFailure extends CategoriesState {
  final String message;
  GetCategoryProductsFailure({required this.message});
}
