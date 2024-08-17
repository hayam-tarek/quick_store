import 'package:flutter/material.dart';

class CustomRoundedContainer extends StatelessWidget {
  const CustomRoundedContainer({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.85),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          )),
      width: double.infinity,
      child: child,
    );
  }
}
