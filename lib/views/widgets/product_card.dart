import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/models/product_model.dart';
import 'package:quick_store/view_models/products_cubit/products_cubit.dart';
import 'package:quick_store/views/screens/product_details_screen.dart';
import 'package:quick_store/views/widgets/cart_button.dart';
import 'package:quick_store/views/widgets/custom_card.dart';
import 'package:quick_store/views/widgets/favorite_button.dart';
import 'package:quick_store/views/widgets/show_price.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<ProductsCubit>(context)
            .getProductDetails(id: widget.productModel.id);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProductDetailsScreen(),
            ));
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomCard(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.productModel.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ShowPrice(
                      productModel: widget.productModel,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: -30,
            child: Image.network(
              widget.productModel.image,
              height: 75,
              width: 75,
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: FavoriteButton(
              context: context,
              productModel: widget.productModel,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: CartButton(
              context: context,
              productModel: widget.productModel,
            ),
          ),
        ],
      ),
    );
  }
}
