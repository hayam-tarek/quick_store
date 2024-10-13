import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/api/end_points.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/view_models/cart_cubit/cart_cubit.dart';
import 'package:quick_store/view_models/orders_cubit/orders_cubit.dart';
import 'package:quick_store/views/screens/location_screen.dart';
import 'package:quick_store/views/screens/submit_order_screen.dart';
import 'package:quick_store/views/widgets/choose_location_with_radio.dart';
import 'package:quick_store/views/widgets/custom_check_box.dart';
import 'package:quick_store/views/widgets/custom_material_button.dart';
import 'package:quick_store/views/widgets/custom_simple_app_bar.dart';
import 'package:quick_store/views/widgets/order_details_container.dart';
import 'package:quick_store/views/widgets/payment_methods_list.dart';
import 'package:quick_store/views/widgets/title_text.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  bool usePoints = false;
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: customSimpleAppBar(context: context, title: "Payment Details"),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleText(text: "Payment Method", fontSize: 25),
                SizedBox(height: 20),
                PaymentMethodsList(paymentMethods: ApiValues.paymentMethods),
                SizedBox(height: 10),
                CustomCheckBox(
                  title: 'Use Points',
                  icon: Icons.loyalty,
                  value: usePoints,
                  onChanged: (value) {
                    setState(() {
                      usePoints = value!;
                    });
                  },
                ),
                SizedBox(height: 10),
                ChooseLocationWithRadio(
                  value: value,
                  onChanged: (value) {
                    setState(() {
                      this.value = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                OrderDetailsContainer(
                  cartCubit: BlocProvider.of<CartCubit>(context),
                ),
                SizedBox(height: 10),
                CustomMaterialButton(
                  color: kPrimaryColor,
                  text: "Continue",
                  onPressed: () async {
                    num? paymentMethod =
                        BlocProvider.of<OrdersCubit>(context).paymentMethod;
                    if (paymentMethod == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Please choose a payment method")),
                      );
                    } else if (value == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Please choose a location")),
                      );
                    } else {
                      if (value == kCurrentLocation) {
                        bool? addressSaved;
                        addressSaved =
                            await Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return LocationScreen();
                          },
                        ));
                        log('############################$addressSaved');
                        if (addressSaved != null && addressSaved == true) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return OrderStatusScreen(
                                  paymentMethod: paymentMethod,
                                  usePoints: usePoints,
                                  chosenLocation: value!,
                                );
                              },
                            ),
                          );
                        }
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return OrderStatusScreen(
                                paymentMethod: paymentMethod,
                                usePoints: usePoints,
                                chosenLocation: value!,
                              );
                            },
                          ),
                        );
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
