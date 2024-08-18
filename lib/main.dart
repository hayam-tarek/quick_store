import 'package:e_commerce_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/helper/constant.dart';
import 'package:e_commerce_app/modules/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: kMainFont),
        title: 'E Commerce App',
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
