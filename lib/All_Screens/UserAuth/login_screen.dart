import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_feas/All_Constants/buttons.dart';
import 'package:fyp_feas/All_Constants/textfield.dart';
import 'package:fyp_feas/All_Constants/utilis.dart';
import 'package:fyp_feas/All_Screens/Dashboard/home_screen.dart';
import 'package:fyp_feas/All_Screens/UserAuth/signup_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../All_Constants/colors.dart';
import '../../All_Constants/components.dart';
import '../../All_Models/auth_service.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final pass = TextEditingController();

  final SignUpController showPass = Get.put(SignUpController());

  Future signIn() async{

    try {

      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text.trim(), password: pass.text.trim());
      Fluttertoast.showToast(
          msg: "Sign In Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFF1E272E),
          textColor: Colors.white,
          fontSize: 16.0
      );
      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>AnimatedBarExample()


      ));

    } on FirebaseAuthException catch(e){
      Fluttertoast.showToast(
          msg: "${e}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFF1E272E),
          textColor: Colors.white,
          fontSize: 16.0
      );
    }

  }

  final auth=Auth();



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


              Center(child: Image.asset("assets/images/feaslogo.png", height: 200,)),

              SizedBox(height: MediaQuery.of(context).size.height*0.06,),

             Text("  Login to your\n  Account", style: TextStyle(
               color: Colors.black, fontSize: 35, fontWeight: FontWeight.w600
             ),),
              SizedBox(height: MediaQuery.of(context).size.height*0.07,),



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
                  height: 56,
                  width: 300,
                  text: "Login",
                  color: primarycolor,
                  fontsize: 20,
                  textcolor: Colors.black,
                  fontweight: FontWeight.w700,
                  onPressed: (){
                    if(email.text.isEmpty || pass.text.isEmpty ){

                      Fluttertoast.showToast(
                          msg: "Enter All Field",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.SNACKBAR,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Color(0xFF1E272E),
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      return;
                    }else if(!email.text.contains('@') || !email.text.contains(".com")){
                      Fluttertoast.showToast(
                          msg: "Wrong Email Format",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.SNACKBAR,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Color(0xFF1E272E),
                          textColor: Colors.white,
                          fontSize: 16.0
                      );

                    }else{
                      auth.handleSignInEmail(context,email.text, pass.text).then((value){});
                    }



                    if (email.text.isEmpty||pass.text.isEmpty){

                      Fluttertoast.showToast(
                        msg: "Enter all filed",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.SNACKBAR,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Color(0xFF1E272E),
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }else if(!email.text.contains('@')||!email.text.contains('.com')){
                      Fluttertoast.showToast(
                        msg: "Invalid Email Format",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.SNACKBAR,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Color(0xFF1E272E),
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }else {

                      auth.handleSignInEmail(context,email.text, pass.text).then((value){});
                      //signIn();
                    }
                  },
                ),
              ),



              SizedBox(height: MediaQuery.of(context).size.height*0.17,),


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
