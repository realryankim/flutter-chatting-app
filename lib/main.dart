import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatting_app/src/app.dart';
import 'package:flutter_chatting_app/src/bindings/binding.dart';
import 'package:flutter_chatting_app/src/utils/colors.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Chatting App',
      theme: ThemeData(
        primaryColor: ColorsCH.primary,
        backgroundColor: ColorsCH.primary,
        colorScheme:
            ColorScheme.fromSwatch(primaryColorDark: Colors.blue).copyWith(
          primary: ColorsCH.primary,
          secondary: ColorsCH.primary,
        ),
        appBarTheme: AppBarTheme(
          color: ColorsCH.primary,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: ColorsCH.primary,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      initialBinding: Binding(),
      home: App(),
    );
  }
}
