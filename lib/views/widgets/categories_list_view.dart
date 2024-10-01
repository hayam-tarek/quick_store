import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/models/category_model.dart';
import 'package:quick_store/view_models/categories_cubit/categories_cubit.dart';

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
          List<CategoryModel> categories =
              BlocProvider.of<CategoriesCubit>(context).categories;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    categories[index].name,
                    style: const TextStyle(
                      color: kSecondaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // child: CircleAvatar(
                //   radius: 40,
                //   backgroundImage: NetworkImage(
                //     categoriesCubit.categories[index].image,
                //   ),
                // ),
              );
            },
          );
        }
      },
    );
  }
}
