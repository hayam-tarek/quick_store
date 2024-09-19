import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/services/local_storage.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/core/utils/simple_bloc_observer.dart';
import 'package:quick_store/view_models/auth_cubit/auth_cubit.dart';
import 'package:quick_store/view_models/cart_cubit/cart_cubit.dart';
import 'package:quick_store/view_models/categories_cubit/categories_cubit.dart';
import 'package:quick_store/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:quick_store/view_models/products_cubit/products_cubit.dart';
import 'package:quick_store/view_models/profile_cubit/profile_cubit.dart';
import 'package:quick_store/views/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await LocalData.cacheInitialization();
  kToken = LocalData().getFromCache(key: 'token');
  log('$kToken');
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
        BlocProvider(
          create: (context) => ProductsCubit(),
        ),
        BlocProvider(
          create: (context) => CategoriesCubit(),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            // fontFamily: kSecondaryFont,
            ),
        title: 'E Commerce App',
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
