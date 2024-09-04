import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${widget.productModel.price}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: widget.productModel.inFavorites
                            ? const Icon(
                                Icons.favorite_rounded,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_border_rounded,
                                color: Colors.red,
                              ),
                      ),
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
