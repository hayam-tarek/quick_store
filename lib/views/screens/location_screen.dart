import 'package:flutter/material.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/views/widgets/custom_material_button.dart';
import 'package:quick_store/views/widgets/custom_simple_app_bar.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: customSimpleAppBar(context: context, title: "Location"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                kCurrentLocationPath,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Allow your location",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "We will need your location to give you better experience.",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomMaterialButton(
                    color: kPrimaryColor,
                    text: "Sure, i'd like that",
                    onPressed: () {
                      //Location.determinePosition();
                      //TODO
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text("Not now"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
