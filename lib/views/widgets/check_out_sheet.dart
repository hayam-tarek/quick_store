import 'package:flutter/material.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/views/screens/check_out_screen.dart';
import 'package:quick_store/views/widgets/custom_material_button.dart';

class CheckOutSheet extends StatelessWidget {
  const CheckOutSheet({
    super.key,
    required this.totalPrice,
  });

  final num totalPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  color: kPrimaryColor.withOpacity(.5),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$${totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: kSecondaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: CustomMaterialButton(
            color: kPrimaryColor,
            text: "Check Out",
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return CheckOutScreen();
                },
              ));
            },
          ),
        ),
      ],
    );
  }
}
