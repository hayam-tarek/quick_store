import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/view_models/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/views/screens/layout_screen.dart';
import 'package:e_commerce_app/views/screens/login_screen.dart';
import 'package:e_commerce_app/views/widgets/custom_rounded_container.dart';
import 'package:e_commerce_app/views/widgets/custom_snake_bar.dart';
import 'package:e_commerce_app/views/widgets/helper_text.dart';
import 'package:e_commerce_app/views/widgets/register_sheet_body.dart';
import 'package:e_commerce_app/views/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(kBackgroundPath),
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
                        child: TitleText(
                      text: 'Register',
                    )),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is RegisterSuccessState) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const LayoutScreen();
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            customSnackBar(text: 'Hello...'),
                          );
                        }
                        if (state is RegisterFailureState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            customSnackBar(text: state.error),
                          );
                        }
                      },
                      builder: (context, state) {
                        return RegisterSheetBody(
                          state: state,
                        );
                      },
                    ),
                    HelperText(
                      firstText: 'Already have an account?',
                      secondText: 'Login',
                      onSecondTextPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return const LoginScreen();
                          },
                        ));
                      },
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
