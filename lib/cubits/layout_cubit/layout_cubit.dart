import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/helper/constant.dart';
import 'package:e_commerce_app/models/user_data_model.dart';
import 'package:e_commerce_app/shared/services/api.dart';
import 'package:meta/meta.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
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
