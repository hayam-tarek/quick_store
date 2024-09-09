import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:flutter/material.dart';

BottomNavigationBarItem customBottomNavigationBarItem({
  required Widget icon,
  required Widget? activeIcon,
  required String? label,
}) {
  return BottomNavigationBarItem(
    icon: icon,
    activeIcon: Container(
        width: 60,
        decoration: BoxDecoration(
          color: kSecondaryColor.withOpacity(.2),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 3,
          horizontal: 10,
        ),
        child: activeIcon),
    label: label,
  );
}
