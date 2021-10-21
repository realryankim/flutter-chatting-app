import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  File? pickedImageFile;

  @override
  void onInit() {
    super.onInit();
  }

  void _pickImage() async {
    final picker = ImagePicker();
    // final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickImage != null) {
      pickedImageFile = File(pickedImage!.path);
    }

    update();
  }

  void Function() get pickImage => _pickImage;
}
