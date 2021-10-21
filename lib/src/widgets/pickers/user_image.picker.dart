import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_chatting_app/src/controllers/image_picker_controller.dart';
import 'package:get/get.dart';

class UserImagePicker extends GetView<ImagePickerController> {
  UserImagePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          // issue: 이미지를 찍고, 코드를 저장해야 이미지가 보임
          backgroundImage: controller.pickedImageFile != null
              ? FileImage(controller.pickedImageFile as File)
              : null,
        ),
        TextButton.icon(
          onPressed: controller.pickImage,
          icon: Icon(Icons.image),
          label: Text('Add Image'),
        ),
      ],
    );
  }
}
