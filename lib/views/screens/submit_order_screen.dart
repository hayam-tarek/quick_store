import 'package:flutter/material.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/views/widgets/custom_simple_app_bar.dart';

class SubmitOrderScreen extends StatelessWidget {
  const SubmitOrderScreen({
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
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: customSimpleAppBar(context: context, title: "Submit Order"),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(kLocationPath),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Where would you like the order to be delivered?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.5,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel"),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
