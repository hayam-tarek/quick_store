import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_store/views/widgets/circle_avatar_decoration.dart';

class CustomPickCircleAvatar extends StatelessWidget {
  const CustomPickCircleAvatar({
    super.key,
    required this.defaultNetworkImageUrl,
    required this.pickedImage,
  });

  final String defaultNetworkImageUrl;
  final XFile? pickedImage;

  @override
  Widget build(BuildContext context) {
    return CircleAvatarDecoration(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 50,
          backgroundImage: pickedImage != null
              ? FileImage(File(pickedImage!.path))
              : NetworkImage(
                  defaultNetworkImageUrl,
                ),
        ),
      ),
    );
  }
}
