import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_store/view_models/location_services_cubit/location_services_cubit.dart';
import 'package:quick_store/views/screens/add_address_screen.dart';

void locationServicesListener(
    LocationServicesState state, BuildContext context) async {
  if (state is LocationPermissionsAreDenied) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Ok"),
            ),
          ],
          icon: Icon(Icons.location_disabled),
          content: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Please grant the app permission to access your location.",
            ),
          ),
        );
      },
    );
  }
  if (state is LocationPermissionsAreDeniedForever) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text("Ok"),
            ),
          ],
          icon: Icon(Icons.location_disabled),
          content: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Location Permissions Are Denied Forever.",
            ),
          ),
        );
      },
    );
  }
  if (state is LocationServicesAreEnabled) {
    bool? addressSaved = await Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return AddAddressScreen();
      },
    ));
    if (context.mounted) {
      Navigator.pop(context, addressSaved);
    }
  }
  if (state is LocationServicesException) {
    log(state.message);
  }
}
