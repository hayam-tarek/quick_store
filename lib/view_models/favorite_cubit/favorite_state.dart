part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class AddOrDeleteFavoriteSuccess extends FavoriteState {
  final String message;
  AddOrDeleteFavoriteSuccess({required this.message});
}

final class AddOrDeleteFavoriteLoading extends FavoriteState {}

final class AddOrDeleteFavoriteFailure extends FavoriteState {
  final String message;
  AddOrDeleteFavoriteFailure({required this.message});
}

final class GetFavoriteSuccess extends FavoriteState {}

final class GetFavoriteLoading extends FavoriteState {}

final class GetFavoriteFailure extends FavoriteState {
  final String message;
  GetFavoriteFailure({required this.message});
}
