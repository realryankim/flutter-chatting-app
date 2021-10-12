import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;

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

  void submitAuthForm(
    String email,
    String password,
    String username,
    bool isLogin,
  ) async {
    UserCredential userCredential;
    try {
      if (isLogin) {
        userCredential = await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        userCredential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      }
    } on PlatformException catch (error) {
      var message = 'An error occurred, please check your credentials';

      if (error.message != null) {
        message = error.message!;
      }

      Get.snackbar(
        "error",
        message,
        colorText: Colors.red,
      );
    } catch (error) {
      print(error);
    }
  }
}
