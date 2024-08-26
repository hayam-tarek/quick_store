import 'dart:developer';

import 'package:e_commerce_app/helper/api.dart';
import 'package:e_commerce_app/helper/constant.dart';
import 'package:e_commerce_app/models/category_model.dart';

class CategoriesService {
  Future<List<CategoryModel>> getCategories() async {
    try {
      var json = await API().get(
        url: '$kBaseURL/categories',
        headers: {
          'lang': 'en',
        },
      );
      if (json['status'] == true) {
        List<dynamic> data = json['data']['data'];
        List<CategoryModel> categories = [];
        for (var item in data) {
          categories.add(CategoryModel.fromJSON(json: item));
        }
        return categories;
      } else {
        throw Exception(json['message']);
      }
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }
}
