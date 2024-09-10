import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.productModel,
    this.showOldPrice = false,
    this.showShoppingCart = false,
    this.showFavorite = true,
  });
  final ProductModel productModel;
  final bool showOldPrice;
  final bool showShoppingCart;
  final bool showFavorite;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    Set<num> favoritesID = BlocProvider.of<FavoriteCubit>(context).favoritesID;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        InkWell(
          onTap: () {},
          child: Card(
            elevation: 7.5,
            color: Colors.white,
            shadowColor: Colors.grey,
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                5,
              ),
            ),
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
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '\$${widget.productModel.price}   ',
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (widget.showOldPrice)
                        Text(
                          '\$${widget.productModel.oldPrice}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      const Spacer(),
                      if (widget.showShoppingCart)
                        IconButton(
                          onPressed: () async {
                            // await BlocProvider.of<FavoriteCubit>(context)
                            //     .addOrDeleteFavorite(
                            //         productId: widget.productModel.id.toInt());
                            setState(() {});
                          },
                          icon: (!favoritesID.contains(widget.productModel.id))
                              ? const Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.green,
                                )
                              : const Icon(
                                  Icons.remove_shopping_cart,
                                  color: Colors.orange,
                                ),
                        ),
                      if (widget.showFavorite)
                        IconButton(
                          onPressed: () async {
                            await BlocProvider.of<FavoriteCubit>(context)
                                .addOrDeleteFavorite(
                                    productId: widget.productModel.id.toInt());
                            setState(() {});
                          },
                          icon: (favoritesID.contains(widget.productModel.id))
                              ? const Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_border_rounded,
                                  color: Colors.grey,
                                ),
                        )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 25,
          top: -30,
          child: Image.network(
            widget.productModel.image,
            height: 75,
            width: 75,
          ),
        ),
      ],
    );
  }
}
