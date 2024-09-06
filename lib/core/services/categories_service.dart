import 'dart:developer';

import 'package:e_commerce_app/core/api/api.dart';
import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/models/category_model.dart';

class CategoriesService {
  Future<List<CategoryModel>> getCategories() async {
    try {
      var json = await API().get(
        url: EndPoints.categories,
        headers: {
          ApiKey.lang: ApiKey.english,
        },
      );
      if (json[ApiKey.status] == true) {
        List<dynamic> data = json[ApiKey.data][ApiKey.data];
        List<CategoryModel> categories = [];
        for (var item in data) {
          categories.add(CategoryModel.fromJSON(json: item));
        }
        return categories;
      } else {
        throw Exception(json[ApiKey.message]);
      }
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }
}
