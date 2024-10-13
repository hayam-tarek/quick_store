import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/view_models/cart_cubit/cart_cubit.dart';
import 'package:quick_store/view_models/orders_cubit/orders_cubit.dart';
import 'package:quick_store/views/widgets/custom_material_button.dart';
import 'package:quick_store/views/widgets/custom_simple_app_bar.dart';

class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({
    super.key,
    required this.paymentMethod,
    required this.usePoints,
    required this.chosenLocation,
  });
  final num paymentMethod;
  final bool usePoints;
  final String chosenLocation;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OrdersCubit>(context).addOrder(
      addressId: kLastAddressIdValue!,
      paymentMethod: paymentMethod.toString(),
      usePoints: usePoints.toString(),
    );

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: customSimpleAppBar(context: context, title: "Order Status"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<OrdersCubit, OrdersState>(
          builder: (context, state) {
            if (state is AddOrderLoading) {
              return const Center(
                child: CupertinoActivityIndicator(
                  color: kSecondaryColor,
                ),
              );
            } else if (state is AddOrderFailure) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is AddOrderSuccess) {
              BlocProvider.of<CartCubit>(context).getCart();

              return Column(
                children: [
                  Image.asset(
                    kDeliveryPath,
                  ),
                  Text(
                    "Thank you for your order!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "We are delighted to serve you and hope you enjoy your shopping experience. Your order is being processed and will be delivered to your specified location as quickly as possible. If you have any questions or need further assistance, feel free to reach out to us.",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Have a great day!",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomMaterialButton(
                    color: kPrimaryColor,
                    text: "Okay",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            } else {
              return Center(
                child: Text("Try again!"),
              );
            }
          },
        ),
      ),
    );
  }
}
