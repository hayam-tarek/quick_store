import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/api/api.dart';
import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  Future<void> addOrDeleteFavorite({required int productId}) async {
    emit(AddOrDeleteFavoriteLoading());
    try {
      var json = await API().post(
        url: EndPoints.favorites,
        body: {
          ApiKey.productId: '$productId',
        },
        headers: {
          ApiKey.lang: ApiKey.english,
          ApiKey.authorization: kToken!,
        },
      );
      if (json[ApiKey.status] == true) {
        if (favoritesID.contains(productId)) {
          favoritesID.remove(productId);
        } else {
          favoritesID.add(productId);
        }
        emit(AddOrDeleteFavoriteSuccess(message: json[ApiKey.message]));
      } else {
        throw Exception(json[ApiKey.message]);
      }
    } catch (e) {
      log(e.toString());
      String message = e.toString().replaceFirst('Exception: ', '');
      emit(
        AddOrDeleteFavoriteFailure(
          message: message,
        ),
      );
    }
  }

  List<ProductModel> favorites = [];
  Set<num> favoritesID = {};
  void getFavorite() async {
    favorites = [];
    favoritesID = {};
    emit(GetFavoriteLoading());
    try {
      var json = await API().get(
        url: EndPoints.favorites,
        headers: {
          ApiKey.lang: ApiKey.english,
          ApiKey.authorization: kToken!,
        },
      );
      if (json[ApiKey.status] == true) {
        List<dynamic> favoritesData = json[ApiKey.data][ApiKey.data];
        for (var item in favoritesData) {
          favorites.add(ProductModel.fromJson(item[ApiKey.product]));
          favoritesID.add(item[ApiKey.product][ApiKey.id]);
        }
        emit(GetFavoriteSuccess());
      } else {
        throw Exception(json[ApiKey.message]);
      }
    } catch (e) {
      log(e.toString());
      String message = e.toString().replaceFirst('Exception: ', '');
      emit(
        GetFavoriteFailure(
          message: message,
        ),
      );
    }
  }
}
