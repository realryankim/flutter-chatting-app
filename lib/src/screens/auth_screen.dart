import 'package:flutter/material.dart';
import 'package:flutter_chatting_app/src/widgets/auth/auth_form.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Get.focusScope!.unfocus();
        },
        child: AuthForm(),
      ),
    );
  }
}
