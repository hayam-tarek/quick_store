import 'dart:convert';

import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  static Future<XFile?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  static Future<String?> convertToBase64Image({required XFile image}) async {
    final imageBytes = await image.readAsBytes();
    final base64Image = base64Encode(imageBytes);
    return base64Image;
  }
}
