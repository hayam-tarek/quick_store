import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/api/end_points.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/models/order_model.dart';
import 'package:quick_store/view_models/orders_cubit/orders_cubit.dart';
import 'package:quick_store/views/screens/order_details_screen.dart';
import 'package:quick_store/views/widgets/cancel_order_button.dart';

class OrderListTile extends StatelessWidget {
  const OrderListTile({
    super.key,
    required this.ordersModel,
  });

  final OrderModel ordersModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        BlocProvider.of<OrdersCubit>(context)
            .getOrderDetails(orderID: ordersModel.id);
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return OrderDetailsScreen();
          },
        ));
      },
      title: Text('ID: #${ordersModel.id}'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(ordersModel.date),
          Text('Status: ${ordersModel.status}'),
          Text(
            'Total: \$${ordersModel.total.ceil()}',
            style: TextStyle(
              color: kSecondaryColor,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
      trailing: ordersModel.status == ApiKey.newOrder
          ? CancelOrderButton(
              orderId: ordersModel.id,
            )
          : null,
      leading: ordersModel.status == ApiKey.newOrder
          ? CircleAvatar(
              backgroundColor: Colors.green.withOpacity(.2),
              child: Icon(
                Icons.done,
                color: Colors.green,
              ),
            )
          : ordersModel.status == ApiKey.cancelledOrder
              ? CircleAvatar(
                  backgroundColor: Colors.red[600]!.withOpacity(.2),
                  child: Icon(
                    Icons.cancel_outlined,
                    color: Colors.red[600],
                  ),
                )
              : null,
    );
  }
}
