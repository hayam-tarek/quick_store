import 'package:e_commerce_app/core/networks/local/local_network.dart';
import 'package:e_commerce_app/core/utils/constant.dart';

Future<void> saveToken({required String token}) async {
  await CacheNetwork().setToCache(
    key: 'token',
    value: token,
  );
  kToken = CacheNetwork().getFromCache(key: 'token');
}
