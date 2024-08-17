import 'package:e_commerce_app/helper/constant.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.controller,
    this.validator,
    this.validatorText,
    this.keyboardType,
    this.obscureText,
    this.suffixIcon,
  });
  final String labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? validatorText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kPrimaryColor,
      cursorErrorColor: Colors.red,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      controller: controller,
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return validatorText;
            }
            return null;
          },
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconColor: Colors.grey,
        labelText: labelText,
        labelStyle: const TextStyle(
          color: kPrimaryColor,
          fontSize: 12,
        ),
        enabledBorder: customOutlineInputBorder(),
        focusedBorder: customOutlineInputBorder(),
        errorBorder: customErrorOutlineInputBorder(),
        focusedErrorBorder: customErrorOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder customErrorOutlineInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          5,
        ),
      ),
      borderSide: BorderSide(
        color: Colors.red,
      ),
    );
  }

  OutlineInputBorder customOutlineInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          10,
        ),
      ),
      borderSide: BorderSide(
        color: kPrimaryColor,
      ),
    );
  }
}
