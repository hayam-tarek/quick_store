import 'package:flutter/material.dart';
import 'package:quick_store/core/utils/constant.dart';

class CustomDecorationContainer extends StatelessWidget {
  const CustomDecorationContainer({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kForegroundColor.withOpacity(.8),
        // border: Border.all(color: kPrimaryColor),
      ),
      child: child,
    );
  }
}
