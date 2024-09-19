import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quick_store/core/api/api.dart';
import 'package:quick_store/core/api/end_points.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/models/user_data_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  UserDataModel? userDataModel;
  Future<void> getProfile() async {
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

  void updateProfile({
    required String name,
    required String email,
    required String phone,
    //required String image,
  }) async {
    emit(UpdateProfileLoading());
    try {
      var json = await API().put(
        url: EndPoints.updateProfile,
        headers: {
          ApiKey.authorization: kToken!,
          ApiKey.lang: ApiKey.english,
        },
        body: {
          ApiKey.name: name,
          ApiKey.email: email,
          ApiKey.phone: phone,
          //ApiKey.image: image,
        },
      );
      if (json[ApiKey.status] == true) {
        await getProfile();
        emit(
          UpdateProfileSuccess(
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
        UpdateProfileFailure(
          message: message,
        ),
      );
    }
  }
}
