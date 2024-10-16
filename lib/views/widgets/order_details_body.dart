import 'package:flutter/material.dart';
import 'package:quick_store/models/order_details_model.dart';
import 'package:quick_store/views/widgets/order_address_details.dart';
import 'package:quick_store/views/widgets/order_invoice.dart';
import 'package:quick_store/views/widgets/order_products_builder.dart';

class OrderDetailsBody extends StatelessWidget {
  const OrderDetailsBody({super.key, required this.orderDetailsModel});
  final OrderDetailsModel orderDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(height: 20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: OrderProductsBuilder(
              orderProducts: orderDetailsModel.products,
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: OrderAddressDetails(
            addressModel: orderDetailsModel.address,
          ),
        ),
        SizedBox(height: 10),
        OrderInvoice(
          orderDetailsModel: orderDetailsModel,
        ),
      ],
    );
  }
}
