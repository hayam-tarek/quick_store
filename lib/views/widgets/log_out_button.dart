import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/view_models/auth_cubit/auth_cubit.dart';
import 'package:quick_store/views/screens/welcome_screen.dart';
import 'package:quick_store/views/widgets/custom_snake_bar.dart';
import 'package:quick_store/views/widgets/tapped_card.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LogoutSuccessState) {
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
    );
  }
}
