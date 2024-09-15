import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/api/api.dart';
import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/models/user_data_model.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  UserDataModel? userDataModel;
  void getProfile() async {
    emit(GetProfileLoading());
    try {
      var json = await API().get(
        url: EndPoints.profile,
        headers: {
          ApiKey.authorization: kToken!,
          ApiKey.lang: ApiKey.english,
        },
      );
      if (json[ApiKey.status] == true) {
        userDataModel = UserDataModel.fromJSON(json: json[ApiKey.data]);
        emit(GetProfileSuccess());
      } else {
        throw Exception(json[ApiKey.message]);
      }
    } on Exception catch (e) {
      log(e.toString());
      String message = e.toString().replaceFirst('Exception: ', '');
      emit(
        GetProfileFailure(
          message: message,
        ),
      );
    }
  }

  void changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    emit(ChangePasswordLoading());
    try {
      var json = await API().post(
        url: EndPoints.changePassword,
        headers: {
          ApiKey.authorization: kToken!,
          ApiKey.lang: ApiKey.english,
        },
        body: {
          ApiKey.oldPassword: oldPassword,
          ApiKey.newPassword: newPassword,
        },
      );
      if (json[ApiKey.status] == true) {
        emit(
          ChangePasswordSuccess(
            message: json[ApiKey.message],
          ),
        );
      } else {
        throw Exception(json[ApiKey.message]);
      }
    } on Exception catch (e) {
      log(e.toString());
      String message = e.toString().replaceFirst('Exception: ', '');
      emit(
        ChangePasswordFailure(
          message: message,
        ),
      );
    }
  }
}
