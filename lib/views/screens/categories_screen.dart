import 'package:e_commerce_app/core/services/categories_service.dart';
import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/models/category_model.dart';
import 'package:e_commerce_app/views/widgets/category_taped_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var future;
  @override
  void initState() {
    future = CategoriesService().getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FutureBuilder<List<CategoryModel>>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CupertinoActivityIndicator(
                    color: kSecondaryColor,
                  ),
                );
              } else if (snapshot.hasData) {
                return GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return CategoryTapedCard(
                      categoryModel: snapshot.data![index],
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
            }),
      ),
    );
  }
}
