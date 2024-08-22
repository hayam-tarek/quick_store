import 'package:e_commerce_app/cubits/layout_cubit/layout_cubit.dart';
import 'package:e_commerce_app/models/banner_model.dart';
import 'package:e_commerce_app/modules/widgets/banners_builder.dart';
import 'package:e_commerce_app/modules/widgets/custom_search_text_form_field.dart';
import 'package:e_commerce_app/modules/widgets/custom_smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();

  @override
  void initState() {
    BlocProvider.of<LayoutCubit>(context).getBanners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<BannerModel> banners = BlocProvider.of<LayoutCubit>(context).banners;
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomSearchTextFormField(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: BannersBuilder(
                    banners: banners,
                    state: state,
                    pageController: pageController,
                  ),
                ),
                if (state is GetBannersSuccess)
                  SliverToBoxAdapter(
                    child: Center(
                      child: CustomSmoothPageIndicator(
                        pageController: pageController,
                        count: banners.length,
                      ),
                    ),
                  ),
                SliverList.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return const Text('Hello');
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
