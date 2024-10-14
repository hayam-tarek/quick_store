import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/models/order_model.dart';
import 'package:quick_store/view_models/orders_cubit/orders_cubit.dart';
import 'package:quick_store/views/widgets/custom_simple_app_bar.dart';
import 'package:quick_store/views/widgets/orders_body.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OrdersCubit>(context).getOrders();
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: customSimpleAppBar(context: context, title: "Orders"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocBuilder<OrdersCubit, OrdersState>(
          builder: (context, state) {
            List<OrderModel> orders =
                BlocProvider.of<OrdersCubit>(context).orders;
            if (state is GetOrdersLoading) {
              return Center(
                child: CupertinoActivityIndicator(
                  color: kSecondaryColor,
                ),
              );
            } else if (state is GetOrdersFailure || orders.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: double.infinity),
                  Image.asset(
                    kOrdersPath,
                    scale: 5,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "No Orders Yet",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              );
            } else {
              return OrdersBody(
                orders: orders,
              );
            }
          },
        ),
      ),
    );
  }
}
