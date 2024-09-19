import 'package:flutter/material.dart';
import 'package:quick_store/core/services/local_storage.dart';
import 'package:quick_store/models/user_data_model.dart';
import 'package:quick_store/views/screens/update_profile_screen.dart';
import 'package:quick_store/views/widgets/custom_circle_avatar.dart';
import 'package:quick_store/views/widgets/display_contact.dart';
import 'package:quick_store/views/widgets/password_dialog.dart';
import 'package:quick_store/views/widgets/tapped_card.dart';
import 'package:quick_store/views/widgets/title_text.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
    required this.userDataModel,
  });
  final UserDataModel userDataModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          CustomCircleAvatar(
            networkImageUrl: userDataModel.image,
          ),
          const SizedBox(height: 20),
          TitleText(text: userDataModel.name),
          const SizedBox(height: 10),
          DisplayContact(
            title: userDataModel.email,
            iconData: Icons.email_rounded,
          ),
          const SizedBox(height: 10),
          DisplayContact(
            title: userDataModel.phone,
            iconData: Icons.phone_rounded,
          ),
          const Divider(
            indent: 50,
            endIndent: 50,
            height: 25,
          ),
          TappedCard(
            title: 'Update profile',
            iconData: Icons.person,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateProfileScreen(
                      userDataModel: userDataModel,
                    ),
                  ));
            },
          ),
          TappedCard(
            title: 'Change password',
            iconData: Icons.password,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return PasswordDialog();
                },
              );
            },
          ),
          TappedCard(
            title: 'Orders',
            iconData: Icons.shopping_basket_rounded,
            onTap: () {
              // TODO: orders
            },
          ),
          TappedCard(
            title: 'Log out',
            iconData: Icons.logout_rounded,
            onTap: () {
              // TODO: log out
            },
          ),
          OutlinedButton(
              onPressed: () {
                LocalData().removeFromCache(key: 'token');
              },
              child: const Text('remove token'))
        ],
      ),
    );
  }
}
