import 'package:flutter/material.dart';
import 'package:quick_store/core/utils/constant.dart';

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
    this.prefixIcon,
    this.initialValue,
    this.onSaved,
  });
  final String labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? validatorText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? initialValue;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      initialValue: initialValue,
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
        // filled: true,
        // fillColor: kSecondaryColor.withOpacity(.1),
        suffixIcon: suffixIcon,
        suffixIconColor: Colors.grey,
        prefixIcon: prefixIcon,
        prefixIconColor: kSecondaryColor.withOpacity(.75),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: kPrimaryColor,
          fontSize: 16,
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
          10,
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
          15,
        ),
      ),
      borderSide: BorderSide(
        color: kPrimaryColor,
      ),
    );
  }
}
