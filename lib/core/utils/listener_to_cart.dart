import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/view_models/cart_cubit/cart_cubit.dart';

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
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(customSnackBar(text: cartState.message,backgroundColor: Colors.green));
  }
  if (cartState is AddOrDeleteFromCartFailure) {
    if (!isLoading) {
      Navigator.pop(context);
    }
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(customSnackBar(text: cartState.message,backgroundColor: Colors.red[600]!));
  }
}
