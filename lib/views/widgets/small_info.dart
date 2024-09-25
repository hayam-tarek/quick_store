import 'package:flutter/material.dart';
import 'package:quick_store/models/product_model.dart';

class SmallInfo extends StatelessWidget {
  const SmallInfo({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15).copyWith(
          topLeft: Radius.zero,
        ),
        color: Colors.green.withOpacity(.2),
      ),
      child: Text(
        '${productModel.discount}% off',
        style: const TextStyle(
          color: Colors.green,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
