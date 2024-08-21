import 'package:e_commerce_app/modules/widgets/custom_text_florm_field.dart';
import 'package:flutter/material.dart';

class CustomPasswordTextFormField extends StatefulWidget {
  const CustomPasswordTextFormField({
    super.key,
    this.passwordController,
  });
  final TextEditingController? passwordController;

  @override
  State<CustomPasswordTextFormField> createState() =>
      _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState
    extends State<CustomPasswordTextFormField> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      prefixIcon: const Icon(Icons.password),
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            obscurePassword = !obscurePassword;
          });
        },
        icon: obscurePassword
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility),
      ),
      obscureText: obscurePassword,
      keyboardType: TextInputType.visiblePassword,
      labelText: 'Password',
      controller: widget.passwordController,
      validatorText: 'Please enter your password',
    );
  }
}
