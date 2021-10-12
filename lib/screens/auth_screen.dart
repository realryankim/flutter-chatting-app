import 'package:flutter/material.dart';
import 'package:flutter_chatting_app/controllers/auth_controller.dart';

import 'package:flutter_chatting_app/widgets/auth/auth_form.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Get.focusScope!.unfocus();
        },
        child: AuthForm(authController.submitAuthForm),
      ),
    );
  }
}
