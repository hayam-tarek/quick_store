import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/models/order_model.dart';
import 'package:quick_store/view_models/orders_cubit/orders_cubit.dart';
import 'package:quick_store/views/widgets/custom_simple_app_bar.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key, required this.orderModel});
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OrdersCubit>(context)
        .getOrderDetails(orderID: orderModel.id);
    return Scaffold(
      appBar: customSimpleAppBar(context: context, title: "Order Details"),
      body: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          return Center(child: Text("hoi"));
        },
      ),
    );
  }
}
