import 'package:quick_store/core/utils/constant.dart';

class EndPoints {
  static final String baseUrl = kApiBaseUrl;
  static final String login = '$baseUrl/login';
  static final String register = '$baseUrl/register';
  static final String profile = '$baseUrl/profile';
  static final String categories = '$baseUrl/categories';
  static final String banners = '$baseUrl/banners';
  static final String home = '$baseUrl/home';
  static final String favorites = '$baseUrl/favorites';
  static final String carts = '$baseUrl/carts';
  static final String changePassword = '$baseUrl/change-password';
  static final String updateProfile = '$baseUrl/update-profile';
  static final String logout = '$baseUrl/logout';
  static final String addAddress = '$baseUrl/addresses';
  static String categoryProducts({required num id}) {
    return '$baseUrl/categories/$id';
  }

  static String productDetails({required num id}) {
    return '$baseUrl/products/$id';
  }

  static String updateCart({required num id}) {
    return '$baseUrl/carts/$id';
  }
}

class ApiKey {
  static const String authorization = 'Authorization';
  static const String lang = 'lang';
  static const String status = 'status';
  static const String data = 'data';
  static const String message = 'message';
  static const String name = 'name';
  static const String email = 'email';
  static const String password = 'password';
  static const String phone = 'phone';
  static const String image = 'image';
  static const String token = 'token';
  static const String english = 'en';
  static const String arabic = 'ar';
  static const String products = 'products';
  static const String product = 'product';
  static const String productId = 'product_id';
  static const String id = 'id';
  static const String cartItems = 'cart_items';
  static const String subTotal = 'sub_total';
  static const String total = 'total';
  static const String oldPassword = 'current_password';
  static const String newPassword = 'new_password';
  static const String quantity = 'quantity';
  static const String address = 'address';
  static const String addresses = 'addresses';
  static const String city = 'city';
  static const String region = 'region';
  static const String details = 'details';
  static const String notes = 'notes';
  static const String lat = 'latitude';
  static const String lng = 'longitude';
}
