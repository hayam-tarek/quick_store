import 'package:flutter/material.dart';
import 'package:quick_store/models/address_model.dart';

class AddressDetailsCard extends StatelessWidget {
  const AddressDetailsCard({
    super.key,
    required this.address,
  });

  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        leading: const Icon(Icons.my_location),
        title: Text(address.name),
        children: [
          ListTile(
            leading: Icon(Icons.location_city),
            title: Text(
              address.city,
            ),
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text(
              address.region,
            ),
          ),
          ListTile(
            leading: Icon(Icons.details),
            title: Text(
              address.details,
            ),
          ),
          if (address.notes != null)
            ListTile(
              leading: Icon(Icons.notes),
              title: Text(
                '${address.notes}',
              ),
            ),
          ListTile(
            leading: Icon(Icons.delete_forever),
            title: Text(
              "Swipe from left to right to delete",
            ),
          ),
        ],
      ),
    );
  }
}
