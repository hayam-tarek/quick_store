import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/view_models/orders_cubit/orders_cubit.dart';

class PaymentMethodsList extends StatefulWidget {
  const PaymentMethodsList({super.key, required this.paymentMethods});
  final List<Map<String, String>> paymentMethods;

  @override
  State<PaymentMethodsList> createState() => _PaymentMethodsListState();
}

class _PaymentMethodsListState extends State<PaymentMethodsList> {
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    if (currentIndex == -1) {
      BlocProvider.of<OrdersCubit>(context).paymentMethod = null;
    }
    return Column(
      children: [
        SizedBox(
          height: 170,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              mainAxisExtent: 180,
            ),
            itemCount: widget.paymentMethods.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                  BlocProvider.of<OrdersCubit>(context).paymentMethod =
                      index + 1;
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
                      widget.paymentMethods[index]["image"]!,
                    ),
                    Text(
                      widget.paymentMethods[index]["name"]!,
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
      ],
    );
  }
}
