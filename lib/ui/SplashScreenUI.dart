import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_ui_practical/utils/AppString.dart';

import 'SignInScreenUI.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({Key? key}) : super(key: key);

  @override
  _SplashScreenUIState createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5,),(){

      Get.off(()=> SignInScreenUI(),);

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppString.imagePath +"ic_main_logo.jpg",),

            SizedBox(height: 10,),

            Text("Croma Shopping",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),


          ],
        ),
      ),
    );
  }
}
