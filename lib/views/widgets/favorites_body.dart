import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:e_commerce_app/views/widgets/product_card.dart';
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
    } else if (favoriteState is GetFavoriteFailure) {
      return const SliverFillRemaining(
        child: Center(
          child: Text(
            "No Products",
          ),
        ),
      );
    } else {
      return SliverGrid.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
              top: 50,
            ),
            child: ProductCard(
              inFavorites: true,
              productModel: products[index],
            ),
          );
        },
      );
    }
  }
}
