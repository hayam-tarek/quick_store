import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    required this.color,
    required this.text,
    this.onPressed,
  });
  final Color color;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 30,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      textColor: Colors.white,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      color: color,
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
    );
  }
}
