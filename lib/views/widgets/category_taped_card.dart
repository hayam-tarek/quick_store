import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/models/category_model.dart';
import 'package:quick_store/view_models/categories_cubit/categories_cubit.dart';
import 'package:quick_store/views/screens/category_products_screen.dart';
import 'package:quick_store/views/widgets/custom_card.dart';

class CategoryTapedCard extends StatelessWidget {
  const CategoryTapedCard({
    super.key,
    required this.categoryModel,
  });
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              BlocProvider.of<CategoriesCubit>(context)
                  .getCategoryProducts(id: categoryModel.id);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CategoryProductsScreen(categoryModel: categoryModel),
                ),
              );
            },
            child: CustomCard(
              child: Image.network(
                width: double.infinity,
                categoryModel.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Text(
          categoryModel.name,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
