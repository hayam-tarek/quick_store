import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/view_models/cart_cubit/cart_cubit.dart';
import 'package:quick_store/views/widgets/custom_material_button.dart';
import 'package:quick_store/views/widgets/custom_simple_app_bar.dart';
import 'package:quick_store/views/widgets/title_text.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final List<dynamic> paymentMethods = [
    {
      "name": "Cash",
      "image": kCashOnDelivery,
    },
    {
      "name": "Online",
      "image": kOnlinePayment,
    }
  ];

  int currentIndex = -1;
  bool? usePoints = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: customSimpleAppBar(context: context, title: "Payment Details"),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleText(
                text: "Payment Method",
                fontSize: 25,
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 170,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    mainAxisExtent: 180,
                  ),
                  itemCount: paymentMethods.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                          log('$currentIndex');
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            scale: currentIndex == -1
                                ? 4
                                : currentIndex != index
                                    ? 6
                                    : 4,
                            paymentMethods[index]["image"],
                          ),
                          Text(
                            paymentMethods[index]["name"],
                            style: TextStyle(
                                color: currentIndex == -1
                                    ? kPrimaryColor
                                    : currentIndex != index
                                        ? Colors.grey
                                        : kSecondaryColor),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Choose one method!",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: 10),
              CheckboxListTile(
                contentPadding: EdgeInsets.all(0),
                activeColor: kSecondaryColor,
                checkColor: kForegroundColor,
                title: TitleText(
                  text: "Use Points",
                  fontSize: 25,
                ),
                value: usePoints,
                onChanged: (value) {
                  setState(() {
                    usePoints = value;
                    log('$usePoints');
                  });
                },
              ),
              SizedBox(height: 10),
              TitleText(
                text: "Order Details",
                fontSize: 25,
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotal",
                          style: TextStyle(fontSize: 17),
                        ),
                        Text(
                          "\$${BlocProvider.of<CartCubit>(context).subTotal}",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(fontSize: 17),
                        ),
                        Text(
                          "\$${BlocProvider.of<CartCubit>(context).total}",
                          style: TextStyle(
                            fontSize: 17,
                            color: kSecondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              CustomMaterialButton(
                color: kPrimaryColor,
                text: "Submit",
                onPressed: () {
                  //TODO
                },
              )
            ],
          ),
        ));
  }
}
