import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/api/api.dart';
import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/core/utils/constant.dart';
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
        url: EndPoints.home,
        headers: {
          ApiKey.lang: ApiKey.english,
          ApiKey.authorization: kToken!,
        },
      );
      if (json[ApiKey.status] == true) {
        List<dynamic> productsData = json[ApiKey.data][ApiKey.products];
        for (var item in productsData) {
          products.add(ProductModel.fromJson(item));
        }
        emit(GetProductsSuccess());
      } else {
        throw Exception(json[ApiKey.message]);
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

  List<ProductModel> filteredProducts = [];
  void filterProducts({required String query}) {
    if (query.isEmpty || query == '') {
      filteredProducts = [];
    } else {
      filteredProducts = products
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    emit(GetProductsSuccess());
  }

  // List<BannerModel> banners = [];

  // void getBanners() async {
  //   emit(GetBannersLoading());
  //   try {
  //     var json = await API().get(
  //       url: '$kBaseURL/banners',
  //       headers: {},
  //     );
  //     if (json[ApiKey.status] == true) {
  //       List<dynamic> data = json[ApiKey.data];
  //       for (var item in data) {
  //         banners.add(BannerModel.fromJSON(json: item));
  //       }
  //       emit(GetBannersSuccess());
  //     } else {
  //       throw Exception(json[ApiKey.message]);
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
  //         ApiKey.lang: ApiKey.english,
  //       },
  //     );
  //     if (json[ApiKey.status] == true) {
  //       List<dynamic> data = json[ApiKey.data][ApiKey.data];
  //       for (var item in data) {
  //         categories.add(CategoryModel.fromJSON(json: item));
  //       }
  //       emit(GetCategoriesSuccess());
  //     } else {
  //       throw Exception(json[ApiKey.message]);
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
