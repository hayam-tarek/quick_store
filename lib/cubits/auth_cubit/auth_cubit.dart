import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/helper/api.dart';
import 'package:e_commerce_app/helper/constant.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  //Register
  void register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(RegisterLoadingState());
    var registerData = await API().post(
      url: '$kBaseURL/register',
      body: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
      token: '',
    );
    if (registerData['status'] == true) {
      emit(RegisterSuccessState());
    } else {
      emit(
        RegisterErrorState(
          error: registerData['message'],
        ),
      );
    }
  }

  void login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    var loginData = await API().post(
      url: '$kBaseURL/login',
      body: {
        'email': email,
        'password': password,
      },
      token: '',
    );
    if (loginData['status'] == true) {
      emit(LoginSuccessState());
    } else {
      emit(
        LoginErrorState(
          error: loginData['message'],
        ),
      );
    }
  }
}
