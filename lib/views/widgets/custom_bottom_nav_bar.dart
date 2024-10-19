import 'package:flutter/material.dart';
import 'package:quick_store/core/utils/constant.dart';

import 'custom_bottom_navigation_bar_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  final int currentIndex;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      selectedItemColor: kSecondaryColor,
      unselectedItemColor: kPrimaryColor,
      type: BottomNavigationBarType.fixed,
      backgroundColor: kBackgroundColor,
      onTap: onTap,
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
    );
  }
}
