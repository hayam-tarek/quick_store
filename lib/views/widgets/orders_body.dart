import 'package:flutter/material.dart';
import 'package:quick_store/models/order_model.dart';
import 'package:quick_store/views/widgets/custom_card.dart';
import 'package:quick_store/views/widgets/order_list_tile.dart';

class OrdersBody extends StatelessWidget {
  const OrdersBody({super.key, required this.orders});
  final List<OrderModel> orders;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return CustomCard(
          child: OrderListTile(ordersModel: orders[index]),
        );
      },
    );
  }
}
