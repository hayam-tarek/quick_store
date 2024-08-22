part of 'layout_cubit.dart';

@immutable
sealed class LayoutState {}

final class LayoutInitial extends LayoutState {}

final class GetBannersSuccess extends LayoutState {}

final class GetBannersLoading extends LayoutState {}

final class GetBannersFailure extends LayoutState {
  final String message;
  GetBannersFailure({required this.message});
}
