import 'package:flutter/material.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/views/widgets/title_text.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.title,
    required this.value,
    this.onChanged,
    this.icon,
  });
  final String title;
  final bool value;
  final void Function(bool?)? onChanged;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.all(0),
      activeColor: kSecondaryColor,
      checkColor: kForegroundColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitleText(
            text: title,
            fontSize: 25,
          ),
          SizedBox(width: 5),
          if (icon != null)
            Icon(
              icon,
              color: kSecondaryColor,
            ),
        ],
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
