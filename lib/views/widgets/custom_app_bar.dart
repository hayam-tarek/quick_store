import 'package:flutter/material.dart';
import 'package:quick_store/core/utils/constant.dart';

AppBar customAppBar() {
  return AppBar(
    centerTitle: true,
    backgroundColor: kBackgroundColor,
    title: IntrinsicWidth(
      child: const Row(
        children: [
          Text(
            'Quick',
            style: TextStyle(
              fontFamily: kPrimaryFont,
              fontSize: 35,
              color: kPrimaryColor,
            ),
          ),
          Text(
            'Store',
            style: TextStyle(
              fontFamily: kPrimaryFont,
              fontSize: 35,
              color: kSecondaryColor,
            ),
          ),
        ],
      ),
    ),
    actions: [
      Builder(builder: (context) {
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
          icon: Image.asset(
            kMenuIconPath,
            scale: 17.5,
          ),
        );
      }),
    ],
  );
}
