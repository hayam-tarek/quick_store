import 'package:e_commerce_app/helper/constant.dart';
import 'package:flutter/material.dart';

class TitleWithButton extends StatelessWidget {
  const TitleWithButton({
    super.key,
    required this.title,
    required this.buttonTitle,
    required this.onPressed,
  });
  final String title;
  final String buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonTitle,
            style: TextStyle(
              color: kPrimaryColor.withOpacity(
                .7,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
