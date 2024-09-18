import 'package:quick_store/core/services/local_storage.dart';
import 'package:quick_store/core/utils/constant.dart';

Future<void> saveToken({required String token}) async {
  await LocalData().setToCache(
    key: 'token',
    value: token,
  );
  kToken = LocalData().getFromCache(key: 'token');
}
