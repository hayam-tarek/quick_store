part of 'layout_cubit.dart';

@immutable
sealed class LayoutState {}

final class LayoutInitial extends LayoutState {}

final class GetProductsSuccess extends LayoutState {}

final class GetProductsLoading extends LayoutState {}

final class GetProductsFailure extends LayoutState {
  final String message;
  GetProductsFailure({required this.message});
}



// final class GetBannersSuccess extends LayoutState {}

// final class GetBannersLoading extends LayoutState {}

// final class GetBannersFailure extends LayoutState {
//   final String message;
//   GetBannersFailure({required this.message});
// }

// final class GetCategoriesSuccess extends LayoutState {}

// final class GetCategoriesLoading extends LayoutState {}

// final class GetCategoriesFailure extends LayoutState {
//   final String message;
//   GetCategoriesFailure({required this.message});
// }
