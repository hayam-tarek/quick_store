import 'package:flutter/material.dart';
import 'package:quick_store/views/widgets/custom_text_florm_field.dart';

class CustomEmailTextFormField extends StatelessWidget {
  const CustomEmailTextFormField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      prefixIcon: const Icon(Icons.email),
      keyboardType: TextInputType.emailAddress,
      labelText: 'Email',
      controller: emailController,
      validatorText: 'Please enter your email',
    );
  }
}
