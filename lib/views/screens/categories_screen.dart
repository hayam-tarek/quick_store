import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/models/category_model.dart';
import 'package:quick_store/view_models/categories_cubit/categories_cubit.dart';
import 'package:quick_store/views/widgets/category_taped_card.dart';
import 'package:quick_store/views/widgets/title_with_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories =
        BlocProvider.of<CategoriesCubit>(context).categories;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: TitleWithButton(
                  title: 'Categories',
                  buttonTitle: '${categories.length} category',
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverGrid.builder(
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return CategoryTapedCard(
                    categoryModel: categories[index],
                  );
                },
              ),
            ],
          )),
    );
  }
}
