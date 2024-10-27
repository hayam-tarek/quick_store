import 'package:flutter/material.dart';
import 'package:quick_store/models/product_model.dart';

class ShowPrice extends StatelessWidget {
  const ShowPrice({
    super.key,
    required this.productModel,
    required this.fontSize,
  });

  final ProductModel productModel;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          '\$${productModel.price} ',
          style: TextStyle(
            color: productModel.oldPrice != productModel.price
                ? Colors.red
                : Colors.black,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (productModel.oldPrice != productModel.price)
          Text(
            '\$${productModel.oldPrice}',
            style: TextStyle(
              color: Colors.grey,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough,
            ),
          ),
      ],
    );
  }
}
