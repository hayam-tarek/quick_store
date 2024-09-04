import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalNetwork {
  Future<bool> setToCache({required String key, required String value});
  String? getFromCache({required String key});
  Future<bool> removeFromCache({required String key});
}

class CacheNetwork extends LocalNetwork {
  static late SharedPreferences sharedPref;

  static Future cacheInitialization() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  @override
  Future<bool> setToCache({
    required String key,
    required String value,
  }) async {
    return await sharedPref.setString(key, value);
  }

  @override
  String? getFromCache({
    required String key,
  }) {
    return sharedPref.getString(key);
  }

  @override
  Future<bool> removeFromCache({
    required String key,
  }) async {
    return await sharedPref.remove(key);
  }
}
