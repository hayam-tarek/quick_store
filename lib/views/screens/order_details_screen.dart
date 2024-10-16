import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/models/order_details_model.dart';
import 'package:quick_store/view_models/orders_cubit/orders_cubit.dart';
import 'package:quick_store/views/widgets/custom_simple_app_bar.dart';
import 'package:quick_store/views/widgets/order_details_body.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor.withOpacity(.95),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          child: customSimpleAppBar(context: context, title: "Order Details"),
        ),
      ),
      body: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          if (state is GetOrderDetailsLoading) {
            return const Center(
              child: CupertinoActivityIndicator(
                color: kSecondaryColor,
              ),
            );
          } else if (state is GetOrderDetailsFailure) {
            return Center(
              child: Text(state.message),
            );
          } else {
            OrderDetailsModel orderDetailsModel =
                BlocProvider.of<OrdersCubit>(context).orderDetailsModel!;
            return OrderDetailsBody(
              orderDetailsModel: orderDetailsModel,
            );
          }
        },
      ),
    );
  }
}
