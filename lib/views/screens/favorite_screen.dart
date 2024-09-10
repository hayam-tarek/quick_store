import 'package:e_commerce_app/core/utils/listener_to_favorite.dart';
import 'package:e_commerce_app/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:e_commerce_app/views/widgets/favorites_body.dart';
import 'package:e_commerce_app/views/widgets/title_with_button.dart';
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
    BlocProvider.of<FavoriteCubit>(context).getFavorite();
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
          FavoriteCubit cubit = BlocProvider.of<FavoriteCubit>(context);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: TitleWithButton(
                    title: 'Favorites',
                    buttonTitle: '${cubit.favorites.length} product',
                  ),
                ),
                FavoritesBody(
                  products: cubit.favorites,
                  favoriteState: state,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
