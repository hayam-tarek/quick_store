import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:quick_store/core/services/local_storage.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/core/utils/simple_bloc_observer.dart';
import 'package:quick_store/view_models/auth_cubit/auth_cubit.dart';
import 'package:quick_store/view_models/cart_cubit/cart_cubit.dart';
import 'package:quick_store/view_models/categories_cubit/categories_cubit.dart';
import 'package:quick_store/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:quick_store/view_models/location_services_cubit/location_services_cubit.dart';
import 'package:quick_store/view_models/orders_cubit/orders_cubit.dart';
import 'package:quick_store/view_models/products_cubit/products_cubit.dart';
import 'package:quick_store/view_models/profile_cubit/profile_cubit.dart';
import 'package:quick_store/views/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await dotenv.load(fileName: ".env");
  kApiBaseUrl = dotenv.env['API_BASE_URL']!;
  await LocalData.cacheInitialization();
  kToken = LocalData().getFromCache(key: 'token');
  kLastAddressIdValue = LocalData().getFromCache(key: kLastAddressId);
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
        BlocProvider(
          create: (context) => LocationServicesCubit(),
        ),
        BlocProvider(
          create: (context) => OrdersCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: kSecondaryFont,
          scaffoldBackgroundColor: kBackgroundColor,
          primaryColor: kPrimaryColor,
          colorScheme: ColorScheme.fromSeed(
            seedColor: kSecondaryColor,
            primary: kPrimaryColor,
            secondary: kSecondaryColor,
            tertiary: kForegroundColor,
          ),
          // useMaterial3: false,
        ),
        title: 'E Commerce App',
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
