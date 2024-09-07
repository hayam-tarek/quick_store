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
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: Image.network(
                  categoryModel.image,
                  fit: BoxFit.fill,
                )),
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
