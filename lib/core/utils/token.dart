import 'dart:developer';

import 'package:quick_store/core/services/local_storage.dart';
import 'package:quick_store/core/utils/constant.dart';

class Token {
  static Future<void> saveToken({required String token}) async {
    await LocalData().setToCache(
      key: 'token',
      value: token,
    );
    kToken = LocalData().getFromCache(key: 'token');
    log(kToken!);
  }

  static Future<void> deleteToken() async {
    await LocalData().removeFromCache(
      key: 'token',
    );
    kToken = null;
    log('$kToken');
  }
}
