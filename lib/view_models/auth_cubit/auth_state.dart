part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitialState extends AuthState {}

final class RegisterLoadingState extends AuthState {}

final class RegisterSuccessState extends AuthState {
  final String message;
  RegisterSuccessState({
    required this.message,
  });
}

final class RegisterFailureState extends AuthState {
  final String error;
  RegisterFailureState({
    required this.error,
  });
}

final class LoginLoadingState extends AuthState {}

final class LoginSuccessState extends AuthState {
  final String message;
  LoginSuccessState({
    required this.message,
  });
}

final class LoginFailureState extends AuthState {
  final String error;
  LoginFailureState({
    required this.error,
  });
}

final class LogoutLoadingState extends AuthState {}

final class LogoutSuccessState extends AuthState {
  final String message;
  LogoutSuccessState({
    required this.message,
  });
}

final class LogoutFailureState extends AuthState {
  final String error;
  LogoutFailureState({
    required this.error,
  });
}
