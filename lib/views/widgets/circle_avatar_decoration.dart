import 'package:flutter/material.dart';
import 'package:quick_store/core/utils/constant.dart';

class CircleAvatarDecoration extends StatelessWidget {
  const CircleAvatarDecoration({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // border: Border.all(
        //   color: kForegroundColor,
        // ),
        boxShadow: [
          BoxShadow(
            color: kSecondaryColor.withOpacity(.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(5, 5),
          ),
          BoxShadow(
            color: kPrimaryColor.withOpacity(.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(-5, -5),
          ),
        ],
      ),
      child: child,
    );
  }
}
