import 'package:flutter/material.dart';
import 'package:quick_store/core/utils/constant.dart';

SnackBar customSnackBar({
  required String text,
  bool showCloseIcon = false,
  Color backgroundColor = kPrimaryColor,
}) {
  return SnackBar(
    showCloseIcon: showCloseIcon,
    content: Text(
      text,
      style: const TextStyle(
        color: kForegroundColor,
        fontFamily: kPrimaryFont,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    ),
    backgroundColor: backgroundColor,
    duration: Duration(
      seconds: showCloseIcon ? 1000 : 3,
    ),
  );
}
