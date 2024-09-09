import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/view_models/categories_cubit/categories_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  @override
  Widget build(BuildContext context) {
    CategoriesCubit categoriesCubit = BlocProvider.of<CategoriesCubit>(context);
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is GetCategoriesLoading) {
          return const Center(
            child: CupertinoActivityIndicator(
              color: kSecondaryColor,
            ),
          );
        } else if (state is GetCategoriesFailure) {
          return const Center(
            child: Text(
              'No categories found.',
            ),
          );
        } else {
          return ListView.builder(
            padding: const EdgeInsets.all(.8),
            scrollDirection: Axis.horizontal,
            itemCount: categoriesCubit.categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      categoriesCubit.categories[index].image,
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
