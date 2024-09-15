import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:flutter/material.dart';

SnackBar customSnackBar({required String text, bool showCloseIcon = false}) {
  return SnackBar(
    showCloseIcon: showCloseIcon,
    content: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: kPrimaryColor,
    duration: Duration(
      seconds: showCloseIcon ? 1000 : 3,
    ),
  );
}
