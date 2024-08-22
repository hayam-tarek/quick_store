import 'package:e_commerce_app/helper/constant.dart';
import 'package:flutter/material.dart';

AppBar customAppBar() {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
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
