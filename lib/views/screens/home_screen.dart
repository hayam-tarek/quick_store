import 'package:e_commerce_app/view_models/layout_cubit/layout_cubit.dart';
import 'package:e_commerce_app/views/widgets/banners_builder.dart';
import 'package:e_commerce_app/views/widgets/categories_list_view.dart';
import 'package:e_commerce_app/views/widgets/custom_search_text_form_field.dart';
import 'package:e_commerce_app/views/widgets/product_body.dart';
import 'package:e_commerce_app/views/widgets/title_with_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // BlocProvider.of<LayoutCubit>(context).getBanners();
    // BlocProvider.of<LayoutCubit>(context).getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // List<BannerModel> banners = BlocProvider.of<LayoutCubit>(context).banners;
    // List<CategoryModel> categories = BlocProvider.of<LayoutCubit>(context).categories;
    LayoutCubit cubit = BlocProvider.of<LayoutCubit>(context);
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomSearchTextFormField(
                      controller: controller,
                      onPressed: () {
                        controller.text = '';
                        BlocProvider.of<LayoutCubit>(context)
                            .filterProducts(query: controller.text);
                      },
                      onChanged: (query) {
                        BlocProvider.of<LayoutCubit>(context)
                            .filterProducts(query: query);
                      },
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: BannersBuilder(
                      // banners: banners,
                      // state: state,
                      ),
                ),
                SliverToBoxAdapter(
                  child: TitleWithButton(
                    title: 'Categories',
                    buttonTitle: 'View All',
                    onPressed: () {},
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 100,
                    child: CategoriesListView(
                        // categories: categories,
                        // state: state,
                        ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: TitleWithButton(
                    title: 'Products',
                    buttonTitle: 'View All',
                    onPressed: () {},
                  ),
                ),
                ProductsBody(
                  products: cubit.filteredProducts.isEmpty
                      ? cubit.products
                      : cubit.filteredProducts,
                  state: state,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
