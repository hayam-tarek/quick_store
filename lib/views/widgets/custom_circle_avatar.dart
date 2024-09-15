import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    required this.networkImageUrl,
  });

  final String networkImageUrl;

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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
            networkImageUrl,
          ),
        ),
      ),
    );
  }
}
