import 'package:flutter/material.dart';

class InvoiceItem extends StatelessWidget {
  const InvoiceItem({
    super.key,
    required this.titleText,
    required this.trailingText,
  });

  final String titleText;
  final String trailingText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleText,
            style: TextStyle(
              fontSize: 17,
              color: Colors.grey,
            ),
          ),
          Text(
            trailingText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.grey[800],
            ),
          )
        ],
      ),
    );
  }
}
