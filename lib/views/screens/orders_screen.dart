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
      appBar: customSimpleAppBar(context: context, title: "My Orders"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocConsumer<OrdersCubit, OrdersState>(
          listener: (context, state) {
            if (state is CancelOrderSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.green,
                ),
              );
            }
            if (state is CancelOrderFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red[600],
                ),
              );
            }
          },
          builder: (context, state) {
            List<OrderModel> orders =
                BlocProvider.of<OrdersCubit>(context).orders;
            return CustomScrollView(
              slivers: [
                if (state is GetOrdersLoading)
                  SliverToBoxAdapter(
                    child: LinearProgressIndicator(
                      color: kSecondaryColor,
                      backgroundColor: kSecondaryColor.withOpacity(.2),
                    ),
                  ),
                if (state is GetOrdersFailure || orders.isEmpty)
                  SliverFillRemaining(
                    child: Column(
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
                    ),
                  )
                else
                  OrdersBody(
                    orders: orders,
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
