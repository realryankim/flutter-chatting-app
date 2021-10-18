import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  String _enteredMessage = '';
  String get enteredMessage => _enteredMessage;
  final _textController = TextEditingController();
  get textController => _textController;

  void enterMessage(String value) {
    _enteredMessage = value;
  }

  void sendMessage() {
    Get.focusScope!.unfocus();
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('chat').add({
      'text': _enteredMessage,
      'createdAt': Timestamp.now(),
      'userId': user!.uid,
    });
    textController.clear();
  }
}
