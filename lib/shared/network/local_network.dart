import 'package:shared_preferences/shared_preferences.dart';

class CacheNetwork {
  static late SharedPreferences sharedPref;

  static Future cacheInitialization() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  Future<bool> setToCache({
    required String key,
    required String value,
  }) async {
    return await sharedPref.setString(key, value);
  }

  String? getFromCache({
    required String key,
  }) {
    return sharedPref.getString(key);
  }

  Future<bool> removeFromCache({
    required String key,
  }) async {
    return await sharedPref.remove(key);
  }
}
