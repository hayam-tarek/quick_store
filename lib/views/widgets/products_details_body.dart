import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/models/product_model.dart';
import 'package:quick_store/view_models/cart_cubit/cart_cubit.dart';
import 'package:quick_store/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:quick_store/views/widgets/custom_material_button.dart';
import 'package:quick_store/views/widgets/product_description.dart';
import 'package:quick_store/views/widgets/product_images_view.dart';
import 'package:quick_store/views/widgets/show_price.dart';
import 'package:quick_store/views/widgets/small_info.dart';

class ProductDetailsBody extends StatefulWidget {
  const ProductDetailsBody({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<ProductDetailsBody> createState() => _ProductDetailsBodyState();
}

class _ProductDetailsBodyState extends State<ProductDetailsBody> {
  @override
  Widget build(BuildContext context) {
    Set<num> favoritesID = BlocProvider.of<FavoriteCubit>(context).favoritesID;
    Set<num> cartItemsID = BlocProvider.of<CartCubit>(context).cartItemsID;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductImagesView(productModel: widget.productModel),
        if (widget.productModel.discount != 0)
          Align(
            alignment: Alignment.bottomRight,
            child: SmallInfo(productModel: widget.productModel),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            widget.productModel.name,
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ShowPrice(
          productModel: widget.productModel,
          fontSize: 18,
        ),
        const SizedBox(height: 10),
        Expanded(child: ProductDescription(productModel: widget.productModel)),
        //add to cart button
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: CustomMaterialButton(
                  color: kPrimaryColor,
                  text: cartItemsID.contains(widget.productModel.id)
                      ? 'Remove from Cart'
                      : 'Add to Cart',
                  onPressed: () async {
                    await BlocProvider.of<CartCubit>(context)
                        .addOrDeleteFromCart(
                            productId: widget.productModel.id.toInt());
                    BlocProvider.of<CartCubit>(context).getCart();
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                flex: 1,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: kPrimaryColor),
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    onPressed: () async {
                      await BlocProvider.of<FavoriteCubit>(context)
                          .addOrDeleteFavorite(
                              productId: widget.productModel.id.toInt());
                      BlocProvider.of<FavoriteCubit>(context).getFavorite();
                      setState(() {});
                    },
                    icon: favoritesID.contains(widget.productModel.id)
                        ? const Icon(
                            Icons.favorite,
                            color: kPrimaryColor,
                          )
                        : const Icon(
                            Icons.favorite_border,
                            color: kPrimaryColor,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
