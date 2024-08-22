import 'package:e_commerce_app/cubits/layout_cubit/layout_cubit.dart';
import 'package:e_commerce_app/helper/constant.dart';
import 'package:e_commerce_app/models/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
    required this.categories,
    required this.state,
  });

  final List<CategoryModel> categories;
  final LayoutState state;

  @override
  Widget build(BuildContext context) {
    if (state is GetCategoriesLoading) {
      return const Center(
        child: CupertinoActivityIndicator(
          color: kSecondaryColor,
        ),
      );
    } else if (state is GetCategoriesSuccess) {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                categories[index].image,
              ),
            ),
          );
        },
      );
    } else {
      return const Center(
        child: Text(
          'No categories found.',
        ),
      );
    }
  }
}
