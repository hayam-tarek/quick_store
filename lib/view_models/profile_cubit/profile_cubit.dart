import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/api/api.dart';
import 'package:e_commerce_app/core/api/end_points.dart';
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
        url: EndPoints.profile,
        headers: {
          ApiKey.authorization: token,
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
}
