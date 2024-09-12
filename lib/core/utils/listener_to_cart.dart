import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/view_models/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/views/widgets/custom_snake_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void listenerToCart(BuildContext context, CartState cartState) {
  bool isLoading = false;
  if (cartState is AddOrDeleteFromCartLoading) {
    isLoading = true;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const CupertinoActivityIndicator(
          color: kSecondaryColor,
        );
      },
    ).then((_) {
      isLoading = false;
    });
  }
  if (cartState is AddOrDeleteFromCartSuccess) {
    if (!isLoading) {
      Navigator.pop(context);
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(customSnackBar(text: cartState.message));
  }
  if (cartState is AddOrDeleteFromCartFailure) {
    if (!isLoading) {
      Navigator.pop(context);
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(customSnackBar(text: cartState.message));
  }
}
