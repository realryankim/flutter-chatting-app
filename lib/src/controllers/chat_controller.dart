import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  String _enteredMessage = '';
  String get enteredMessage => _enteredMessage;

  void enterMessage(String value) {
    _enteredMessage = value;
  }

  void sendMessage() {
    Get.focusScope!.unfocus();
    FirebaseFirestore.instance.collection('chat').add({
      'text': _enteredMessage,
    });
  }
}
