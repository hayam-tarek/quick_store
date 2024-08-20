import 'package:e_commerce_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/helper/constant.dart';
import 'package:e_commerce_app/modules/screens/home_screen.dart';
import 'package:e_commerce_app/modules/screens/login_screen.dart';
import 'package:e_commerce_app/modules/widgets/custom_material_button.dart';
import 'package:e_commerce_app/modules/widgets/custom_password_text_form_field.dart';
import 'package:e_commerce_app/modules/widgets/custom_rounded_container.dart';
import 'package:e_commerce_app/modules/widgets/custom_snake_bar.dart';
import 'package:e_commerce_app/modules/widgets/custom_text_florm_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_background - editing.jpg'),
            fit: BoxFit.cover,
            opacity: .7,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: AlignmentDirectional.bottomCenter,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 2,
              child: CustomRoundedContainer(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    const SizedBox(height: 50),
                    const Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                          fontFamily: kPrimaryFont,
                        ),
                      ),
                    ),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is RegisterSuccessState) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const HomeScreen();
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            customSnackBar(
                                text: 'Hello ${nameController.text}'),
                          );
                        }
                        if (state is RegisterFailureState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            customSnackBar(text: state.error),
                          );
                        }
                      },
                      builder: (context, state) {
                        return AbsorbPointer(
                          absorbing: state is RegisterLoadingState,
                          child: Form(
                            key: formKey,
                            autovalidateMode: autovalidateMode,
                            child: Column(
                              children: [
                                const SizedBox(height: 50),
                                CustomTextFormField(
                                  keyboardType: TextInputType.name,
                                  labelText: 'User Name',
                                  controller: nameController,
                                  validatorText: 'Please enter your name',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomTextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  labelText: 'Email',
                                  controller: emailController,
                                  validatorText: 'Please enter your email',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomTextFormField(
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
                                  text: state is RegisterLoadingState
                                      ? 'Loading...'
                                      : 'Register',
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();
                                      BlocProvider.of<AuthCubit>(context)
                                          .register(
                                        name: nameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        phone: phoneController.text,
                                      );
                                    } else {
                                      setState(() {
                                        autovalidateMode =
                                            AutovalidateMode.always;
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const LoginScreen();
                              },
                            ));
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: kSecondaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
