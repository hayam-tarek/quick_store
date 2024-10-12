import 'package:flutter/material.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/views/widgets/title_text.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key, required this.title, required this.value, this.onChanged});
  final String title;
  final bool value;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.all(0),
      activeColor: kSecondaryColor,
      checkColor: kForegroundColor,
      title: TitleText(
        text: title,
        fontSize: 25,
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
