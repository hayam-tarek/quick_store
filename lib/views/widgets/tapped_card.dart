import 'package:flutter/material.dart';
import 'package:quick_store/core/utils/constant.dart';

class TappedCard extends StatelessWidget {
  const TappedCard({
    super.key,
    required this.title,
    required this.iconData,
    this.onTap,
  });
  final String title;
  final IconData iconData;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          iconData,
          color: kPrimaryColor,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
