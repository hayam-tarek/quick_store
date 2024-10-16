import 'package:flutter/material.dart';
import 'package:quick_store/core/api/end_points.dart';
import 'package:quick_store/models/order_details_model.dart';
import 'package:quick_store/views/widgets/cancel_order_button.dart';
import 'package:quick_store/views/widgets/custom_rounded_container.dart';
import 'package:quick_store/views/widgets/invoice_item.dart';
import 'package:quick_store/views/widgets/title_text.dart';

class OrderInvoice extends StatelessWidget {
  const OrderInvoice({super.key, required this.orderDetailsModel});
  final OrderDetailsModel orderDetailsModel;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 5),
            Center(
              child: TitleText(text: "Order Summary", fontSize: 25),
            ),
            Divider(indent: 25, endIndent: 25),
            InvoiceItem(
              titleText: 'Cost',
              trailingText: '\$${orderDetailsModel.cost.toStringAsFixed(2)}',
            ),
            InvoiceItem(
              titleText: 'Discount',
              trailingText:
                  '\$${orderDetailsModel.discount.toStringAsFixed(2)}',
            ),
            InvoiceItem(
              titleText: 'Points',
              trailingText: orderDetailsModel.points.toStringAsFixed(2),
            ),
            InvoiceItem(
              titleText: 'Vat',
              trailingText: '\$${orderDetailsModel.vat.toStringAsFixed(2)}',
            ),
            InvoiceItem(
              titleText: 'Payment Method',
              trailingText: orderDetailsModel.paymentMethod,
            ),
            InvoiceItem(
              titleText: 'Date',
              trailingText: orderDetailsModel.date,
            ),
            Divider(),
            InvoiceItem(
              titleText: 'Total',
              trailingText: '\$${orderDetailsModel.total.toStringAsFixed(2)}',
            ),
            SizedBox(height: 10),
            if (orderDetailsModel.status == ApiKey.newOrder)
              CancelOrderButton(
                orderId: orderDetailsModel.id,
                popWhenPressed: true,
              ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
