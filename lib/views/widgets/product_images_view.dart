import 'package:flutter/material.dart';
import 'package:quick_store/models/product_model.dart';
import 'package:quick_store/views/widgets/custom_smooth_page_indicator.dart';

class ProductImagesView extends StatelessWidget {
  ProductImagesView({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: PageView.builder(
            controller: pageController,
            physics: const BouncingScrollPhysics(),
            itemCount: productModel.images!.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                color: Colors.white,
                child: Image.network(
                  productModel.images![index],
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
        ),
        Center(
          child: CustomSmoothPageIndicator(
            pageController: pageController,
            count: productModel.images!.length,
          ),
        ),
      ],
    );
  }
}
