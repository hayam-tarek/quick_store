import 'package:flutter/material.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/views/widgets/title_text.dart';

class ChooseLocationWithRadio extends StatelessWidget {
  const ChooseLocationWithRadio({
    super.key,
    required this.value,
    this.onChanged,
  });
  final String? value;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleText(
          text: "Where would you like the order to be delivered?",
          fontSize: 20,
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: RadioListTile(
                  title: Text("Current Location"),
                  value: kCurrentLocation,
                  activeColor: kSecondaryColor,
                  groupValue: value,
                  onChanged: onChanged),
            ),
            if (kLastAddressIdValue != null)
              Expanded(
                child: RadioListTile(
                    title: Text("Last Location"),
                    value: kLastLocation,
                    groupValue: value,
                    activeColor: kSecondaryColor,
                    onChanged: onChanged),
              ),
            //TODO i want to make the user choose from other choices like from the previous locations or pick from map
          ],
        ),
      ],
    );
  }
}
