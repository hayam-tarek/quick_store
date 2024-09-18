import 'package:quick_store/core/utils/constant.dart';
import 'package:flutter/material.dart';

class TitleWithButton extends StatelessWidget {
  const TitleWithButton({
    super.key,
    required this.title,
    required this.buttonTitle,
    this.onPressed,
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
        onPressed != null
            ? TextButton(
                onPressed: onPressed,
                child: Text(
                  buttonTitle,
                  style: TextStyle(
                    color: kPrimaryColor.withOpacity(
                      .7,
                    ),
                  ),
                ),
              )
            : Text(
                buttonTitle,
                style: TextStyle(
                  color: kPrimaryColor.withOpacity(
                    .7,
                  ),
                ),
              ),
      ],
    );
  }
}
