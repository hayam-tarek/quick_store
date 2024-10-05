import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/models/product_model.dart';
import 'package:quick_store/view_models/favorite_cubit/favorite_cubit.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    super.key,
    required this.context,
    required this.productModel,
  });

  final BuildContext context;
  final ProductModel productModel;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    Set<num> favoritesID = BlocProvider.of<FavoriteCubit>(context).favoritesID;
    return IconButton(
      onPressed: () async {
        await BlocProvider.of<FavoriteCubit>(context)
            .addOrDeleteFavorite(productId: widget.productModel.id.toInt());
        if (context.mounted) {
          BlocProvider.of<FavoriteCubit>(context).getFavorite();
        }
        setState(() {});
      },
      icon: (favoritesID.contains(widget.productModel.id))
          ? const Icon(
              Icons.favorite_rounded,
              color: Colors.red,
            )
          : const Icon(
              Icons.favorite_border_rounded,
              color: Colors.grey,
            ),
    );
  }
}
