import 'package:flutter/material.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/models/address_model.dart';
import 'package:quick_store/views/widgets/custom_decoration_container.dart';
import 'package:quick_store/views/widgets/title_text.dart';

class OrderAddressDetails extends StatelessWidget {
  const OrderAddressDetails({super.key, required this.addressModel});
  final AddressModel addressModel;

  @override
  Widget build(BuildContext context) {
    return CustomDecorationContainer(
      child: Column(
        children: [
          TitleText(text: 'Address', fontSize: 25),
          Divider(indent: 25, endIndent: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Icon(Icons.location_city, color: kSecondaryColor),
                    Text(addressModel.city),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.location_on, color: kSecondaryColor),
                    Text(addressModel.name),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.map, color: kSecondaryColor),
                    Text(addressModel.region),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
