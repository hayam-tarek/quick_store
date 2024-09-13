import 'package:e_commerce_app/core/utils/listener_to_favorite.dart';
import 'package:e_commerce_app/view_models/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:e_commerce_app/views/widgets/cart_body.dart';
import 'package:e_commerce_app/views/widgets/title_with_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    BlocProvider.of<CartCubit>(context).getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {
          listenerToFavorite(context, state);
        },
        builder: (context, state) {
          CartCubit cubit = BlocProvider.of<CartCubit>(context);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: TitleWithButton(
                    title: 'Cart',
                    buttonTitle: 'Total price \$${cubit.total}', //TODO
                  ),
                ),
                const CartBody(),
              ],
            ),
          );
        },
      ),
    );
  }
}
