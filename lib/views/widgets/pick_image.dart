import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_store/core/utils/constant.dart';
import 'package:quick_store/views/widgets/custom_pick_circle_avatar.dart';

class PickImage extends StatelessWidget {
  const PickImage({
    super.key,
    required this.defaultNetworkImageUrl,
    required this.onPick,
    required this.pickedImage,
  });

  final String defaultNetworkImageUrl;
  final void Function()? onPick;
  final XFile? pickedImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPickCircleAvatar(
          defaultNetworkImageUrl: defaultNetworkImageUrl,
          pickedImage: pickedImage,
        ),
        Positioned(
          bottom: 5,
          right: 5,
          child: Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
              onPressed: onPick,
              icon: const Icon(
                Icons.camera_alt_outlined,
                color: kForegroundColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
