import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:flutter/material.dart';

SnackBar customSnackBar({required String text}) {
  return SnackBar(
    content: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: kPrimaryColor,
    duration: const Duration(
      seconds: 2,
    ),
  );
}
