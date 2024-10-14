import 'package:flutter/material.dart';
import 'package:quick_store/core/utils/constant.dart';

class CancelOrderButton extends StatelessWidget {
  const CancelOrderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              icon: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.red[600]!.withOpacity(.2),
                child: Icon(
                  Icons.warning_amber_rounded,
                  size: 60,
                  color: Colors.red[600],
                ),
              ),
              backgroundColor: kBackgroundColor,
              title: Text("Cancel Order"),
              content: Text("Are you sure you want to cancel this order?"),
              actions: [
                TextButton(
                  onPressed: () {
                    //TODO
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Yes",
                    style: TextStyle(color: kPrimaryColor.withOpacity(.5)),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "No",
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      style: ButtonStyle(
        overlayColor: WidgetStatePropertyAll(
          Colors.red[600]!.withOpacity(.2),
        ),
        foregroundColor: WidgetStatePropertyAll(Colors.red[600]),
      ),
      child: Text("Cancel"),
    );
  }
}
