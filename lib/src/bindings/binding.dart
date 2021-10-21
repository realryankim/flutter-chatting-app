import 'package:flutter_chatting_app/src/controllers/auth_controller.dart';
import 'package:flutter_chatting_app/src/controllers/chat_controller.dart';
import 'package:flutter_chatting_app/src/controllers/image_picker_controller.dart';
import 'package:get/get.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => ChatController());
    Get.lazyPut(() => ImagePickerController());
  }
}
