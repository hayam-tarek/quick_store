import 'package:flutter/material.dart';

class AlertDialogIcon extends StatelessWidget {
  const AlertDialogIcon({
    super.key,
    required this.iconData,
    required this.iconColor,
  });
  final IconData iconData;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: iconColor.withOpacity(.2),
      child: Icon(
        iconData,
        size: 60,
        color: iconColor,
      ),
    );
  }
}
