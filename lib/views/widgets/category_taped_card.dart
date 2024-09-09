import 'package:e_commerce_app/models/category_model.dart';
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
            onTap: () {},
            child: Card(
              elevation: 7.5,
              color: Colors.white,
              shadowColor: Colors.grey,
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  5,
                ),
              ),
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
