import 'package:e_commerce_app/cubits/layout_cubit/layout_cubit.dart';
import 'package:e_commerce_app/helper/constant.dart';
import 'package:e_commerce_app/models/banner_model.dart';
import 'package:flutter/material.dart';

class BannersBuilder extends StatelessWidget {
  const BannersBuilder({
    super.key,
    required this.banners,
    required this.state,
    required this.pageController,
  });
  final List<BannerModel> banners;
  final LayoutState state;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    if (state is GetBannersLoading) {
      return const Align(
        alignment: Alignment.topCenter,
        child: LinearProgressIndicator(
          color: kSecondaryColor,
        ),
      );
    } else if (state is GetBannersSuccess) {
      return SizedBox(
        height: 135,
        child: PageView.builder(
          controller: pageController,
          physics: const BouncingScrollPhysics(),
          itemCount: banners.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              child: Image.network(
                banners[index].image,
                fit: BoxFit.fill,
              ),
            );
          },
        ),
      );
    } else {
      return const Center(
        child: Text(
          'No banners found.',
        ),
      );
    }
  }
}
