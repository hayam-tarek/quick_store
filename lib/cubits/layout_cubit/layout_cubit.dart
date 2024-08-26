import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/helper/api.dart';
import 'package:e_commerce_app/helper/constant.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:meta/meta.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  List<ProductModel> products = [];
  void getProducts() async {
    emit(GetProductsLoading());
    try {
      var json = await API().get(
        url: '$kBaseURL/home',
        headers: {
          'lang': 'en',
          'Authorization': kToken!,
        },
      );
      if (json['status'] == true) {
        List<dynamic> productsData = json['data']['products'];
        for (var item in productsData) {
          products.add(ProductModel.fromJson(item));
        }
        emit(GetProductsSuccess());
      } else {
        throw Exception(json['message']);
      }
    } catch (e) {
      log(e.toString());
      String message = e.toString().replaceFirst('Exception: ', '');
      emit(
        GetProductsFailure(
          message: message,
        ),
      );
    }
  }

  // List<BannerModel> banners = [];

  // void getBanners() async {
  //   emit(GetBannersLoading());
  //   try {
  //     var json = await API().get(
  //       url: '$kBaseURL/banners',
  //       headers: {},
  //     );
  //     if (json['status'] == true) {
  //       List<dynamic> data = json['data'];
  //       for (var item in data) {
  //         banners.add(BannerModel.fromJSON(json: item));
  //       }
  //       emit(GetBannersSuccess());
  //     } else {
  //       throw Exception(json['message']);
  //     }
  //   } on Exception catch (e) {
  //     log(e.toString());
  //     String message = e.toString().replaceFirst('Exception: ', '');
  //     emit(
  //       GetBannersFailure(
  //         message: message,
  //       ),
  //     );
  //   }
  // }

  // List<CategoryModel> categories = [];

  // void getCategories() async {
  //   emit(GetCategoriesLoading());
  //   try {
  //     var json = await API().get(
  //       url: '$kBaseURL/categories',
  //       headers: {
  //         'lang': 'en',
  //       },
  //     );
  //     if (json['status'] == true) {
  //       List<dynamic> data = json['data']['data'];
  //       for (var item in data) {
  //         categories.add(CategoryModel.fromJSON(json: item));
  //       }
  //       emit(GetCategoriesSuccess());
  //     } else {
  //       throw Exception(json['message']);
  //     }
  //   } on Exception catch (e) {
  //     log(e.toString());
  //     String message = e.toString().replaceFirst('Exception: ', '');
  //     emit(
  //       GetCategoriesFailure(
  //         message: message,
  //       ),
  //     );
  //   }
  // }
}
