import 'package:e_commerce_app/helper/constant.dart';
import 'package:e_commerce_app/models/category_model.dart';
import 'package:e_commerce_app/shared/services/categories_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({
    super.key,
    // required this.categories,
    // required this.state,
  });

  // final List<CategoryModel> categories;
  // final LayoutState state;

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  var future;
  @override
  void initState() {
    future = CategoriesService().getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CupertinoActivityIndicator(
              color: kSecondaryColor,
            ),
          );
        } else if (snapshot.hasData) {
          return ListView.separated(
            padding: const EdgeInsets.all(.8),
            separatorBuilder: (context, index) {
              return VerticalDivider(
                color: kSecondaryColor.withOpacity(.5),
                width: 10,
                indent: 20,
                endIndent: 20,
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      snapshot.data![index].image,
                    ),
                  ),
                  // Text(
                  //   snapshot.data![index].name,
                  // ),
                ],
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
      },
    );

//     if (widget.state is GetCategoriesLoading) {
//       return const Center(
//         child: CupertinoActivityIndicator(
//           color: kSecondaryColor,
//         ),
//       );
//     } else if (widget.state is GetCategoriesSuccess) {
//       return ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: widget.categories.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(1.0),
//             child: CircleAvatar(
//               radius: 40,
//               backgroundImage: NetworkImage(
//                 widget.categories[index].image,
//               ),
//             ),
//           );
//         },
//       );
//     } else {
//       return const Center(
//         child: Text(
//           'No categories found.',
//         ),
//       );
//     }
  }
}
