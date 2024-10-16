import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/view_models/orders_cubit/orders_cubit.dart';
import 'package:quick_store/views/screens/location_screen.dart';
import 'package:quick_store/views/screens/order_status_screen.dart';

void handleOrderSubmitButton({
  required BuildContext context,
  required num? paymentMethod,
  required bool usePoints,
  required String? chosenLocation,
}) async {
  if (paymentMethod == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please choose a payment method")),
    );
    return;
  }
  if (chosenLocation == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please choose a location")),
    );
    return;
  }
  if (chosenLocation == kCurrentLocation) {
    bool? addressSaved = await Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return LocationScreen();
      },
    ));
    if (addressSaved == null || addressSaved == false) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please choose a location")),
        );
      }
      return;
    }
  }
  if (context.mounted) {
    BlocProvider.of<OrdersCubit>(context).addOrder(
      addressId: kLastAddressIdValue!,
      paymentMethod: paymentMethod.toString(),
      usePoints: usePoints.toString(),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return OrderStatusScreen();
        },
      ),
    );
  }
}
