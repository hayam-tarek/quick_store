import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:quick_store/views/widgets/custom_snake_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  }
  if (favoriteState is AddOrDeleteFavoriteFailure) {
    if (!isLoading) {
      Navigator.pop(context);
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(customSnackBar(text: favoriteState.message));
  }
}
