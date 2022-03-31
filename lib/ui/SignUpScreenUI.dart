import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_ui_practical/ui/SignInScreenUI.dart';
import 'package:shopping_ui_practical/utils/AppString.dart';
import 'package:shopping_ui_practical/widgets/RoundedButton.dart';

class SignUpScreenUI extends StatefulWidget {
  const SignUpScreenUI({Key? key}) : super(key: key);

  @override
  _SignUpScreenUIState createState() => _SignUpScreenUIState();
}

class _SignUpScreenUIState extends State<SignUpScreenUI> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [


                Image.asset(AppString.imagePath +"ic_main_logo.jpg",),
                SizedBox(height: 10,),

                Text("SIGN UP",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),


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

                SizedBox(height: 20,),

                TextFormField(
                  controller: confirmPasswordController,
                  decoration: const InputDecoration(
                      hintText: "ConfirmPassword",
                      prefixIcon: Icon(Icons.vpn_key_sharp)
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Please Enter Password";
                    }
                  },
                ),



                SizedBox(height: 20,),

                RoundedButton(
                  text: "Sign Up",
                  height: 45,
                  width: Get.width/2.5,
                  onTap: () {

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
                        Get.to(()=> SignInScreenUI());
                      },
                      child: Container(
                          child: Text("Sign In",style: TextStyle(
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
