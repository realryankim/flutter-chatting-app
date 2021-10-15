import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  final _formKey = GlobalKey<FormState>();
  final RxBool _isLogin = true.obs;
  String _userEmail = '';
  String _userName = '';
  String _userPassword = '';

  // getter를 활용해서 private 변수를 다른 파일에서 사용하자
  GlobalKey<FormState> get formKey => _formKey;
  RxBool get isLogin => _isLogin;
  String get userEmail => _userEmail;
  // property는 getter로 가져오고 setter로 설정한다.
  set userEmail(email) => _userEmail = email;
  String get userName => _userName;
  set userName(username) => _userName = username;
  String get userPassword => _userPassword;
  set userPassword(password) => _userPassword = password;

  final auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;

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

      submitAuthForm(
        userEmail.trim(),
        userPassword.trim(),
        userName.trim(),
        isLogin.value,
      );
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
      isLoading(true);
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

      // set({}) 데이터는 Future을 리턴하기때문에 await 키워드 추가
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'username': username,
        'email': email,
      });
    } on FirebaseAuthException catch (error) {
      var message = 'An error occurred, please check your credentials';

      if (error.message != null) {
        message = error.message!;
      }

      Get.snackbar(
        "An error occurred",
        message,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );

      isLoading(false);
    } catch (error) {
      print(error);
      isLoading(false);
    }
  }
}
