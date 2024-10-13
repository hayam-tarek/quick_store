import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/models/product_model.dart';
import 'package:quick_store/view_models/cart_cubit/cart_cubit.dart';
import 'package:quick_store/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:quick_store/views/widgets/custom_snake_bar.dart';
import 'package:quick_store/views/widgets/simple_product_card.dart';
import 'package:quick_store/views/widgets/title_text.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is AddOrDeleteFromCartFailure) {
          ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
              text: state.message, backgroundColor: Colors.red[600]!));
        }
      },
      builder: (context, state) {
        return BlocConsumer<FavoriteCubit, FavoriteState>(
          listener: (context, state) {
            //listenerToFavorite(context, state);
            if (state is AddOrDeleteFavoriteFailure) {
              ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
                  text: state.message, backgroundColor: Colors.red[600]!));
            }
          },
          builder: (context, state) {
            FavoriteCubit cubit = BlocProvider.of<FavoriteCubit>(context);
            List<ProductModel> products = cubit.favorites;
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: TitleText(
                    text: 'Favorite',
                    fontSize: 30,
                  ),
                ),
                if (state is GetFavoriteLoading)
                  SliverToBoxAdapter(
                    child: LinearProgressIndicator(
                      color: kSecondaryColor,
                      backgroundColor: kSecondaryColor.withOpacity(.5),
                    ),
                  ),
                if (state is GetFavoriteFailure || products.isEmpty)
                  SliverFillRemaining(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          kWishlistPath,
                          scale: 5,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "No Favorites Yet",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
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
      },
    );
  }
}
