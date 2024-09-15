part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class GetProfileSuccess extends ProfileState {}

final class GetProfileLoading extends ProfileState {}

final class GetProfileFailure extends ProfileState {
  final String message;
  GetProfileFailure({required this.message});
}

final class ChangePasswordSuccess extends ProfileState {
  final String message;
  ChangePasswordSuccess({required this.message});
}

final class ChangePasswordLoading extends ProfileState {}

final class ChangePasswordFailure extends ProfileState {
  final String message;
  ChangePasswordFailure({required this.message});
}
