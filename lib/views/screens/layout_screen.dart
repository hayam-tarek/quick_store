import 'dart:developer';

import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/view_models/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/view_models/categories_cubit/categories_cubit.dart';
import 'package:e_commerce_app/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:e_commerce_app/view_models/products_cubit/products_cubit.dart';
import 'package:e_commerce_app/view_models/profile_cubit/profile_cubit.dart';
import 'package:e_commerce_app/views/screens/cart_screen.dart';
import 'package:e_commerce_app/views/screens/categories_screen.dart';
import 'package:e_commerce_app/views/screens/favorite_screen.dart';
import 'package:e_commerce_app/views/screens/home_screen.dart';
import 'package:e_commerce_app/views/screens/profile_screen.dart';
import 'package:e_commerce_app/views/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/views/widgets/custom_bottom_navigation_bar_item.dart';
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
    BlocProvider.of<CartCubit>(context).getCart();
    BlocProvider.of<ProductsCubit>(context).getProducts();
    BlocProvider.of<CategoriesCubit>(context).getCategories();
    BlocProvider.of<FavoriteCubit>(context).getFavorite();
    BlocProvider.of<ProfileCubit>(context).getProfile();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            selectedItemColor: kSecondaryColor,
            unselectedItemColor: kPrimaryColor,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            onTap: (value) {
              log('$value');
              setState(() {
                currentIndex = value;
                pageController.jumpToPage(value);
              });
            },
            currentIndex: currentIndex,
            items: [
              customBottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined),
                activeIcon: const Icon(Icons.home),
                label: 'Home',
              ),
              customBottomNavigationBarItem(
                icon: const Icon(Icons.category_outlined),
                activeIcon: const Icon(Icons.category),
                label: 'Categories',
              ),
              customBottomNavigationBarItem(
                icon: const Icon(Icons.favorite_border),
                activeIcon: const Icon(Icons.favorite),
                label: 'Favorite',
              ),
              customBottomNavigationBarItem(
                icon: const Icon(Icons.shopping_bag_outlined),
                activeIcon: const Icon(Icons.shopping_bag),
                label: 'My Cart',
              ),
              customBottomNavigationBarItem(
                icon: const Icon(Icons.person_outlined),
                activeIcon: const Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
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
