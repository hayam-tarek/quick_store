import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/core/utils/listener_to_cart.dart';
import 'package:quick_store/core/utils/listener_to_favorite.dart';
import 'package:quick_store/models/product_model.dart';
import 'package:quick_store/view_models/cart_cubit/cart_cubit.dart';
import 'package:quick_store/view_models/categories_cubit/categories_cubit.dart';
import 'package:quick_store/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:quick_store/views/widgets/product_card.dart';

class CategoryProductsBody extends StatelessWidget {
  const CategoryProductsBody({
    super.key,
    required this.categoryProducts,
    required this.categoriesState,
  });
  final List<ProductModel> categoryProducts;
  final CategoriesState categoriesState;
  @override
  Widget build(BuildContext context) {
    if (categoriesState is GetCategoryProductsLoading) {
      return const Center(
        child: CupertinoActivityIndicator(
          color: kSecondaryColor,
        ),
      );
    } else if (categoriesState is GetCategoryProductsSuccess) {
      return BlocListener<FavoriteCubit, FavoriteState>(
        listener: (context, state) {
          listenerToFavorite(context, state);
        },
        child: BlocListener<CartCubit, CartState>(
          listener: (context, state) {
            listenerToCart(context, state);
          },
          child: GridView.builder(
            itemCount: categoryProducts.length,
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
                  productModel: categoryProducts[index],
                ),
              );
            },
          ),
        ),
      );
    } else {
      return const Center(
        child: Text(
          "No Products",
        ),
      );
    }
  }
}
