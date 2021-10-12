import 'package:flutter/material.dart';
import 'package:flutter_chatting_app/controllers/auth_controller.dart';

import 'package:get/get.dart';

class AuthForm extends GetView<AuthController> {
  // AuthForm(this.submitFn, {Key? key}) : super(key: key);

  // property from AuthScreen
  // () 안에는 얻거나, 저장할 arguments(또는 parameters)
  // submitFn: property name
  // final void Function(
  //   String email,
  //   String password,
  //   String userName,
  //   bool isLogin,
  // ) submitFn;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: controller.getFormKey(),
              child: Obx(
                () => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      key: ValueKey('email'),
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
                    if (!controller.isLogin.value)
                      TextFormField(
                        key: ValueKey('username'),
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
                        child:
                            Text(controller.isLogin.value ? 'Login' : 'Signup'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          primary: Colors.pink,
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {
                          controller.trySubmit();
                        },
                      ),
                    if (!controller.isLoading.value)
                      TextButton(
                        child: Text(controller.isLogin.value
                            ? 'Create new account'
                            : 'I already have an account'),
                        style: TextButton.styleFrom(
                          primary: Colors.pink,
                        ),
                        onPressed: () {
                          controller.toggleLoginButton();
                        },
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
