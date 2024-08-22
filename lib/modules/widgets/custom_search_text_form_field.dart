import 'package:e_commerce_app/helper/constant.dart';
import 'package:flutter/material.dart';

class CustomSearchTextFormField extends StatelessWidget {
  const CustomSearchTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        cursorColor: kSecondaryColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: kPrimaryColor.withOpacity(.1),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: kPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: kPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          hintText: 'Search',
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
        ));
  }
}
