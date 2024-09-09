import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:e_commerce_app/views/widgets/custom_snake_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void listenerToFavorite(BuildContext context, FavoriteState favoriteState) {
  bool isLoading = false;
  if (favoriteState is AddOrDeleteFavoriteLoading) {
    isLoading = true;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const CupertinoActivityIndicator(
          color: kSecondaryColor,
        );
      },
    ).then((_) {
      isLoading = false;
    });
  }
  if (favoriteState is AddOrDeleteFavoriteSuccess) {
    if (!isLoading) {
      Navigator.pop(context);
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(customSnackBar(text: favoriteState.message));
    BlocProvider.of<FavoriteCubit>(context).getFavorite();
  }
  if (favoriteState is AddOrDeleteFavoriteFailure) {
    if (!isLoading) {
      Navigator.pop(context);
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(customSnackBar(text: favoriteState.message));
  }
}
