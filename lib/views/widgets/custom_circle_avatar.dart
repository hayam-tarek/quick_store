import 'package:flutter/material.dart';
import 'package:quick_store/views/widgets/circle_avatar_decoration.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    required this.networkImageUrl,
  });

  final String networkImageUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatarDecoration(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
            networkImageUrl,
          ),
        ),
      ),
    );
  }
}
