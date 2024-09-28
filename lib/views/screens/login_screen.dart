import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/view_models/auth_cubit/auth_cubit.dart';
import 'package:quick_store/views/screens/layout_screen.dart';
import 'package:quick_store/views/screens/register_screen.dart';
import 'package:quick_store/views/widgets/custom_rounded_container.dart';
import 'package:quick_store/views/widgets/custom_snake_bar.dart';
import 'package:quick_store/views/widgets/helper_text.dart';
import 'package:quick_store/views/widgets/login_sheet_body.dart';
import 'package:quick_store/views/widgets/title_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    const SizedBox(height: 35),
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
                                return const LayoutScreen();
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            customSnackBar(text: state.message),
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
                      firstText: 'Don\'t have an account?',
                      secondText: 'Register',
                      onSecondTextPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return const RegisterScreen();
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
