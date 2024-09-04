import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/view_models/layout_cubit/layout_cubit.dart';
import 'package:e_commerce_app/views/widgets/product_card.dart';
import 'package:flutter/cupertino.dart';

class ProductsBody extends StatelessWidget {
  const ProductsBody({
    super.key,
    required this.products,
    required this.state,
  });

  final List<ProductModel> products;
  final LayoutState state;

  @override
  Widget build(BuildContext context) {
    if (state is GetProductsLoading) {
      return const SliverFillRemaining(
        child: Center(
          child: CupertinoActivityIndicator(
            color: kSecondaryColor,
          ),
        ),
      );
    } else if (state is GetProductsSuccess) {
      return SliverGrid.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
              top: 50,
            ),
            child: ProductCard(
              productModel: products[index],
            ),
          );
        },
      );
    } else {
      return const SliverFillRemaining(
        child: Center(
          child: Text(
            "No Products",
          ),
        ),
      );
    }
  }
}
