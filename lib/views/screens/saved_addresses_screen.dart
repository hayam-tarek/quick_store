import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/models/address_model.dart';
import 'package:quick_store/view_models/addresses_cubit/addresses_cubit.dart';
import 'package:quick_store/views/widgets/custom_simple_app_bar.dart';
import 'package:quick_store/views/widgets/saved_addresses_body.dart';

class SavedAddressesScreen extends StatelessWidget {
  const SavedAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customSimpleAppBar(context: context, title: "Saved Addresses"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocBuilder<AddressesCubit, AddressesState>(
          builder: (context, state) {
            List<AddressModel> addresses =
                BlocProvider.of<AddressesCubit>(context).addresses;
            return CustomScrollView(
              slivers: [
                if (state is GetAddressesLoading)
                  SliverToBoxAdapter(
                    child: LinearProgressIndicator(
                      color: kSecondaryColor,
                      backgroundColor: kSecondaryColor.withOpacity(.5),
                    ),
                  ),
                if (state is GetAddressesFailure || addresses.isEmpty)
                  SliverFillRemaining(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          kSavedLocationPath,
                          scale: 5,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "You haven't saved any addresses yet.",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  SavedAddressesBody(addresses: addresses)
              ],
            );
          },
        ),
      ),
    );
  }
}
