import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/models/product_model.dart';
import 'package:quick_store/view_models/cart_cubit/cart_cubit.dart';
import 'package:quick_store/view_models/products_cubit/products_cubit.dart';
import 'package:quick_store/views/screens/product_details_screen.dart';
import 'package:quick_store/views/widgets/cart_button.dart';
import 'package:quick_store/views/widgets/custom_card.dart';
import 'package:quick_store/views/widgets/favorite_button.dart';
import 'package:quick_store/views/widgets/show_price.dart';

class SimpleProductCard extends StatefulWidget {
  const SimpleProductCard({
    super.key,
    required this.productModel,
    required this.showShoppingCart,
    required this.showFavorite,
  });
  final ProductModel productModel;
  final bool showShoppingCart;
  final bool showFavorite;
  @override
  State<SimpleProductCard> createState() => _SimpleProductCardState();
}

class _SimpleProductCardState extends State<SimpleProductCard> {
  @override
  Widget build(BuildContext context) {
    Set<num> cartItemsID = BlocProvider.of<CartCubit>(context).cartItemsID;
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
      child: CustomCard(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Image.network(
                    widget.productModel.image,
                    fit: BoxFit.contain,
                    // width: double.infinity,
                    // height: double.infinity,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      widget.productModel.name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        ShowPrice(
                            productModel: widget.productModel, fontSize: 13),
                        const Spacer(),
                        if (widget.showShoppingCart)
                          CartButton(
                            context: context,
                            productModel: widget.productModel,
                          ),
                        if (widget.showFavorite)
                          FavoriteButton(
                            context: context,
                            productModel: widget.productModel,
                          ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
