import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/view_models/auth_cubit/auth_cubit.dart';
import 'package:quick_store/views/screens/layout_screen.dart';
import 'package:quick_store/views/screens/login_screen.dart';
import 'package:quick_store/views/widgets/custom_rounded_container.dart';
import 'package:quick_store/views/widgets/custom_snake_bar.dart';
import 'package:quick_store/views/widgets/helper_text.dart';
import 'package:quick_store/views/widgets/register_sheet_body.dart';
import 'package:quick_store/views/widgets/title_text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                    const SizedBox(height: 35),
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
                            customSnackBar(
                                text: state.message,
                                backgroundColor: Colors.green),
                          );
                        }
                        if (state is RegisterFailureState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            customSnackBar(
                                text: state.error,
                                backgroundColor: Colors.red[600]!),
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
