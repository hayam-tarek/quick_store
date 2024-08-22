import 'package:e_commerce_app/helper/constant.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    required this.text,
    this.fontSize = 40,
  });
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,
        fontFamily: kPrimaryFont,
      ),
    );
  }
}
