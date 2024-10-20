import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/models/user_data_model.dart';
import 'package:quick_store/view_models/profile_cubit/profile_cubit.dart';
import 'package:quick_store/views/widgets/log_out_button.dart';
import 'package:quick_store/views/widgets/tapped_card.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    UserDataModel userDataModel =
        BlocProvider.of<ProfileCubit>(context).userDataModel!;
    return Column(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: kPrimaryColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome ${userDataModel.name}!',
                  style: TextStyle(
                    color: kForegroundColor,
                    fontFamily: kPrimaryFont,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: kSecondaryColor,
                    child: CircleAvatar(
                      radius: 32.5,
                      backgroundImage: NetworkImage(userDataModel.image),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
