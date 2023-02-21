import 'package:flutter/material.dart';
import 'package:fyp_feas/All_Constants/buttons.dart';
import 'package:fyp_feas/All_Screens/UserAuth/login_screen.dart';
import 'package:fyp_feas/All_Screens/UserAuth/signup_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../All_Constants/colors.dart';


class UserAuthentication extends StatefulWidget {
  const UserAuthentication({Key? key}) : super(key: key);

  @override
  State<UserAuthentication> createState() => _UserAuthenticationState();
}

class _UserAuthenticationState extends State<UserAuthentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.1,),
          Center(child: Text("FEAS", style: TextStyle(
            fontSize: 40,
            color: Colors.black
          ),)),
          
          Image.asset("assets/icons/logo.png"),
          SizedBox(height: MediaQuery.of(context).size.height*0.04,),


          CustomButton(
              height: 50,
              width: 200,
              text: "Login",
              color: primarycolor,
              fontsize: 20,
              onPressed: (){Get.to(()=>LoginScreen());},
              textcolor: Colors.black,
              fontweight: FontWeight.w600
          ),

          SizedBox(height: MediaQuery.of(context).size.height*0.03,),


          CustomButton(
              height: 50,
              width: 200,
              text: "Sign Up",
              color: secondarycolor,
              fontsize: 20,
              onPressed: (){Get.to(()=>SignUpScreen());},
              textcolor: Colors.black,
              fontweight: FontWeight.w600
          ),


          
        ],
      ),
      
      
    );
  }
}
