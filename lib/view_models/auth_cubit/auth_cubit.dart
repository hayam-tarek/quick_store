import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/networks/remote/api.dart';
import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/core/utils/save_token.dart';
import 'package:flutter/material.dart';

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
        url: '$kBaseURL/register',
        body: {
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
        },
        headers: {
          'lang': 'en',
        },
      );
      if (json['status'] == true) {
        await saveToken(token: json['data']['token']);
        emit(RegisterSuccessState());
      } else {
        throw Exception(json['message']);
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
        url: '$kBaseURL/login',
        body: {
          'email': email,
          'password': password,
        },
        headers: {
          'lang': 'en',
        },
      );
      if (json['status'] == true) {
        await saveToken(token: json['data']['token']);
        emit(LoginSuccessState());
      } else {
        throw Exception(json['message']);
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
}
