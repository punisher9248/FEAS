import 'package:flutter/material.dart';
import 'package:fyp_feas/All_Constants/textfield.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../All_Constants/buttons.dart';
import '../../All_Constants/colors.dart';
import 'login_screen.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final fname = TextEditingController();
  final email = TextEditingController();
  final dob = TextEditingController();
  final password = TextEditingController();
  final no = TextEditingController();
  final SignUpController showPass = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Column(
            children: [

              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              Center(child: Text("F E A S", style: TextStyle(
                  fontSize: 40, fontWeight: FontWeight.w900,fontStyle: FontStyle.italic,
                  color: primarycolor.withOpacity(0.8)
              ),)),

              SizedBox(height: MediaQuery.of(context).size.height*0.06,),

              Text("Create your Account", style: TextStyle(
                  color: Colors.black, fontSize: 45, fontWeight: FontWeight.w600
              ),),
              SizedBox(height: MediaQuery.of(context).size.height*0.08,),


              CustomEditField(
                  width: 350,
                  height: 60,
                  hintText: "Full Name",
                  controller: fname,
                  image: 'assets/icons/profileicon.png',
                  borderwidth: 2,
                bordercolor: secondarycolor,
                hintextcolor: Color(0xff7E8389),
                textcolor: Colors.black,
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),


              CustomEditField(
                width: 350,
                height: 60,
                hintText: "Email",
                controller: email,
                image: 'assets/icons/mail.png',
                borderwidth: 2,
                bordercolor: secondarycolor,
                hintextcolor: Color(0xff7E8389),
                textcolor: Colors.black,
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.03,),


              CustomEditField(
                width: 350,
                height: 60,
                hintText: "Date of Birth",
                controller: dob,
                image: 'assets/icons/calendar.png',
                borderwidth: 2,
                bordercolor: secondarycolor,
                hintextcolor: Color(0xff7E8389),
                textcolor: Colors.black,
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.03,),


              CustomEditField(
                width: 350,
                height: 60,
                hintText: "Mobile Number",
                controller: no,
                image: 'assets/icons/number.png',
                borderwidth: 2,
                bordercolor: secondarycolor,
                hintextcolor:Color(0xff7E8389),
                textcolor: Colors.black,
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.03,),


              CustomPassField(
                width:350,
                height: 60,
                hintText: "Password",
                controller: password,
                signupController: SignUpController(),
                img: "assets/icons/lock.png",
                hinttextcolor: Color(0xff7E8389),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.04,),

              Center(
                child: CustomButton(
                    height: 50,
                    width: 200,
                    text: "Sign Up",
                    color: primarycolor,
                    fontsize: 20,
                    onPressed: (){},
                    textcolor: Colors.black,
                    fontweight: FontWeight.w600
                ),
              ),


              SizedBox(height: MediaQuery.of(context).size.height*0.05,),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text("Don't have an account yet?", style: TextStyle(
                      color: Colors.black
                  ),),
                  TextButton(
                      onPressed: (){Get.to(()=>LoginScreen());},
                      child:Text("Login", style: TextStyle(
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
