import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/core/utils/listener_to_cart.dart';
import 'package:quick_store/core/utils/listener_to_favorite.dart';
import 'package:quick_store/models/product_model.dart';
import 'package:quick_store/view_models/cart_cubit/cart_cubit.dart';
import 'package:quick_store/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:quick_store/view_models/products_cubit/products_cubit.dart';
import 'package:quick_store/views/widgets/product_card.dart';

class ProductsBody extends StatelessWidget {
  const ProductsBody({
    super.key,
    required this.products,
    required this.productsState,
  });

  final List<ProductModel> products;
  final ProductsState productsState;

  @override
  Widget build(BuildContext context) {
    if (productsState is GetProductsLoading) {
      return const SliverFillRemaining(
        child: Center(
          child: CupertinoActivityIndicator(
            color: kSecondaryColor,
          ),
        ),
      );
    } else if (productsState is GetProductsSuccess) {
      return BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {
          listenerToFavorite(context, state);
        },
        builder: (context, state) {
          return BlocConsumer<CartCubit, CartState>(
            listener: (context, state) {
              listenerToCart(context, state);
            },
            builder: (context, state) {
              return SliverGrid.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  childAspectRatio: .9,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                      top: 50,
                    ),
                    child: ProductCard(
                      productModel: products[index],
                    ),
                  );
                },
              );
            },
          );
        },
      );
    } else {
      return const SliverFillRemaining(
        child: Center(
          child: Text(
            "No Products",
          ),
        ),
      );
    }
  }
}
