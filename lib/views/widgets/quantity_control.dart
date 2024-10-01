import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/models/cart_model.dart';
import 'package:quick_store/view_models/cart_cubit/cart_cubit.dart';

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
            onPressed: () async {
              await BlocProvider.of<CartCubit>(context).updateCart(
                  cartId: cartItemModel.id, quantity: ++cartItemModel.quantity);
              if (context.mounted) {
                BlocProvider.of<CartCubit>(context).getCart();
              }
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
            onPressed: () async {
              if (cartItemModel.quantity == 1) return;
              await BlocProvider.of<CartCubit>(context).updateCart(
                  cartId: cartItemModel.id, quantity: --cartItemModel.quantity);
              if (context.mounted) {
                BlocProvider.of<CartCubit>(context).getCart();
              }
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
