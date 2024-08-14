import 'package:e_commerce_app/modules/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'E Commerce App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
