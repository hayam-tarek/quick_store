import 'package:flutter/material.dart';
import 'package:quick_store/core/api/end_points.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/models/order_model.dart';
import 'package:quick_store/views/widgets/cancel_order_button.dart';
import 'package:quick_store/views/widgets/custom_card.dart';

class OrdersBody extends StatelessWidget {
  const OrdersBody({super.key, required this.orders});
  final List<OrderModel> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return CustomCard(
          child: ListTile(
            onTap: () {
              //TODO
            },
            title: Text(orders[index].date),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Status: ${orders[index].status}'),
                Text(
                  'Total: \$${orders[index].total.ceil()}',
                  style: TextStyle(
                    color: kSecondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            trailing: CancelOrderButton(),
            leading: orders[index].status == ApiKey.newOrder
                ? CircleAvatar(
                    backgroundColor: Colors.green.withOpacity(.2),
                    child: Icon(
                      Icons.done,
                      color: Colors.green,
                    ),
                  )
                : orders[index].status == ApiKey.cancelledOrder
                    ? CircleAvatar(
                        backgroundColor: Colors.red[600]!.withOpacity(.2),
                        child: Icon(
                          Icons.cancel_outlined,
                          color: Colors.red[600],
                        ),
                      )
                    : null,
          ),
        );
      },
    );
  }
}
