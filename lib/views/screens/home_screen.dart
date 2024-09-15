import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/view_models/products_cubit/products_cubit.dart';
import 'package:e_commerce_app/views/widgets/banners_builder.dart';
import 'package:e_commerce_app/views/widgets/categories_list_view.dart';
import 'package:e_commerce_app/views/widgets/custom_search_text_form_field.dart';
import 'package:e_commerce_app/views/widgets/products_body.dart';
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
  Widget build(BuildContext context) {
    ProductsCubit productsCubit = BlocProvider.of<ProductsCubit>(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
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
                    BlocProvider.of<ProductsCubit>(context)
                        .filterProducts(query: controller.text);
                  },
                  onChanged: (query) {
                    BlocProvider.of<ProductsCubit>(context)
                        .filterProducts(query: query);
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: BannersBuilder(),
            ),
            SliverToBoxAdapter(
              child: TitleWithButton(
                title: 'Categories',
                buttonTitle: 'View All',
                onPressed: () {
                  //TODO
                },
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 60,
                child: CategoriesListView(),
              ),
            ),
            SliverToBoxAdapter(
              child: TitleWithButton(
                title: 'Products',
                buttonTitle: 'View All',
                onPressed: () {
                  //TODO
                },
              ),
            ),
            BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                return ProductsBody(
                  products: productsCubit.filteredProducts.isEmpty
                      ? productsCubit.products
                      : productsCubit.filteredProducts,
                  productsState: state,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
