import 'package:quick_store/core/utils/constant.dart';
import 'package:flutter/material.dart';

AppBar customAppBar() {
  return AppBar(
    centerTitle: true,
    backgroundColor: kBackgroundColor,
    title: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Quick',
          style: TextStyle(
            fontFamily: kPrimaryFont,
            fontSize: 35,
            color: kPrimaryColor,
          ),
        ),
        Text(
          'Store',
          style: TextStyle(
            fontFamily: kPrimaryFont,
            fontSize: 35,
            color: kSecondaryColor,
          ),
        ),
      ],
    ),
  );
}
