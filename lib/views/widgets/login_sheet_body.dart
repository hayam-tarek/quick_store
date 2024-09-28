import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/view_models/auth_cubit/auth_cubit.dart';
import 'package:quick_store/views/screens/forget_password_screen.dart';
import 'package:quick_store/views/widgets/custom_material_button.dart';
import 'package:quick_store/views/widgets/custom_password_text_form_field.dart';
import 'package:quick_store/views/widgets/custom_text_florm_field.dart';

class LoginSheetBody extends StatefulWidget {
  const LoginSheetBody({super.key, required this.state});

  final AuthState state;

  @override
  State<LoginSheetBody> createState() => _LoginSheetBodyState();
}

class _LoginSheetBodyState extends State<LoginSheetBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.state is LoginLoadingState,
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const SizedBox(height: 50),
            CustomTextFormField(
              prefixIcon: const Icon(Icons.email),
              keyboardType: TextInputType.emailAddress,
              labelText: 'Email',
              controller: emailController,
              validatorText: 'Please enter your email',
            ),
            const SizedBox(height: 10),
            CustomPasswordTextFormField(
              passwordController: passwordController,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ForgetPasswordScreen();
                    },
                  ));
                },
                child: Text(
                  'Forget Password?',
                  style: TextStyle(color: kSecondaryColor.withOpacity(.5)),
                ),
              ),
            ),
            CustomMaterialButton(
              color: kPrimaryColor,
              text: widget.state is LoginLoadingState ? 'Loading...' : 'Login',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  BlocProvider.of<AuthCubit>(context).login(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
