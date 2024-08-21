import 'dart:developer';

import 'package:e_commerce_app/helper/constant.dart';
import 'package:e_commerce_app/modules/screens/cart_screen.dart';
import 'package:e_commerce_app/modules/screens/categories_screen.dart';
import 'package:e_commerce_app/modules/screens/favorite_screen.dart';
import 'package:e_commerce_app/modules/screens/home_screen.dart';
import 'package:e_commerce_app/modules/screens/profile_screen.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kPrimaryColor,
        showUnselectedLabels: true,
        selectedItemColor: kSecondaryColor,
        unselectedItemColor: kPrimaryColor,
        type: BottomNavigationBarType.shifting,
        onTap: (value) {
          log('$value');
          setState(() {
            currentIndex = value;
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
