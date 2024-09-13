import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/core/utils/listener_to_cart.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/view_models/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/views/widgets/simple_product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBody extends StatelessWidget {
  const CartBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        listenerToCart(context, state);
      },
      builder: (context, state) {
        List<ProductModel> products = BlocProvider.of<CartCubit>(context).cart;
        if (state is GetCartLoading) {
          return const SliverFillRemaining(
            child: Center(
              child: CupertinoActivityIndicator(
                color: kSecondaryColor,
              ),
            ),
          );
        } else if (state is GetCartFailure || products.isEmpty) {
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
                  showFavorite: true,
                  productModel: products[index],
                ),
              );
            },
          );
        }
      },
    );
  }
}
