import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/api/api.dart';
import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/models/category_model.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  List<CategoryModel> categories = [];
  void getCategories() async {
    emit(GetCategoriesLoading());
    try {
      var json = await API().get(
        url: EndPoints.categories,
        headers: {
          ApiKey.lang: ApiKey.english,
        },
      );
      if (json[ApiKey.status] == true) {
        List<dynamic> data = json[ApiKey.data][ApiKey.data];
        for (var item in data) {
          categories.add(CategoryModel.fromJSON(json: item));
        }
        emit(GetCategoriesSuccess());
      } else {
        throw Exception(json[ApiKey.message]);
      }
    } on Exception catch (e) {
      log(e.toString());
      String message = e.toString().replaceFirst('Exception: ', '');
      emit(
        GetCategoriesFailure(
          message: message,
        ),
      );
    }
  }
}
