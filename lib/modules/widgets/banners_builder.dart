import 'package:e_commerce_app/helper/constant.dart';
import 'package:e_commerce_app/models/banner_model.dart';
import 'package:e_commerce_app/modules/widgets/custom_smooth_page_indicator.dart';
import 'package:e_commerce_app/shared/services/banner_services.dart';
import 'package:flutter/cupertino.dart';

class BannersBuilder extends StatefulWidget {
  const BannersBuilder({
    super.key,
    // required this.banners,
    // required this.state,
  });
  // final List<BannerModel> banners;
  // final LayoutState state;

  @override
  State<BannersBuilder> createState() => _BannersBuilderState();
}

class _BannersBuilderState extends State<BannersBuilder> {
  final PageController pageController = PageController();

  var future;
  @override
  void initState() {
    future = BannerService().getBanners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BannerModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CupertinoActivityIndicator(
              color: kSecondaryColor,
            ),
          );
        } else if (snapshot.hasData) {
          return Column(
            children: [
              SizedBox(
                height: 135,
                child: PageView.builder(
                  controller: pageController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      child: Image.network(
                        snapshot.data![index].image,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                ),
              ),
              Center(
                child: CustomSmoothPageIndicator(
                  pageController: pageController,
                  count: snapshot.data!.length,
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: Text(
              'No banners found.',
            ),
          );
        }
      },
    );

    //   if (widget.state is GetBannersLoading) {
    //     return const Center(
    //       child: CupertinoActivityIndicator(
    //         color: kSecondaryColor,
    //       ),
    //     );
    //   } else if (widget.state is GetBannersSuccess) {
    //     return Column(
    //       children: [
    //         SizedBox(
    //           height: 135,
    //           child: PageView.builder(
    //             controller: pageController,
    //             physics: const BouncingScrollPhysics(),
    //             itemCount: widget.banners.length,
    //             itemBuilder: (context, index) {
    //               return Container(
    //                 margin: const EdgeInsets.symmetric(horizontal: 2),
    //                 child: Image.network(
    //                   widget.banners[index].image,
    //                   fit: BoxFit.fill,
    //                 ),
    //               );
    //             },
    //           ),
    //         ),
    //         Center(
    //           child: CustomSmoothPageIndicator(
    //             pageController: pageController,
    //             count: widget.banners.length,
    //           ),
    //         ),
    //       ],
    //     );
    //   } else {
    //     return const Center(
    //       child: Text(
    //         'No banners found.',
    //       ),
    //     );
    //   }
  }
}
