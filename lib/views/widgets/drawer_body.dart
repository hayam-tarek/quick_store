import 'package:flutter/material.dart';
import 'package:quick_store/views/widgets/custom_drawer_header.dart';
import 'package:quick_store/views/widgets/log_out_button.dart';
import 'package:quick_store/views/widgets/tapped_card.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDrawerHeader(),
        //TODO handle this tapped cards
        TappedCard(title: 'Notification', iconData: Icons.notifications),
        Divider(endIndent: 50, indent: 10),
        TappedCard(title: 'Contacts', iconData: Icons.contacts),
        Divider(endIndent: 50, indent: 10),
        TappedCard(title: 'Complaints', iconData: Icons.add_comment),
        Divider(endIndent: 50, indent: 10),
        TappedCard(title: 'FAQs', iconData: Icons.question_mark),
        Divider(endIndent: 50, indent: 10),
        TappedCard(title: 'Setting', iconData: Icons.settings),
        Divider(endIndent: 50, indent: 10),
        LogOutButton(),
      ],
    );
  }
}
