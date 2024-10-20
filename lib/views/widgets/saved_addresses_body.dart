import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/models/address_model.dart';
import 'package:quick_store/view_models/addresses_cubit/addresses_cubit.dart';
import 'package:quick_store/views/widgets/address_details_card.dart';
import 'package:quick_store/views/widgets/custom_snake_bar.dart';
import 'package:quick_store/views/widgets/delete_address_dialog.dart';
import 'package:quick_store/views/widgets/dismissible_to_delete_item.dart';

class SavedAddressesBody extends StatelessWidget {
  const SavedAddressesBody({
    super.key,
    required this.addresses,
  });

  final List<AddressModel> addresses;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressesCubit, AddressesState>(
      listener: (context, state) {
        if (state is DeleteAddressFailure) {
          ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
              text: state.message, backgroundColor: Colors.red[600]!));
        }
        if (state is DeleteAddressSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
              text: state.message, backgroundColor: Colors.green));
        }
      },
      builder: (context, state) {
        return SliverList.builder(
          itemCount: addresses.length,
          itemBuilder: (context, index) {
            return DismissibleToDeleteItem(
              uniqueKeyValue: addresses[index].id.toString(),
              confirmDismiss: (direction) async {
                return await deleteAddressDialog(context);
              },
              onDismissed: (direction) {
                BlocProvider.of<AddressesCubit>(context)
                    .deleteAddress(id: addresses[index].id);
                addresses.removeAt(index);
              },
              child: AddressDetailsCard(address: addresses[index]),
            );
          },
        );
      },
    );
  }
}
