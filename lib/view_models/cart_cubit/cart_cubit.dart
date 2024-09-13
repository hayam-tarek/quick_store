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

  Future<void> addOrDeleteFromCart({required int productId}) async {
    emit(AddOrDeleteFromCartLoading());
    try {
      var json = await API().post(
        url: EndPoints.carts,
        body: {
          ApiKey.productId: '$productId',
        },
        headers: {
          ApiKey.lang: ApiKey.english,
          ApiKey.authorization: kToken!,
        },
      );
      if (json[ApiKey.status] == true) {
        if (cartItemsID.contains(productId)) {
          cartItemsID.remove(productId);
        } else {
          cartItemsID.add(productId);
        }
        emit(AddOrDeleteFromCartSuccess(message: json[ApiKey.message]));
      } else {
        throw Exception(json[ApiKey.message]);
      }
    } catch (e) {
      log(e.toString());
      String message = e.toString().replaceFirst('Exception: ', '');
      emit(
        AddOrDeleteFromCartFailure(
          message: message,
        ),
      );
    }
  }

  List<ProductModel> cart = [];
  Set<num> cartItemsID = {};
  num total = 0;
  num subTotal = 0;
  void getCart() async {
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
        cart = [];
        cartItemsID = {};
        subTotal = json[ApiKey.data][ApiKey.subTotal];
        total = json[ApiKey.data][ApiKey.total];
        List<dynamic> cartItems = json[ApiKey.data][ApiKey.cartItems];
        for (var item in cartItems) {
          cart.add(ProductModel.fromJson(item[ApiKey.product]));
          cartItemsID.add(item[ApiKey.product][ApiKey.id]);
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
