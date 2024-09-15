import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/core/utils/listener_to_cart.dart';
import 'package:e_commerce_app/view_models/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/views/widgets/favorites_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    // BlocProvider.of<FavoriteCubit>(context).getFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          listenerToCart(context, state);
        },
        builder: (context, state) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: FavoritesBody(),
          );
        },
      ),
    );
  }
}
