import 'dart:io';
import 'package:flutter_chatting_app/src/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// Do not ImagePickerController for now
// issue: can't save userImageFile path with ImagePickerController
class ImagePickerController extends GetxController {
  static ImagePickerController get to => ImagePickerController();

  File? pickedImageFile;

  void pickImage() async {
    final picker = ImagePicker();
    // final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      pickedImageFile = File(pickedImage.path);
      print('File path');
    } else {
      print('No image selected.');
    }

    AuthController.to.pickedImage(pickedImageFile!);

    update();
  }
}
