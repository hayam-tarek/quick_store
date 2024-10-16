import 'package:flutter/material.dart';
import 'package:quick_store/views/widgets/favorites_body.dart';

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
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: FavoritesBody(),
      ),
    );
  }
}
