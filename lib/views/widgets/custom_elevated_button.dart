import 'package:quick_store/core/utils/constant.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.color,
    required this.text,
    this.onPressed,
  });
  final Color color;
  final String text;
  final void Function()? onPressed;

  @override.Widget
  build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        backgroundColor: color,
        minimumSize: const Size(
          double.infinity,
          40,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Adjust radius as needed
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: kForegroundColor,
        ),
      ),
    );
  }
}
