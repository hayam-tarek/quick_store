import 'package:flutter/material.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/views/widgets/alert_dialog_icon.dart';

Future<bool?> deleteAddressDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        icon: AlertDialogIcon(
          iconData: Icons.warning_amber_rounded,
          iconColor: Colors.red[600]!,
        ),
        backgroundColor: kBackgroundColor,
        title: Text("Confirm Delete"),
        titleTextStyle: const TextStyle(
          color: kPrimaryColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        content: Text("Are you sure you want to delete this address?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text(
              "Delete",
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text("Cancel"),
          ),
        ],
      );
    },
  );
}
