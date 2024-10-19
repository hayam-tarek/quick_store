import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/models/user_data_model.dart';
import 'package:quick_store/view_models/addresses_cubit/addresses_cubit.dart';
import 'package:quick_store/view_models/orders_cubit/orders_cubit.dart';
import 'package:quick_store/views/screens/location_screen.dart';
import 'package:quick_store/views/screens/orders_screen.dart';
import 'package:quick_store/views/screens/saved_addresses_screen.dart';
import 'package:quick_store/views/screens/update_profile_screen.dart';
import 'package:quick_store/views/widgets/log_out_button.dart';
import 'package:quick_store/views/widgets/password_dialog.dart';
import 'package:quick_store/views/widgets/tapped_card.dart';
import 'package:quick_store/views/widgets/user_data.dart';

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
          UserData(userDataModel: userDataModel),
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
                  builder: (context) =>
                      UpdateProfileScreen(userDataModel: userDataModel),
                ),
              );
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
            title: 'Save my location',
            iconData: Icons.my_location,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LocationScreen();
                  },
                ),
              );
            },
          ),
          TappedCard(
            title: 'Addresses history',
            iconData: Icons.location_history,
            onTap: () {
              BlocProvider.of<AddressesCubit>(context).getAddresses();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SavedAddressesScreen();
                  },
                ),
              );
            },
          ),
          TappedCard(
            title: 'Orders',
            iconData: Icons.shopping_basket_rounded,
            onTap: () {
              BlocProvider.of<OrdersCubit>(context).getOrders();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const OrdersScreen();
                  },
                ),
              );
            },
          ),
          LogOutButton(),
        ],
      ),
    );
  }
}
