import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/api/end_points.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/core/utils/handle_order_submit_button.dart';
import 'package:quick_store/view_models/cart_cubit/cart_cubit.dart';
import 'package:quick_store/view_models/orders_cubit/orders_cubit.dart';
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
  String? chosenLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                value: chosenLocation,
                onChanged: (value) {
                  setState(() {
                    chosenLocation = value;
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
                text: "Submit",
                onPressed: () async {
                  num? paymentMethod =
                      BlocProvider.of<OrdersCubit>(context).paymentMethod;
                  handleOrderSubmitButton(
                      context: context,
                      paymentMethod: paymentMethod,
                      chosenLocation: chosenLocation,
                      usePoints: usePoints);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
