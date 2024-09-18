import 'package:quick_store/core/utils/constant.dart';
import 'package:flutter/material.dart';

AppBar customSimpleAppBar({
  required BuildContext context,
  required String title,
}) {
  return AppBar(
    backgroundColor: kBackgroundColor,
    foregroundColor: kPrimaryColor,
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(
        color: kPrimaryColor,
        fontFamily: kPrimaryFont,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    ),
  );
}
