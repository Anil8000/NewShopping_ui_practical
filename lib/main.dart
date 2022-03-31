import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_ui_practical/ui/SignInScreenUI.dart';

import 'ui/SplashScreenUI.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SplashScreenUI(),
        ),
      ),
    );
  }
}
