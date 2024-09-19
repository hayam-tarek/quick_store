import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quick_store/core/api/api.dart';
import 'package:quick_store/core/api/end_points.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/core/utils/token.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  void register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(RegisterLoadingState());
    try {
      var json = await API().post(
        url: EndPoints.register,
        body: {
          ApiKey.name: name,
          ApiKey.email: email,
          ApiKey.password: password,
          ApiKey.phone: phone,
        },
        headers: {
          ApiKey.lang: ApiKey.english,
        },
      );
      if (json[ApiKey.status] == true) {
        await Token.saveToken(token: json[ApiKey.data][ApiKey.token]);
        emit(RegisterSuccessState(message: json[ApiKey.message]));
      } else {
        throw Exception(json[ApiKey.message]);
      }
    } on Exception catch (e) {
      log(e.toString());
      String message = e.toString().replaceFirst('Exception: ', '');
      emit(
        RegisterFailureState(
          error: message,
        ),
      );
    }
  }

  void login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      var json = await API().post(
        url: EndPoints.login,
        body: {
          ApiKey.email: email,
          ApiKey.password: password,
        },
        headers: {
          ApiKey.lang: ApiKey.english,
        },
      );
      if (json[ApiKey.status] == true) {
        await Token.saveToken(token: json[ApiKey.data][ApiKey.token]);
        emit(LoginSuccessState(message: json[ApiKey.message]));
      } else {
        throw Exception(json[ApiKey.message]);
      }
    } on Exception catch (e) {
      log(e.toString());
      String message = e.toString().replaceFirst('Exception: ', '');
      emit(
        LoginFailureState(
          error: message,
        ),
      );
    }
  }

  void logout() async {
    emit(LogoutLoadingState());
    try {
      var json = await API().post(
        url: EndPoints.logout,
        headers: {
          ApiKey.lang: ApiKey.english,
          ApiKey.authorization: kToken!,
        },
        body: null,
      );
      if (json[ApiKey.status] == true) {
        await Token.deleteToken();
        emit(LogoutSuccessState(message: json[ApiKey.message]));
      } else {
        throw Exception(json[ApiKey.message]);
      }
    } on Exception catch (e) {
      log(e.toString());
      String message = e.toString().replaceFirst('Exception: ', '');
      emit(
        LogoutFailureState(
          error: message,
        ),
      );
    }
  }
}
