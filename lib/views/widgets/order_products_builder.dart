import 'package:flutter/material.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/models/order_details_model.dart';
import 'package:quick_store/views/widgets/custom_decoration_container.dart';
import 'package:quick_store/views/widgets/title_text.dart';

class OrderProductsBuilder extends StatelessWidget {
  const OrderProductsBuilder({super.key, required this.orderProducts});
  final List<OrderProductModel> orderProducts;

  @override
  Widget build(BuildContext context) {
    return CustomDecorationContainer(
      child: Column(
        children: [
          TitleText(text: "Order Products", fontSize: 25),
          Divider(indent: 25, endIndent: 25),
          Expanded(
            child: ListView.builder(
              itemCount: orderProducts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    orderProducts[index].name,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: IntrinsicWidth(
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: kSecondaryColor.withOpacity(.2),
                          radius: 15,
                          child: Text(
                            'x${orderProducts[index].quantity}',
                            style: TextStyle(
                              color: kSecondaryColor,
                            ),
                          ),
                        ),
                        Image.network(
                          orderProducts[index].image,
                          height: 50,
                          width: 50,
                        ),
                      ],
                    ),
                  ),
                  trailing: Text(
                    '\$${orderProducts[index].price}',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
