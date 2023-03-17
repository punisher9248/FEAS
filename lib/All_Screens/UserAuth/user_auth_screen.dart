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


          Center(child: Image.asset("assets/images/feaslogo.png", height: 400,)),
          SizedBox(height: MediaQuery.of(context).size.height*0.15,),


          CustomButton(
              height: 60,
              width:300,
              text: "Login",
              color: primarycolor,
              fontsize: 20,
              onPressed: (){Get.to(()=>LoginScreen());},
              textcolor: Colors.black,
              fontweight: FontWeight.w600
          ),

          SizedBox(height: MediaQuery.of(context).size.height*0.03,),


          CustomButton(
              height: 60,
              width: 300,
              text: "Sign Up",
              color: secondarycolor,
              fontsize: 20,
              onPressed: (){Get.to(()=>SignUpScreen());},
              textcolor: Colors.white,
              fontweight: FontWeight.w600
          ),


          
        ],
      ),
      
      
    );
  }
}
