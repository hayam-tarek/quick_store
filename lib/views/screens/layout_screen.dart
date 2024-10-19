import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/view_models/cart_cubit/cart_cubit.dart';
import 'package:quick_store/view_models/categories_cubit/categories_cubit.dart';
import 'package:quick_store/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:quick_store/view_models/products_cubit/products_cubit.dart';
import 'package:quick_store/view_models/profile_cubit/profile_cubit.dart';
import 'package:quick_store/views/screens/cart_screen.dart';
import 'package:quick_store/views/screens/categories_screen.dart';
import 'package:quick_store/views/screens/favorite_screen.dart';
import 'package:quick_store/views/screens/home_screen.dart';
import 'package:quick_store/views/screens/profile_screen.dart';
import 'package:quick_store/views/widgets/custom_app_bar.dart';

import '../widgets/custom_bottom_nav_bar.dart';

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
      appBar: customAppBar(),
      endDrawer: Drawer(),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pageController.jumpToPage(index);
          });
        },
      ),
      // body: screens[currentIndex],
      body: PageView(
        // physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) {
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
