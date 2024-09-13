import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    this.child,
  });
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7.5,
      color: Colors.white,
      shadowColor: Colors.grey,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
      child: child,
    );
  }
}
