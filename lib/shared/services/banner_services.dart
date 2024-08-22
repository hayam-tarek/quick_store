import 'dart:developer';

import 'package:e_commerce_app/helper/constant.dart';
import 'package:e_commerce_app/models/banner_model.dart';
import 'package:e_commerce_app/shared/services/api.dart';

class BannerService {
  Future<List<BannerModel>> getBanners() async {
    try {
      var json = await API().get(
        url: '$kBaseURL/banners',
        headers: {},
      );
      if (json['status'] == true) {
        List<dynamic> data = json['data'];
        List<BannerModel> banners = [];
        for (var item in data) {
          banners.add(BannerModel.fromJSON(json: item));
        }
        return banners;
      } else {
        throw Exception(json['message']);
      }
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }
}
