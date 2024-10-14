import 'package:flutter/material.dart';
import 'package:quick_store/view_models/location_services_cubit/location_services_cubit.dart';
import 'package:quick_store/views/widgets/custom_text_florm_field.dart';

class AddressSheet extends StatelessWidget {
  const AddressSheet({
    super.key,
    required this.cubit,
    required this.formKey,
    this.nameController,
    this.cityController,
    this.regionController,
    this.detailsController,
    this.notesController,
    this.enableEditing,
  });
  final LocationServicesCubit cubit;
  final GlobalKey<FormState> formKey;
  final TextEditingController? nameController;
  final TextEditingController? cityController;
  final TextEditingController? regionController;
  final TextEditingController? detailsController;
  final TextEditingController? notesController;
  final bool? enableEditing;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomTextFormField(
            isEnabled: false,
            controller: nameController,
            labelText: 'Name',
            validatorText: "Field empty",
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  isEnabled: false,
                  controller: cityController,
                  labelText: 'City',
                  validatorText: "Field empty",
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: CustomTextFormField(
                  isEnabled: false,
                  controller: regionController,
                  labelText: 'Region',
                  validatorText: "Field empty",
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            isEnabled: enableEditing,
            controller: detailsController,
            labelText: 'Details',
            validatorText: "Field empty",
            minLines: 1,
            maxLines: 3,
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            controller: notesController,
            labelText: 'Notes',
            minLines: 4,
            maxLines: 4,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
