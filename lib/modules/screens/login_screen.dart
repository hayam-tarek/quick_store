import 'package:e_commerce_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/helper/constant.dart';
import 'package:e_commerce_app/modules/screens/forget_password_screen.dart';
import 'package:e_commerce_app/modules/screens/home_screen.dart';
import 'package:e_commerce_app/modules/widgets/custom_rounded_container.dart';
import 'package:e_commerce_app/modules/widgets/custom_snake_bar.dart';
import 'package:e_commerce_app/modules/widgets/helper_text.dart';
import 'package:e_commerce_app/modules/widgets/login_sheet_body.dart';
import 'package:e_commerce_app/modules/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        text: 'Login',
                      ),
                    ),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is LoginSuccessState) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const HomeScreen();
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            customSnackBar(text: 'Welcome dear ...'),
                          );
                        }
                        if (state is LoginFailureState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            customSnackBar(text: state.error),
                          );
                        }
                      },
                      builder: (context, state) {
                        return LoginSheetBody(
                          state: state,
                        );
                      },
                    ),
                    HelperText(
                      firstText: 'Forger your password?',
                      secondText: 'Click here',
                      onSecondTextPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const ForgetPasswordScreen();
                          },
                        ));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
