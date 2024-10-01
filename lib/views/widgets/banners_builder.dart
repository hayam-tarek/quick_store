import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_store/core/services/banner_services.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/models/banner_model.dart';
import 'package:quick_store/views/widgets/custom_smooth_page_indicator.dart';

class BannersBuilder extends StatefulWidget {
  const BannersBuilder({
    super.key,
  });

  @override
  State<BannersBuilder> createState() => _BannersBuilderState();
}

class _BannersBuilderState extends State<BannersBuilder> {
  final PageController pageController = PageController();

  // ignore: prefer_typing_uninitialized_variables
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
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.broken_image,
                            color: Colors.grey,
                            size: 70,
                          );
                        },
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
  }
}
