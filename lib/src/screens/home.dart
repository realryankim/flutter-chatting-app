import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatting_app/src/screens/auth_screen.dart';
import 'package:flutter_chatting_app/src/screens/chat_screen.dart';
import 'package:flutter_chatting_app/src/screens/splash_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        // 데이터를 다 받기 전까지 SplashScreen 페이지가 보여지도록
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen();
        }
        if (snapshot.hasData) {
          return ChatScreen();
        }
        return AuthScreen();
      },
    );
  }
}
