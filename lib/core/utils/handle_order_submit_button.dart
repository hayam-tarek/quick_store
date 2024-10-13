import 'package:flutter/material.dart';
import 'package:quick_store/core/utils/constant.dart';
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
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return OrderStatusScreen(
            paymentMethod: paymentMethod,
            usePoints: usePoints,
            chosenLocation: chosenLocation,
          );
        },
      ),
    );
  }
}
