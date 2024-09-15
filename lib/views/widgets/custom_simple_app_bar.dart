import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:flutter/material.dart';

AppBar customSimpleAppBar({
  required BuildContext context,
  required String title,
}) {
  return AppBar(
    backgroundColor: kPrimaryColor,
    foregroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontFamily: kPrimaryFont,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    ),
  );
}
