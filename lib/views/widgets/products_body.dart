import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/core/utils/listener_to_cart.dart';
import 'package:e_commerce_app/core/utils/listener_to_favorite.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/view_models/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:e_commerce_app/view_models/products_cubit/products_cubit.dart';
import 'package:e_commerce_app/views/widgets/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      return BlocListener<FavoriteCubit, FavoriteState>(
        listener: (context, state) {
          listenerToFavorite(context, state);
        },
        child: BlocListener<CartCubit, CartState>(
          listener: (context, state) {
            listenerToCart(context, state);
          },
          child: SliverGrid.builder(
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
          ),
        ),
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
