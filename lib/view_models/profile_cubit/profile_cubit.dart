import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/networks/remote/api.dart';
import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/models/user_data_model.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  UserDataModel? userDataModel;
  void getProfile({
    required String token,
  }) async {
    emit(GetProfileLoading());
    try {
      var json = await API().get(
        url: '$kBaseURL/profile',
        headers: {
          'Authorization': token,
          'lang': 'en',
        },
      );
      if (json['status'] == true) {
        userDataModel = UserDataModel.fromJSON(json: json['data']);
        emit(GetProfileSuccess());
      } else {
        throw Exception(json['message']);
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
}
