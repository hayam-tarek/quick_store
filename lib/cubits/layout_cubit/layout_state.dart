part of 'layout_cubit.dart';

@immutable
sealed class LayoutState {}

final class LayoutInitial extends LayoutState {}

final class GetProfileSuccess extends LayoutState {}

final class GetProfileLoading extends LayoutState {}

final class GetProfileFailure extends LayoutState {
  final String message;
  GetProfileFailure({required this.message});
}
