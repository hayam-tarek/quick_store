import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/models/user_data_model.dart';
import 'package:quick_store/view_models/auth_cubit/auth_cubit.dart';
import 'package:quick_store/view_models/orders_cubit/orders_cubit.dart';
import 'package:quick_store/views/screens/location_screen.dart';
import 'package:quick_store/views/screens/orders_screen.dart';
import 'package:quick_store/views/screens/update_profile_screen.dart';
import 'package:quick_store/views/screens/welcome_screen.dart';
import 'package:quick_store/views/widgets/custom_circle_avatar.dart';
import 'package:quick_store/views/widgets/custom_snake_bar.dart';
import 'package:quick_store/views/widgets/display_contact.dart';
import 'package:quick_store/views/widgets/password_dialog.dart';
import 'package:quick_store/views/widgets/tapped_card.dart';
import 'package:quick_store/views/widgets/title_text.dart';

//TODO refactor
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
          const SizedBox(height: 5),
          DisplayContact(
            title: userDataModel.phone,
            iconData: Icons.phone_rounded,
          ),
          const SizedBox(height: 5),
          DisplayContact(
            title: '\$${userDataModel.credit.floor().toString()}',
            iconData: Icons.credit_card,
          ),
          const SizedBox(height: 5),
          DisplayContact(
            title: '${userDataModel.points.floor().toString()} point.',
            iconData: Icons.loyalty,
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
            title: 'Location',
            iconData: Icons.location_history,
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
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is LogoutSuccessState) {
                // ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
                //     text: state.message, backgroundColor: Colors.green));
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomeScreen(),
                  ),
                  ModalRoute.withName('/'),
                );
              }
              if (state is LogoutFailureState) {
                ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
                    text: state.error, backgroundColor: Colors.red[600]!));
              }
            },
            builder: (context, state) {
              return TappedCard(
                title: state is LogoutLoadingState ? "Loading..." : 'Log out',
                iconData: Icons.logout_rounded,
                onTap: () {
                  context.read<AuthCubit>().logout();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
