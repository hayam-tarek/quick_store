import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/view_models/profile_cubit/profile_cubit.dart';
import 'package:quick_store/views/widgets/alert_dialog_icon.dart';
import 'package:quick_store/views/widgets/custom_password_text_form_field.dart';
import 'package:quick_store/views/widgets/custom_snake_bar.dart';

class PasswordDialog extends StatelessWidget {
  PasswordDialog({
    super.key,
  });

  final TextEditingController? oldPasswordController = TextEditingController();
  final TextEditingController? newPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: AlertDialogIcon(
        iconData: Icons.security,
        iconColor: kSecondaryColor,
      ),
      backgroundColor: kBackgroundColor,
      title: const Text('Change password'),
      titleTextStyle: const TextStyle(
        color: kPrimaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
        BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ChangePasswordSuccess) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                customSnackBar(
                    text: state.message, backgroundColor: Colors.green),
              );
            }
            if (state is ChangePasswordFailure) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                customSnackBar(
                  text: state.message,
                  backgroundColor: Colors.red[600]!,
                  showCloseIcon: true,
                ),
              );
            }
          },
          builder: (context, state) {
            return TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();

                  BlocProvider.of<ProfileCubit>(context).changePassword(
                    oldPassword: oldPasswordController!.text.trim(),
                    newPassword: newPasswordController!.text.trim(),
                  );
                }
              },
              child: (state is ChangePasswordLoading)
                  ? const Text(
                      'Loading...',
                      style: TextStyle(color: kSecondaryColor),
                    )
                  : const Text(
                      'Save',
                      style: TextStyle(color: kPrimaryColor),
                    ),
            );
          },
        ),
        const SizedBox(height: 10),
      ],
      content: IntrinsicHeight(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomPasswordTextFormField(
                  labelText: 'Old password',
                  passwordController: oldPasswordController,
                ),
                const SizedBox(height: 10),
                CustomPasswordTextFormField(
                  labelText: 'New password',
                  passwordController: newPasswordController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
