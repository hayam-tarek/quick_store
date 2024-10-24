import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quick_store/core/api/api.dart';
import 'package:quick_store/core/api/end_points.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/models/cart_model.dart';
import 'package:quick_store/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Future<void> updateCart({
    required CartItemModel cartItemModel,
    required int quantity,
  }) async {
    cartItemModel.quantity += quantity;
    int targetQuantity = cartItemModel.quantity;
    if (quantity > 0) {
      total += cartItemModel.productModel.price;
      subTotal += cartItemModel.productModel.price;
    } else {
      total -= cartItemModel.productModel.price;
      subTotal -= cartItemModel.productModel.price;
    }
    emit(UpdateCartLoading());
    try {
      var json = await API().put(
        url: EndPoints.updateCart(id: cartItemModel.id),
        body: {
          ApiKey.quantity: '$targetQuantity',
        },
        headers: {
          ApiKey.lang: ApiKey.english,
          ApiKey.authorization: kToken!,
        },
      );
      if (json[ApiKey.status] == true) {
        emit(UpdateCartSuccess(message: json[ApiKey.message]));
        // getCart();
      } else {
        cartItemModel.quantity -= quantity;
        if (quantity > 0) {
          total -= cartItemModel.productModel.price;
        } else {
          total += cartItemModel.productModel.price;
        }
        throw Exception(json[ApiKey.message]);
      }
    } catch (e) {
      log(e.toString());
      String message = e.toString().replaceFirst('Exception: ', '');
      emit(
        UpdateCartFailure(
          message: message,
        ),
      );
    }
  }

  Future<void> addOrDeleteFromCart({
    required int productId,
    required ProductModel productModel,
  }) async {
    if (cartItemsID.contains(productId)) {
      cartItemsID.remove(productId);
      cart.removeWhere(
          (cartItemModel) => cartItemModel.productModel.id == productId);
      total -= productModel.price;
      subTotal -= productModel.price;
    } else {
      cartItemsID.add(productId);
      total += productModel.price;
      subTotal += productModel.price;
    }
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
        emit(AddOrDeleteFromCartSuccess(message: json[ApiKey.message]));
        // getCart();
      } else {
        if (cartItemsID.contains(productId)) {
          cartItemsID.remove(productId);
        } else {
          cartItemsID.add(productId);
        }
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

  List<CartItemModel> cart = [];
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
          cart.add(CartItemModel.fromJson(item));
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
