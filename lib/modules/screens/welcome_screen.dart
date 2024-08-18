import 'package:e_commerce_app/helper/constant.dart';
import 'package:e_commerce_app/modules/screens/login_screen.dart';
import 'package:e_commerce_app/modules/screens/register_screen.dart';
import 'package:e_commerce_app/modules/widgets/custom_material_button.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Image.asset(
                fit: BoxFit.cover,
                kLogoURL,
                height: 300,
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
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
                Text(
                  'store!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: kSecondaryColor,
                    fontFamily: kTitleFont,
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
                Navigator.push(context, MaterialPageRoute(
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
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const RegisterScreen();
                  },
                ));
              },
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Developed by Hayam Tarek',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
