import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/view_models/location_services_cubit/location_services_cubit.dart';
import 'package:quick_store/views/screens/add_address_screen.dart';
import 'package:quick_store/views/widgets/alert_dialog_icon.dart';
import 'package:quick_store/views/widgets/custom_snake_bar.dart';

void locationServicesListener(
    LocationServicesState state, BuildContext context) async {
  if (state is LocationPermissionsAreDenied) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: AlertDialogIcon(
            iconData: Icons.not_listed_location_outlined,
            iconColor: kSecondaryColor,
          ),
          backgroundColor: kBackgroundColor,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(color: kPrimaryColor.withOpacity(.5)),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Ok",
                style: TextStyle(
                  color: kSecondaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
          content: Text(
            "Please grant the app permission to access your location.",
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
          icon: AlertDialogIcon(
            iconData: Icons.location_disabled,
            iconColor: Colors.red[600]!,
          ),
          backgroundColor: kBackgroundColor,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text(
                "Ok",
                style: TextStyle(color: kPrimaryColor),
              ),
            ),
          ],
          content: Text(
            "Location Permissions Are Denied Forever.",
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

  if (state is DetermineDetailsOfLatLngSuccess) {
    bool? addressSaved;
    if (context.mounted) {
      addressSaved = await Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return AddAddressScreen();
        },
      ));
    }
    if (context.mounted) {
      Navigator.pop(context, addressSaved);
    }
  }
  if (state is DetermineDetailsOfLatLngFailure) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
          text: state.message, backgroundColor: Colors.red[600]!));
      Navigator.pop(context);
    }
  }
}
