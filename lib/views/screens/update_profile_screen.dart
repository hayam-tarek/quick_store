import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/core/utils/pick_image.dart';
import 'package:quick_store/models/user_data_model.dart';
import 'package:quick_store/view_models/profile_cubit/profile_cubit.dart';
import 'package:quick_store/views/widgets/custom_material_button.dart';
import 'package:quick_store/views/widgets/custom_simple_app_bar.dart';
import 'package:quick_store/views/widgets/custom_snake_bar.dart';
import 'package:quick_store/views/widgets/custom_text_florm_field.dart';
import 'package:quick_store/views/widgets/pick_image.dart';

//TODO refactor
class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key, required this.userDataModel});
  final UserDataModel userDataModel;

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();

  String? name;
  String? email;
  String? phone;
  XFile? image;
  String? base64Image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customSimpleAppBar(context: context, title: "Update profile"),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is UpdateProfileSuccess) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
                text: state.message, backgroundColor: Colors.green));
          }
          if (state is UpdateProfileFailure) {
            ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
                text: state.message, backgroundColor: Colors.red[600]!));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: PickImage(
                      pickedImage: image,
                      defaultNetworkImageUrl: widget.userDataModel.image,
                      onPick: () async {
                        image = await ImagePickerHelper.pickImage();
                        if (image != null) {
                          setState(() {});
                          base64Image =
                              await ImagePickerHelper.convertToBase64Image(
                                  image: image!);
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              customSnackBar(text: "Image selected"),
                            );
                          }
                        } else {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              customSnackBar(text: "No image selected"),
                            );
                          }
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 80),
                  CustomTextFormField(
                    labelText: "Name",
                    keyboardType: TextInputType.name,
                    initialValue: widget.userDataModel.name,
                    validatorText: "Please enter your name",
                    onSaved: (value) => name = value,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    labelText: "Email",
                    keyboardType: TextInputType.emailAddress,
                    initialValue: widget.userDataModel.email,
                    validatorText: "Please enter your email",
                    onSaved: (value) => email = value,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    labelText: "Phone",
                    keyboardType: TextInputType.phone,
                    initialValue: widget.userDataModel.phone,
                    validatorText: "Please enter your phone number",
                    onSaved: (value) => phone = value,
                  ),
                  const SizedBox(height: 20),
                  CustomMaterialButton(
                    color: kPrimaryColor,
                    text:
                        state is UpdateProfileLoading ? "Loading..." : "Update",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        BlocProvider.of<ProfileCubit>(context).updateProfile(
                          name: name!,
                          email: email!,
                          phone: phone!,
                          image: base64Image ?? widget.userDataModel.image,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
