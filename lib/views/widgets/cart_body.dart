import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/utils/listener_to_cart.dart';
import 'package:quick_store/models/cart_model.dart';
import 'package:quick_store/view_models/cart_cubit/cart_cubit.dart';
import 'package:quick_store/views/widgets/check_out_sheet.dart';
import 'package:quick_store/views/widgets/quantity_control.dart';
import 'package:quick_store/views/widgets/simple_product_card.dart';
import 'package:quick_store/views/widgets/title_text.dart';

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
        CartCubit cubit = BlocProvider.of<CartCubit>(context);
        List<CartModel> cartItems = cubit.cart;
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
                    const SliverFillRemaining(
                      child: Center(
                        child: Text(
                          "No Products",
                        ),
                      ),
                    )
                  else
                    SliverList.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: SimpleProductCard(
                                  showShoppingCart: true,
                                  showFavorite: true,
                                  productModel: cartItems[index].productModel,
                                ),
                              ),
                              QuantityControl(cartModel: cartItems[index]),
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
  }
}
