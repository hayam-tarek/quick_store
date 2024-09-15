import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/core/utils/listener_to_favorite.dart';
import 'package:e_commerce_app/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:e_commerce_app/views/widgets/cart_body.dart';
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
    // BlocProvider.of<CartCubit>(context).getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {
          listenerToFavorite(context, state);
        },
        builder: (context, state) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CartBody(),
          );
        },
      ),
    );
  }
}
