import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/view_models/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/views/widgets/simple_product_card.dart';
import 'package:flutter/cupertino.dart';

class CartBody extends StatelessWidget {
  const CartBody({
    super.key,
    required this.products,
    required this.cartState,
  });

  final List<ProductModel> products;
  final CartState cartState;

  @override
  Widget build(BuildContext context) {
    if (cartState is GetCartLoading) {
      return const SliverFillRemaining(
        child: Center(
          child: CupertinoActivityIndicator(
            color: kSecondaryColor,
          ),
        ),
      );
    } else if (cartState is GetCartFailure) {
      return const SliverFillRemaining(
        child: Center(
          child: Text(
            "No Products",
          ),
        ),
      );
    } else {
      return SliverList.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SimpleProductCard(
              showShoppingCart: true,
              showFavorite: false,
              productModel: products[index],
            ),
          );
        },
      );
    }
  }
}
