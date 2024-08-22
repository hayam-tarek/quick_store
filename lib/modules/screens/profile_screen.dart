import 'package:e_commerce_app/cubits/layout_cubit/layout_cubit.dart';
import 'package:e_commerce_app/helper/constant.dart';
import 'package:e_commerce_app/models/user_data_model.dart';
import 'package:e_commerce_app/modules/widgets/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LayoutCubit()..getProfile(token: '$kToken'),
        child: BlocConsumer<LayoutCubit, LayoutState>(
          listener: (context, state) {},
          builder: (context, state) {
            final UserDataModel? userDataModel =
                BlocProvider.of<LayoutCubit>(context).userDataModel;

            if (state is GetProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: kSecondaryColor,
                ),
              );
            } else if (state is GetProfileSuccess) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: ProfileBody(
                  userDataModel: userDataModel!,
                ),
              );
            } else {
              return Center(
                child: state is GetProfileFailure
                    ? Text(state.message)
                    : const Text("Try again later..."),
              );
            }
          },
        ),
      ),
    );
  }
}
