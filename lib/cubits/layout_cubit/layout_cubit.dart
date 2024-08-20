import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/helper/api.dart';
import 'package:e_commerce_app/helper/constant.dart';
import 'package:e_commerce_app/models/user_data_model.dart';
import 'package:meta/meta.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  UserDataModel? userDataModel;

  void getProfile({
    required String token,
  }) async {
    emit(GetProfileLoading());
    var profileData = await API().get(
      url: '$kBaseURL/profile',
      headers: {
        'Authorization': token,
        'lang': 'en',
      },
    );
    if (profileData['status'] == true) {
      userDataModel = UserDataModel.fromJSON(json: profileData['data']);
      emit(GetProfileSuccess());
    } else {
      emit(
        GetProfileFailure(
          message: profileData['message'],
        ),
      );
    }
  }
}
