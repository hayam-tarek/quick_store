class EndPoints {
  static const String baseUrl = 'https://student.valuxapps.com/api';
  static const String login = '$baseUrl/login';
  static const String register = '$baseUrl/register';
  static const String profile = '$baseUrl/profile';
  static const String categories = '$baseUrl/categories';
  static const String banners = '$baseUrl/banners';
  static const String home = '$baseUrl/home';
  static const String favorites = '$baseUrl/favorites';
  static const String carts = '$baseUrl/carts';
  static const String changePassword = '$baseUrl/change-password';
  static const String updateProfile = '$baseUrl/update-profile';
  static const String logout = '$baseUrl/logout';
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
}
