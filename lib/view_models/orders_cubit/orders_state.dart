part of 'orders_cubit.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}

final class AddOrderLoading extends OrdersState {}

final class AddOrderSuccess extends OrdersState {
  final String message;
  AddOrderSuccess({required this.message});
}

final class AddOrderFailure extends OrdersState {
  final String message;
  AddOrderFailure({required this.message});
}

final class GetOrdersLoading extends OrdersState {}

final class GetOrdersSuccess extends OrdersState {}

final class GetOrdersFailure extends OrdersState {
  final String message;
  GetOrdersFailure({required this.message});
}

final class CancelOrderLoading extends OrdersState {}

final class CancelOrderSuccess extends OrdersState {
  final String message;
  CancelOrderSuccess({required this.message});
}

final class CancelOrderFailure extends OrdersState {
  final String message;
  CancelOrderFailure({required this.message});
}
