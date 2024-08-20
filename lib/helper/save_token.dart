import 'package:e_commerce_app/helper/constant.dart';
import 'package:e_commerce_app/shared/network/local_network.dart';

saveToken({required String token}) async {
  await CacheNetwork().setToCache(
    key: 'token',
    value: token,
  );
  kToken = CacheNetwork().getFromCache(key: 'token');
}
