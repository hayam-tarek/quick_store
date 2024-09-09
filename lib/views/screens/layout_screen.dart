import 'dart:developer';

import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/view_models/categories/categories_cubit.dart';
import 'package:e_commerce_app/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:e_commerce_app/view_models/products_cubit/products_cubit.dart';
import 'package:e_commerce_app/views/screens/cart_screen.dart';
import 'package:e_commerce_app/views/screens/categories_screen.dart';
import 'package:e_commerce_app/views/screens/favorite_screen.dart';
import 'package:e_commerce_app/views/screens/home_screen.dart';
import 'package:e_commerce_app/views/screens/profile_screen.dart';
import 'package:e_commerce_app/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const FavoriteScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  PageController pageController = PageController();
  @override
  void initState() {
    BlocProvider.of<ProductsCubit>(context).getProducts();
    BlocProvider.of<CategoriesCubit>(context).getCategories();
    BlocProvider.of<FavoriteCubit>(context).getFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: kSecondaryColor,
        unselectedItemColor: kPrimaryColor,
        type: BottomNavigationBarType.shifting,
        onTap: (value) {
          log('$value');
          setState(() {
            currentIndex = value;
            pageController.jumpToPage(value);
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      // body: screens[currentIndex],
      body: PageView(
        // physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) {
          log('page index $index');
          setState(() {
            currentIndex = index;
            pageController.jumpToPage(index);
          });
        },
        children: screens,
      ),
    );
  }
}
