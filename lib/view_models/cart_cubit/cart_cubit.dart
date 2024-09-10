import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/api/api.dart';
import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<ProductModel> cart = [];
  int total = 0;
  int subTotal = 0;
  void getCart() async {
    cart = [];
    emit(GetCartLoading());
    try {
      var json = await API().get(
        url: EndPoints.carts,
        headers: {
          ApiKey.lang: ApiKey.english,
          ApiKey.authorization: kToken!,
        },
      );
      if (json[ApiKey.status] == true) {
        subTotal = json[ApiKey.data][ApiKey.subTotal];
        total = json[ApiKey.data][ApiKey.total];
        List<dynamic> cartData = json[ApiKey.data][ApiKey.cartItems];
        for (var item in cartData) {
          cart.add(ProductModel.fromJson(item[ApiKey.product]));
        }
        emit(GetCartSuccess());
      } else {
        throw Exception(json[ApiKey.message]);
      }
    } catch (e) {
      log(e.toString());
      String message = e.toString().replaceFirst('Exception: ', '');
      emit(
        GetCartFailure(
          message: message,
        ),
      );
    }
  }
}
