part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class UpdateCartLoading extends CartState {}

final class UpdateCartSuccess extends CartState {
  final String message;
  UpdateCartSuccess({required this.message});
}

final class UpdateCartFailure extends CartState {
  final String message;
  UpdateCartFailure({required this.message});
}

final class AddOrDeleteFromCartLoading extends CartState {}

final class AddOrDeleteFromCartSuccess extends CartState {
  final String message;
  AddOrDeleteFromCartSuccess({required this.message});
}

final class AddOrDeleteFromCartFailure extends CartState {
  final String message;
  AddOrDeleteFromCartFailure({required this.message});
}

final class GetCartLoading extends CartState {}

final class GetCartSuccess extends CartState {}

final class GetCartFailure extends CartState {
  final String message;
  GetCartFailure({required this.message});
}
