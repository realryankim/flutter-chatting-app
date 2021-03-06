import 'package:flutter/material.dart';
import 'package:flutter_chatting_app/src/controllers/auth_controller.dart';
import 'package:flutter_chatting_app/src/utils/colors.dart';
import 'package:flutter_chatting_app/src/widgets/pickers/user_image.picker.dart';

import 'package:get/get.dart';

class AuthForm extends GetView<AuthController> {
  AuthForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: controller.formKey,
              child: Obx(
                () => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!controller.isLogin!.value)
                      UserImagePicker(
                        imagePickFn: controller.pickedImage,
                      ),
                    TextFormField(
                      key: ValueKey('email'),
                      autocorrect: false,
                      textCapitalization: TextCapitalization.none,
                      enableSuggestions: false,
                      validator: (value) {
                        return controller.emailValidator(value!);
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email address',
                      ),
                      onSaved: (value) {
                        controller.userEmail = value!;
                      },
                    ),
                    // Login 모드가 아닐 때만 = SignUp 모드일 때만 보이도록
                    if (!controller.isLogin!.value)
                      TextFormField(
                        key: ValueKey('username'),
                        autocorrect: true,
                        textCapitalization: TextCapitalization.words,
                        enableSuggestions: false,
                        validator: (value) {
                          return controller.userNameValidator(value!);
                        },
                        decoration: InputDecoration(labelText: 'Username'),
                        onSaved: (value) {
                          controller.userName = value!;
                        },
                      ),
                    TextFormField(
                        key: ValueKey('password'),
                        validator: (value) {
                          return controller.passwordValidator(value!);
                        },
                        decoration: InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        onSaved: (value) {
                          controller.userPassword = value!;
                        }),
                    SizedBox(height: 12),
                    if (controller.isLoading.value) CircularProgressIndicator(),
                    if (!controller.isLoading.value)
                      ElevatedButton(
                        child: Text(
                            controller.isLogin!.value ? 'Login' : 'Signup'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          primary: ColorsCH.primary,
                          onPrimary: Colors.white,
                        ),
                        onPressed: controller.trySubmit,
                      ),
                    if (!controller.isLoading.value)
                      TextButton(
                        child: Text(controller.isLogin!.value
                            ? 'Create new account'
                            : 'I already have an account'),
                        style: TextButton.styleFrom(
                          primary: ColorsCH.primary,
                        ),
                        onPressed: controller.handleLoginButton,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
