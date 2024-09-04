import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/view_models/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/views/widgets/custom_material_button.dart';
import 'package:e_commerce_app/views/widgets/custom_password_text_form_field.dart';
import 'package:e_commerce_app/views/widgets/custom_text_florm_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterSheetBody extends StatefulWidget {
  const RegisterSheetBody({super.key, required this.state});

  final AuthState state;

  @override
  State<RegisterSheetBody> createState() => _RegisterSheetBodyState();
}

class _RegisterSheetBodyState extends State<RegisterSheetBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.state is RegisterLoadingState,
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const SizedBox(height: 50),
            CustomTextFormField(
              prefixIcon: const Icon(Icons.person),
              keyboardType: TextInputType.name,
              labelText: 'User Name',
              controller: nameController,
              validatorText: 'Please enter your name',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              prefixIcon: const Icon(Icons.email),
              keyboardType: TextInputType.emailAddress,
              labelText: 'Email',
              controller: emailController,
              validatorText: 'Please enter your email',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              prefixIcon: const Icon(Icons.phone),
              keyboardType: TextInputType.phone,
              labelText: 'Phone',
              controller: phoneController,
              validatorText: 'Please enter your phone',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomPasswordTextFormField(
              passwordController: passwordController,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomMaterialButton(
              color: kPrimaryColor,
              text: widget.state is RegisterLoadingState
                  ? 'Loading...'
                  : 'Register',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  BlocProvider.of<AuthCubit>(context).register(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                    phone: phoneController.text,
                  );
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
