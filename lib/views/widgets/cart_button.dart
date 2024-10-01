import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/models/product_model.dart';
import 'package:quick_store/view_models/cart_cubit/cart_cubit.dart';

class CartButton extends StatefulWidget {
  const CartButton({
    super.key,
    required this.context,
    required this.productModel,
  });

  final BuildContext context;
  final ProductModel productModel;

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  @override
  Widget build(BuildContext context) {
    Set<num> cartItemsID = BlocProvider.of<CartCubit>(context).cartItemsID;

    return IconButton(
      onPressed: () async {
        await BlocProvider.of<CartCubit>(context)
            .addOrDeleteFromCart(productId: widget.productModel.id.toInt());
        if (context.mounted) {
          BlocProvider.of<CartCubit>(context).getCart();
        }
        setState(() {});
      },
      icon: (cartItemsID.contains(widget.productModel.id))
          ? const Icon(
              Icons.remove_shopping_cart_outlined,
              color: Colors.orange,
            )
          : const Icon(
              Icons.add_shopping_cart,
              color: Colors.green,
            ),
    );
  }
}
