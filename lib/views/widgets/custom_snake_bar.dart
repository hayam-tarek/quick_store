import 'package:quick_store/core/utils/constant.dart';
import 'package:flutter/material.dart';

SnackBar customSnackBar({required String text, bool showCloseIcon = false}) {
  return SnackBar(
    showCloseIcon: showCloseIcon,
    content: Text(
      text,
      style: const TextStyle(
        color: kForegroundColor,
      ),
    ),
    backgroundColor: kPrimaryColor,
    duration: Duration(
      seconds: showCloseIcon ? 1000 : 3,
    ),
  );
}
