import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/helper/api.dart';
import 'package:e_commerce_app/helper/constant.dart';
import 'package:e_commerce_app/models/user_data_model.dart';
import 'package:e_commerce_app/shared/network/local_network.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  UserDataModel? userDataModel;

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
      headers: {
        'lang': 'en',
      },
    );
    if (registerData['status'] == true) {
      await CacheNetwork().setToCache(
        key: 'token',
        value: registerData['data']['token'],
      );
      userDataModel = UserDataModel.fromJSON(json: registerData['data']);
      emit(RegisterSuccessState());
    } else {
      emit(
        RegisterFailureState(
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
      headers: {
        'lang': 'en',
      },
    );
    if (loginData['status'] == true) {
      await CacheNetwork().setToCache(
        key: 'token',
        value: loginData['data']['token'],
      );
      userDataModel = UserDataModel.fromJSON(json: loginData['data']);
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
