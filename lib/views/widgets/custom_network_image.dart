import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.src,
  });

  final String src;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
      height: 75,
      width: 75,
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          Icons.broken_image,
          color: Colors.grey,
          size: 60,
        );
      },
      loadingBuilder: (context, widget, imageChunkEvent) {
        if (imageChunkEvent == null) {
          return widget;
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.grey,
              value: imageChunkEvent.expectedTotalBytes != null
                  ? imageChunkEvent.cumulativeBytesLoaded /
                      imageChunkEvent.expectedTotalBytes!
                  : null,
            ),
          );
        }
      },
    );
  }
}
