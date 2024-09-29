import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/utils/listener_to_cart.dart';
import 'package:quick_store/models/product_model.dart';
import 'package:quick_store/view_models/cart_cubit/cart_cubit.dart';
import 'package:quick_store/views/widgets/check_out_sheet.dart';
import 'package:quick_store/views/widgets/simple_product_card.dart';
import 'package:quick_store/views/widgets/title_with_button.dart';

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
        List<ProductModel> products = cubit.cart;
        return Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: TitleWithButton(
                      title: 'Cart',
                      buttonTitle: 'Total price \$${cubit.total}',
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
                  if (state is GetCartFailure || products.isEmpty)
                    const SliverFillRemaining(
                      child: Center(
                        child: Text(
                          "No Products",
                        ),
                      ),
                    )
                  else
                    SliverList.builder(
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
