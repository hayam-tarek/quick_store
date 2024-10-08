import 'package:flutter/material.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/views/widgets/custom_simple_app_bar.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: customSimpleAppBar(context: context, title: "Add new address"),
    );
  }
}
