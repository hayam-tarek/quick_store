import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/models/cart_model.dart';
import 'package:quick_store/view_models/cart_cubit/cart_cubit.dart';
import 'package:quick_store/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:quick_store/views/widgets/check_out_sheet.dart';
import 'package:quick_store/views/widgets/custom_snake_bar.dart';
import 'package:quick_store/views/widgets/quantity_control.dart';
import 'package:quick_store/views/widgets/simple_product_card.dart';
import 'package:quick_store/views/widgets/title_text.dart';

class CartBody extends StatelessWidget {
  const CartBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        if (state is AddOrDeleteFavoriteFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(customSnackBar(text: state.message));
        }
      },
      builder: (context, state) {
        return BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            // listenerToCart(context, state);
            if (state is AddOrDeleteFromCartFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(customSnackBar(text: state.message));
            }
            if (state is UpdateCartFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(customSnackBar(text: state.message));
            }
          },
          builder: (context, state) {
            CartCubit cubit = BlocProvider.of<CartCubit>(context);
            List<CartItemModel> cartItems = cubit.cart;
            return Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: TitleText(
                          text: 'Cart',
                          fontSize: 30,
                        ),
                      ),
                      // if (state is GetCartLoading)
                      //   const SliverFillRemaining(
                      //     child: Center(
                      //       child: CupertinoActivityIndicator(
                      //         color: kSecondaryColor,
                      //       ),
                      //     ),
                      //   )
                      // else
                      if (state is GetCartFailure || cartItems.isEmpty)
                        SliverFillRemaining(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                kEmptyCartPath,
                                scale: 2,
                              ),
                              Text(
                                "Your cart is empty",
                              ),
                            ],
                          ),
                        )
                      else
                        SliverList.builder(
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SimpleProductCard(
                                      showShoppingCart: true,
                                      showFavorite: true,
                                      productModel:
                                          cartItems[index].productModel,
                                    ),
                                  ),
                                  QuantityControl(
                                      cartItemModel: cartItems[index]),
                                ],
                              ),
                            );
                          },
                        )
                    ],
                  ),
                ),
                CheckOutSheet(totalPrice: cubit.total),
              ],
            );
          },
        );
      },
    );
  }
}
