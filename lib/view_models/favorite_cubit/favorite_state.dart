part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteSuccess extends FavoriteState {
  final String message;
  FavoriteSuccess({required this.message});
}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteFailure extends FavoriteState {
  final String message;
  FavoriteFailure({required this.message});
}
