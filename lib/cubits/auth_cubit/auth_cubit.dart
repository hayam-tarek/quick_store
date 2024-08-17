import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/helper/api.dart';
import 'package:e_commerce_app/helper/constant.dart';
import 'package:meta/meta.dart';

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
    emit(AuthLoadingState());
    var responseBody = await API().post(
      url: '$kBaseURL/register',
      body: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    );
    if (responseBody['status'] == true) {
      emit(RegisterSuccessState());
    } else {
      emit(
        RegisterErrorState(
          error: responseBody['message'],
        ),
      );
    }
  }
}
