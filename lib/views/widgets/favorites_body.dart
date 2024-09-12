import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:e_commerce_app/views/widgets/simple_product_card.dart';
import 'package:flutter/cupertino.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({
    super.key,
    required this.products,
    required this.favoriteState,
  });

  final List<ProductModel> products;
  final FavoriteState favoriteState;

  @override
  Widget build(BuildContext context) {
    if (favoriteState is GetFavoriteLoading) {
      return const SliverFillRemaining(
        child: Center(
          child: CupertinoActivityIndicator(
            color: kSecondaryColor,
          ),
        ),
      );
    } else if (favoriteState is GetFavoriteFailure || products.isEmpty) {
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
              showShoppingCart: false,
              showFavorite: true,
              productModel: products[index],
            ),
          );
        },
      );
    }
  }
}
