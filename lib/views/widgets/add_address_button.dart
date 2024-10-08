import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/view_models/addresses_cubit/addresses_cubit.dart';
import 'package:quick_store/views/widgets/custom_material_button.dart';
import 'package:quick_store/views/widgets/custom_snake_bar.dart';

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.cityController,
    required this.regionController,
    required this.detailsController,
    required this.notesController,
    required this.currentPosition,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController cityController;
  final TextEditingController regionController;
  final TextEditingController detailsController;
  final TextEditingController notesController;
  final Position currentPosition;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressesCubit, AddressesState>(
      listener: (context, state) {
        if (state is AddAddressFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(customSnackBar(text: state.message));
        }
        if (state is AddAddressSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(customSnackBar(text: state.message));
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return CustomMaterialButton(
          color: kPrimaryColor,
          text: state is AddAddressLoading ? "Loading..." : "Save",
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              BlocProvider.of<AddressesCubit>(context).addAddress(
                  name: nameController.text,
                  city: cityController.text,
                  region: regionController.text,
                  details: detailsController.text,
                  notes: notesController.text,
                  lat: "${currentPosition.altitude}",
                  lng: "${currentPosition.longitude}");
              //Navigator.pop(context);
            }
          },
        );
      },
    );
  }
}
