import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/views/screens/layout_screen.dart';
import 'package:e_commerce_app/views/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              kToken != null ? const LayoutScreen() : const WelcomeScreen(),
        ),
      );
    });
    super.initState();
  }

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
              flex: 3,
              child: Center(
                child: Image.asset(
                  kLogoPath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Spacer(
              flex: 2,
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
