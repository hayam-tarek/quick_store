import 'package:e_commerce_app/cubits/layout_cubit/layout_cubit.dart';
import 'package:e_commerce_app/models/banner_model.dart';
import 'package:e_commerce_app/models/category_model.dart';
import 'package:e_commerce_app/modules/widgets/banners_builder.dart';
import 'package:e_commerce_app/modules/widgets/categories_list_view.dart';
import 'package:e_commerce_app/modules/widgets/custom_search_text_form_field.dart';
import 'package:e_commerce_app/modules/widgets/custom_smooth_page_indicator.dart';
import 'package:e_commerce_app/modules/widgets/title_with_button.dart';
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
    BlocProvider.of<LayoutCubit>(context).getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<BannerModel> banners = BlocProvider.of<LayoutCubit>(context).banners;
    List<CategoryModel> categories =
        BlocProvider.of<LayoutCubit>(context).categories;
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
                SliverToBoxAdapter(
                  child: TitleWithButton(
                    title: 'Categories',
                    buttonTitle: 'View All',
                    onPressed: () {},
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 75,
                    child: CategoriesListView(
                      categories: categories,
                      state: state,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
