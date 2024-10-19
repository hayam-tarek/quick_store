import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/view_models/addresses_cubit/addresses_cubit.dart';
import 'package:quick_store/view_models/location_services_cubit/location_services_cubit.dart';
import 'package:quick_store/views/widgets/add_address_button.dart';
import 'package:quick_store/views/widgets/address_sheet.dart';
import 'package:quick_store/views/widgets/custom_material_button.dart';
import 'package:quick_store/views/widgets/custom_simple_app_bar.dart';
import 'package:quick_store/views/widgets/custom_snake_bar.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool absorbing = true;
  @override
  Widget build(BuildContext context) {
    LocationServicesCubit cubit =
        BlocProvider.of<LocationServicesCubit>(context);
    TextEditingController nameController =
        TextEditingController(text: cubit.name);
    TextEditingController cityController =
        TextEditingController(text: cubit.city);
    TextEditingController regionController =
        TextEditingController(text: cubit.region);
    TextEditingController detailsController =
        TextEditingController(text: cubit.details);
    TextEditingController notesController = TextEditingController();
    return BlocProvider(
      create: (context) => AddressesCubit(),
      child: Scaffold(
        appBar:
            customSimpleAppBar(context: context, title: "Complete the details"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              AbsorbPointer(
                absorbing: absorbing,
                child: AddressSheet(
                  enableEditing: !absorbing,
                  cubit: cubit,
                  formKey: formKey,
                  nameController: nameController,
                  cityController: cityController,
                  regionController: regionController,
                  detailsController: detailsController,
                  notesController: notesController,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomMaterialButton(
                      color: kPrimaryColor,
                      text: "Edit",
                      onPressed: () {
                        setState(() {
                          absorbing = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          customSnackBar(text: "You can edit now"),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: AddAddressButton(
                      formKey: formKey,
                      nameController: nameController,
                      cityController: cityController,
                      regionController: regionController,
                      detailsController: detailsController,
                      notesController: notesController,
                      latitude: cubit.latitude!,
                      longitude: cubit.longitude!,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
