import 'package:flutter/material.dart';
import 'package:fyp_feas/All_Constants/buttons.dart';
import 'package:fyp_feas/All_Constants/textfield.dart';
import 'package:fyp_feas/All_Constants/utilis.dart';
import 'package:fyp_feas/All_Screens/Dashboard/home_screen.dart';
import 'package:fyp_feas/All_Screens/UserAuth/signup_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../All_Constants/colors.dart';
import '../../All_Constants/components.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final pass =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: Colors.white,


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              Center(child: Text("F E A S", style: TextStyle(
                  fontSize: 40, fontWeight: FontWeight.w900,fontStyle: FontStyle.italic,
                  color: primarycolor.withOpacity(0.8)
              ),)),

              SizedBox(height: MediaQuery.of(context).size.height*0.06,),

             Text("Login to your Account", style: TextStyle(
               color: Colors.black, fontSize: 45, fontWeight: FontWeight.w600
             ),),
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),



              Center(
                child: CustomEditField(
                    width:350,
                    height: 50,
                    hintText: "Email",
                    controller: email,
                    image: "assets/icons/mail.png",
                    borderwidth: 2,
                  bordercolor: Color(0xff4193B9),
                  hintextcolor: Color(0xff7E8389) ,
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.04,),


              Center(
                child: CustomPassField(
                  width:350,
                  height: 50,
                  hintText: "Password",
                  controller: pass,
                  signupController: SignUpController(),
                  img: "assets/icons/lock.png",
                  hinttextcolor: Color(0xff7E8389),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.06,),


              Center(
                child: CustomButton(
                    height: 50,
                    width: 200,
                    text: "Login",
                    color: primarycolor,
                    fontsize: 20,
                    onPressed: (){Get.to(()=>AnimatedBarExample());},
                    textcolor: Colors.black,
                    fontweight: FontWeight.w600
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.1,),




              SizedBox(height: MediaQuery.of(context).size.height*0.13,),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text("Don't have an account yet?", style: TextStyle(
                    color: Colors.black
                  ),),
                  TextButton(
                      onPressed: (){Get.to(()=>SignUpScreen());},
                      child:Text("Sign Up", style: TextStyle(
                        color: secondarycolor
                      ),)
                  )
                ],
              )









            ],
          ),
        ),
      ),


    );
  }
}
