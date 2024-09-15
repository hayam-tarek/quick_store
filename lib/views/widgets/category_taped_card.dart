import 'package:e_commerce_app/models/category_model.dart';
import 'package:e_commerce_app/views/widgets/custom_card.dart';
import 'package:flutter/material.dart';

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
              // TODO: navigate to products screen
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
