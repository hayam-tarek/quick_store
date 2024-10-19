import 'package:flutter/material.dart';
import 'package:quick_store/models/address_model.dart';

class SavedAddressesBody extends StatelessWidget {
  const SavedAddressesBody({
    super.key,
    required this.addresses,
  });

  final List<AddressModel> addresses;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: addresses.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(addresses[index].id.toString()),
          // onDismissed: (direction) {
          //   BlocProvider.of<AddressesCubit>(context)
          //       .deleteAddress(addresses[index].id!);
          // },
          child: Card(
            child: ExpansionTile(
              leading: const Icon(Icons.my_location),
              title: Text(addresses[index].name),
              children: [
                ListTile(
                  leading: Icon(Icons.location_city),
                  title: Text(
                    addresses[index].city,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.map),
                  title: Text(
                    addresses[index].region,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.details),
                  title: Text(
                    addresses[index].details,
                  ),
                ),
                if (addresses[index].notes != null)
                  ListTile(
                    leading: Icon(Icons.notes),
                    title: Text(
                      '${addresses[index].notes}',
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
