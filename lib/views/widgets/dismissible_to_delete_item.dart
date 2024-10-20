import 'package:flutter/material.dart';

class DismissibleToDeleteItem extends StatelessWidget {
  const DismissibleToDeleteItem({
    super.key,
    this.onDismissed,
    this.confirmDismiss,
    required this.child,
    required this.uniqueKeyValue,
  });

  final void Function(DismissDirection)? onDismissed;
  final Future<bool?> Function(DismissDirection)? confirmDismiss;
  final Widget child;
  final String uniqueKeyValue;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(uniqueKeyValue),
      direction: DismissDirection.startToEnd,
      background: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.red.withOpacity(.2),
        ),
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.delete_forever,
            color: Colors.red,
            size: 30,
          ),
        ),
      ),
      confirmDismiss: confirmDismiss,
      onDismissed: onDismissed,
      child: child,
    );
  }
}
