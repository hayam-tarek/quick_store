import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/views/screens/login_screen.dart';
import 'package:e_commerce_app/views/screens/register_screen.dart';
import 'package:e_commerce_app/views/widgets/custom_material_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 4,
              child: Image.asset(
                fit: BoxFit.contain,
                kLogoPath,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome to our ',
                  style: TextStyle(
                    fontSize: 25,
                    color: kPrimaryColor,
                  ),
                ),
                Text(
                  'store!',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: kSecondaryColor,
                    fontFamily: kPrimaryFont,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            CustomMaterialButton(
              color: kPrimaryColor,
              text: 'LOGIN',
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomMaterialButton(
              color: kPrimaryColor,
              text: 'REGISTER',
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return const RegisterScreen();
                  },
                ));
              },
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
