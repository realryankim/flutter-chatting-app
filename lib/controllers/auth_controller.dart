import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final _formKey = GlobalKey<FormState>();
  RxBool isLogin = true.obs;
  String userEmail = '';
  String userName = '';
  String userPassword = '';

  GlobalKey<FormState> getFormKey() {
    return _formKey;
  }

  String? emailValidator(String? value) {
    if (value!.isEmpty || !value.contains('@')) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? userNameValidator(String value) {
    if (value.isEmpty || value.length < 4) {
      return 'Password must be at least 4 characters long.';
    }
    return null;
  }

  String? passwordValidator(String value) {
    if (value.isEmpty || value.length < 7) {
      return 'Password must be at least 7 characters long.';
    }
    return null;
  }

  void trySubmit() {
    final isValid = _formKey.currentState!.validate();
    Get.focusScope!.unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      print(userEmail);
      print(userName);
      print(userPassword);

      // User those values to send our auth request ...
    }
  }

  void toggleLoginButton() {
    isLogin(!isLogin.value);
  }
}
