import 'package:flutter/material.dart';
import 'package:quick_store/models/user_data_model.dart';
import 'package:quick_store/views/widgets/custom_circle_avatar.dart';
import 'package:quick_store/views/widgets/display_contact.dart';
import 'package:quick_store/views/widgets/title_text.dart';

class UserData extends StatelessWidget {
  const UserData({
    super.key,
    required this.userDataModel,
  });

  final UserDataModel userDataModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCircleAvatar(networkImageUrl: userDataModel.image),
        const SizedBox(height: 20),
        TitleText(text: userDataModel.name),
        const SizedBox(height: 10),
        DisplayContact(
          title: userDataModel.email,
          iconData: Icons.email_rounded,
        ),
        const SizedBox(height: 5),
        DisplayContact(
          title: userDataModel.phone,
          iconData: Icons.phone_rounded,
        ),
        const SizedBox(height: 5),
        DisplayContact(
          title: '\$${userDataModel.credit.toStringAsFixed(2)}',
          iconData: Icons.credit_card,
        ),
        const SizedBox(height: 5),
        DisplayContact(
          title: '${userDataModel.points.toStringAsFixed(2)} point.',
          iconData: Icons.loyalty,
        ),
      ],
    );
  }
}
