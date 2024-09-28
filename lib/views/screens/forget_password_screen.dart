import 'package:flutter/material.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/views/widgets/custom_material_button.dart';
import 'package:quick_store/views/widgets/custom_simple_app_bar.dart';
import 'package:quick_store/views/widgets/custom_text_florm_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: customSimpleAppBar(title: 'Forget Password', context: context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                'assets/images/forget.png',
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const Text(
                    'Forget Password?',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          labelText: 'Email',
                          prefixIcon: const Icon(Icons.email),
                          validatorText: 'Please enter your email',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomMaterialButton(
                          color: kPrimaryColor,
                          text: "Reset Password",
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              //TODO something
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
