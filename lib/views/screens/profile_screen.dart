import 'package:e_commerce_app/core/utils/constant.dart';
import 'package:e_commerce_app/models/user_data_model.dart';
import 'package:e_commerce_app/view_models/profile_cubit/profile_cubit.dart';
import 'package:e_commerce_app/views/widgets/profile_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          final UserDataModel? userDataModel =
              BlocProvider.of<ProfileCubit>(context).userDataModel;

          if (state is GetProfileLoading) {
            return const Center(
              child: CupertinoActivityIndicator(
                color: kSecondaryColor,
              ),
            );
          } else if (state is GetProfileFailure) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: ProfileBody(
                userDataModel: userDataModel!,
              ),
            );
          }
        },
      ),
    );
  }
}
