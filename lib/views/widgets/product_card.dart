import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/models/product_model.dart';
import 'package:quick_store/view_models/cart_cubit/cart_cubit.dart';
import 'package:quick_store/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:quick_store/views/screens/product_details_screen.dart';
import 'package:quick_store/views/widgets/custom_card.dart';
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
    Set<num> favoritesID = BlocProvider.of<FavoriteCubit>(context).favoritesID;
    Set<num> cartItemsID = BlocProvider.of<CartCubit>(context).cartItemsID;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(
                productModel: widget.productModel,
              ),
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
            child: IconButton(
              onPressed: () async {
                await BlocProvider.of<FavoriteCubit>(context)
                    .addOrDeleteFavorite(
                        productId: widget.productModel.id.toInt());
                BlocProvider.of<FavoriteCubit>(context).getFavorite();
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
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: IconButton(
              onPressed: () async {
                await BlocProvider.of<CartCubit>(context).addOrDeleteFromCart(
                    productId: widget.productModel.id.toInt());
                BlocProvider.of<CartCubit>(context).getCart();
                setState(() {});
              },
              icon: (cartItemsID.contains(widget.productModel.id))
                  ? const Icon(
                      Icons.remove_shopping_cart_outlined,
                      color: Colors.orange,
                    )
                  : const Icon(
                      Icons.add_shopping_cart,
                      color: Colors.green,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
