import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/networks/remote/api.dart';
import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  void addOrDeleteFavorite({required int productId}) async {
    emit(FavoriteLoading());
    try {
      var json = await API().post(
        url: '$kBaseURL/favorites',
        body: {
          'product_id': '$productId',
        },
        headers: {
          'lang': 'en',
          'Authorization': kToken!,
        },
      );
      if (json['status'] == true) {
        emit(FavoriteSuccess(message: json['message']));
      } else {
        throw Exception(json['message']);
      }
    } catch (e) {
      log(e.toString());
      String message = e.toString().replaceFirst('Exception: ', '');
      emit(
        FavoriteFailure(
          message: message,
        ),
      );
    }
  }
}
