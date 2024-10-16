import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/models/category_model.dart';
import 'package:quick_store/models/product_model.dart';
import 'package:quick_store/view_models/categories_cubit/categories_cubit.dart';
import 'package:quick_store/views/widgets/category_products_body.dart';
import 'package:quick_store/views/widgets/custom_simple_app_bar.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({
    super.key,
    required this.categoryModel,
  });
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customSimpleAppBar(
        context: context,
        title: categoryModel.name,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            List<ProductModel> categoryProducts =
                BlocProvider.of<CategoriesCubit>(context).categoryProducts;
            return CategoryProductsBody(
              categoryProducts: categoryProducts,
              categoriesState: state,
            );
          },
        ),
      ),
    );
  }
}
