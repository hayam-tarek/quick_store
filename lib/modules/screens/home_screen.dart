import 'package:e_commerce_app/modules/widgets/custom_material_button.dart';
import 'package:e_commerce_app/shared/network/local_network.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomMaterialButton(
            color: Colors.black,
            text: 'clear token',
            onPressed: () {
              CacheNetwork.sharedPref.clear();
            },
          ),
        ],
      ),
    );
  }
}
