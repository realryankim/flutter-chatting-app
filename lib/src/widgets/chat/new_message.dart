import 'package:flutter/material.dart';
import 'package:flutter_chatting_app/src/controllers/chat_controller.dart';
import 'package:get/get.dart';

class NewMessage extends GetView<ChatController> {
  const NewMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(labelText: 'Send a message...'),
              onChanged: (value) {
                controller.enterMessage(value);
              },
            ),
          ),
          IconButton(
            color: Theme.of(context).primaryColor,
            icon: Icon(Icons.send),
            onPressed: () {
              // message가 없으면 버튼을 disable 아니면, 함수를 실행
              controller.enteredMessage.trim().isEmpty
                  ? null
                  : controller.sendMessage();
            },
          )
        ],
      ),
    );
  }
}
