import 'package:e_commerce_app/helper/constant.dart';
import 'package:e_commerce_app/models/user_data_model.dart';
import 'package:e_commerce_app/modules/widgets/display_item.dart';
import 'package:e_commerce_app/modules/widgets/tapped_card.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
    required this.userDataModel,
  });
  final UserDataModel userDataModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        CircleAvatar(
          radius: 100,
          backgroundColor: kSecondaryColor,
          backgroundImage: NetworkImage(
            userDataModel.image,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          userDataModel.name,
          style: const TextStyle(
            fontSize: 50,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: kPrimaryFont,
          ),
        ),
        const SizedBox(height: 10),
        DisplayItem(
          title: userDataModel.email,
          iconData: Icons.email_rounded,
        ),
        const SizedBox(height: 10),
        DisplayItem(
          title: userDataModel.phone,
          iconData: Icons.phone_rounded,
        ),
        const Divider(
          indent: 50,
          endIndent: 50,
          height: 25,
        ),
        TappedCard(
          title: 'Update data',
          iconData: Icons.person,
          onTap: () {},
        ),
        TappedCard(
          title: 'Orders',
          iconData: Icons.shopping_basket_rounded,
          onTap: () {},
        ),
        TappedCard(
          title: 'Log out',
          iconData: Icons.logout_rounded,
          onTap: () {},
        ),
      ],
    );
  }
}
