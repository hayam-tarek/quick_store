import 'package:e_commerce_app/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator({
    super.key,
    required this.pageController,
    required this.count,
  });

  final PageController pageController;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SmoothPageIndicator(
        controller: pageController,
        count: count,
        axisDirection: Axis.horizontal,
        onDotClicked: (index) {
          pageController.jumpToPage(index);
        },
        effect: ScrollingDotsEffect(
          spacing: 5,
          radius: 25,
          dotWidth: 15,
          dotHeight: 15,
          paintStyle: PaintingStyle.fill,
          strokeWidth: 1,
          dotColor: kSecondaryColor.withOpacity(.35),
          activeDotColor: kPrimaryColor,
        ),
      ),
    );
  }
}
