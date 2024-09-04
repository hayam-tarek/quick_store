import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:flutter/material.dart';

AppBar customSimpleAppBar({
  required BuildContext context,
  required String title,
}) {
  return AppBar(
    backgroundColor: kPrimaryColor,
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_rounded,
        color: Colors.white,
        size: 30,
      ),
    ),
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
