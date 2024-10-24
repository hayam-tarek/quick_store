import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/models/user_data_model.dart';
import 'package:quick_store/view_models/profile_cubit/profile_cubit.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    UserDataModel? userDataModel =
        BlocProvider.of<ProfileCubit>(context).userDataModel;
    return DrawerHeader(
      decoration: BoxDecoration(color: kPrimaryColor),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is GetProfileFailure) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(
                  color: kForegroundColor,
                  fontFamily: kPrimaryFont,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            );
          } else if (state is GetProfileLoading) {
            return const Center(
              child: CupertinoActivityIndicator(
                color: kSecondaryColor,
              ),
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Welcome ${userDataModel!.name}',
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
            );
          }
        },
      ),
    );
  }
}
