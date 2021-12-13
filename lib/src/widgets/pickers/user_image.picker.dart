import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_chatting_app/src/utils/colors.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker({Key? key, required this.imagePickFn}) : super(key: key);

  final void Function(File pickedImage) imagePickFn;

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImageFile;

  void _selectImage() async {
    final picker = ImagePicker();
    final selectedImage = await picker.pickImage(source: ImageSource.gallery);
    if (selectedImage == null) return null;
    // TODO: Select Image and save
  }

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );
    setState(() {
      if (pickedImage != null) {
        _pickedImageFile = File(pickedImage.path);
        // print('File path');
      } else {
        // print('No image selected.');
      }
      widget.imagePickFn(_pickedImageFile!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage:
              _pickedImageFile != null ? FileImage(_pickedImageFile!) : null,
        ),
        TextButton.icon(
          onPressed: _pickImage,
          icon: const Icon(Icons.image, color: ColorsCH.primary),
          label: const Text('Add Image',
              style: TextStyle(color: ColorsCH.primary)),
        ),
      ],
    );
  }
}
