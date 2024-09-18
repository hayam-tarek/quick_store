import 'package:quick_store/core/utils/constant.dart';
import 'package:flutter/material.dart';

class HelperText extends StatelessWidget {
  const HelperText({
    super.key,
    required this.firstText,
    required this.secondText,
    this.onSecondTextPressed,
  });
  final String firstText;
  final String secondText;
  final void Function()? onSecondTextPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        TextButton(
          onPressed: onSecondTextPressed,
          child: Text(
            secondText,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: kSecondaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
