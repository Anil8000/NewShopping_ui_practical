import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_ui_practical/ui/DashboardScreenUI.dart';
import 'package:shopping_ui_practical/utils/AppString.dart';
import 'package:shopping_ui_practical/widgets/RoundedButton.dart';

import 'SignUpScreenUI.dart';

class SignInScreenUI extends StatefulWidget {
  const SignInScreenUI({Key? key}) : super(key: key);

  @override
  _SignInScreenUIState createState() => _SignInScreenUIState();
}

class _SignInScreenUIState extends State<SignInScreenUI> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [


                Image.asset(AppString.imagePath +"ic_main_logo.jpg",),
                SizedBox(height: 10,),

                Text("SIGN IN",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),


                SizedBox(height: 20,),


                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Email ID",
                    prefixIcon: Icon(Icons.account_circle_sharp),
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Please Enter Email";
                    }
                  },
                ),

                SizedBox(height: 20,),

                TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: "Password",
                        prefixIcon: Icon(Icons.vpn_key_sharp)
                    ),
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Please Enter Password";
                      }
                    },
                ),


                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: (){

                    },
                    child: Container(
                        margin: EdgeInsets.only(top:18.0),
                        child: const Text("Forgot Password?",style: TextStyle(
                            color: Colors.black,fontSize: 16
                        ),
                        )),
                  ),
                ),


                SizedBox(height: 20,),

                RoundedButton(
                  text: "Sign In",
                  height: 45,
                  width: Get.width/2.5,
                  onTap: () {

                    Get.to(()=> DashboardScreenUI());

                  },
                ),

                SizedBox(
                  height: 30,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        child: const Text('Already have an Account? ',style: TextStyle(
                            color: Colors.black,fontSize: 16
                        ),
                        )),
                    SizedBox(width: 4.0,),
                    InkWell(
                      onTap: (){
                        Get.to(()=> SignUpScreenUI());
                      },
                      child: Container(
                          child: Text("Sign Up",style: TextStyle(
                              color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold
                          ),
                          )),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
