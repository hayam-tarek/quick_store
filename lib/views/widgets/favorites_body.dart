import 'package:e_commerce_app/core/utils/listener_to_favorite.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:e_commerce_app/views/widgets/simple_product_card.dart';
import 'package:e_commerce_app/views/widgets/title_with_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        listenerToFavorite(context, state);
      },
      builder: (context, state) {
        FavoriteCubit cubit = BlocProvider.of<FavoriteCubit>(context);
        List<ProductModel> products = cubit.favorites;
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: TitleWithButton(
                title: 'Favorites',
                buttonTitle: '${cubit.favorites.length} product',
              ),
            ),
            // if (state is GetFavoriteLoading)
            //   const SliverFillRemaining(
            //     child: Center(
            //       child: CupertinoActivityIndicator(
            //         color: kSecondaryColor,
            //       ),
            //     ),
            //   )
            // else
            if (state is GetFavoriteFailure || products.isEmpty)
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
        );
      },
    );
  }
}
