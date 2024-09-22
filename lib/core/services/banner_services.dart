import 'dart:developer';

import 'package:quick_store/core/api/api.dart';
import 'package:quick_store/core/api/end_points.dart';
import 'package:quick_store/models/banner_model.dart';

class BannerService {
  Future<List<BannerModel>> getBanners() async {
    try {
      var json = await API().get(
        url: EndPoints.banners,
        headers: {},
      );
      if (json[ApiKey.status] == true) {
        List<dynamic> data = json[ApiKey.data];
        List<BannerModel> banners = [];
        for (var item in data) {
          banners.add(BannerModel.fromJSON(json: item));
        }
        banners.shuffle();
        return banners;
      } else {
        throw Exception(json[ApiKey.message]);
      }
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }
}
