import 'package:flutter/material.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/models/cart_model.dart';

class QuantityControl extends StatelessWidget {
  const QuantityControl({
    super.key,
    required this.cartItemModel,
  });

  final CartItemModel cartItemModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: kSecondaryColor.withOpacity(.2),
          foregroundColor: kSecondaryColor,
          radius: 15,
          child: IconButton(
            onPressed: () {
              //TODO
            },
            icon: Icon(
              Icons.add,
              size: 15,
            ),
          ),
        ),
        Text(
          'x${cartItemModel.quantity}',
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        CircleAvatar(
          backgroundColor: kSecondaryColor.withOpacity(.2),
          foregroundColor: kSecondaryColor,
          radius: 15,
          child: IconButton(
            onPressed: () {
              //TODO
            },
            icon: Icon(
              Icons.remove,
              size: 15,
            ),
          ),
        ),
      ],
    );
  }
}
