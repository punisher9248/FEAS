import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_feas/All_Constants/textfield.dart';
import '../../All_Constants/buttons.dart';
import '../../All_Constants/colors.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  final name = TextEditingController();
  final email = TextEditingController();
  final pass = TextEditingController();
  final no = TextEditingController();
  final dob = TextEditingController();

  final _formKey = GlobalKey<FormState>();






    @override
    Widget build(BuildContext context) {
      return Scaffold(

        backgroundColor: Colors.white,


        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.065,),

                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset("assets/icons/back.png"),
                    ),
                    SizedBox(width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.03,),

                    Container(
                      height: 60,
                      width: 60,
                      child: Image.asset("assets/images/editprofile.png"),
                    ),

                    SizedBox(width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.03,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("LOREM IPSUM", style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700
                        ),),
                        SizedBox(height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.005,),

                        Text("loremipsum123@gmail.com", style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500
                        ),),

                        Text("Over all rating -", style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400
                        ),),

                      ],
                    ),
                  ],
                ),

                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02,),


                Center(
                  child: Container(
                    width: 350,
                    height: 1,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30)
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.06,),

                CustomEditFieldEditProfile(
                  width: 350,
                  height: 60,
                  hintText: "Name",
                  controller: name,
                  borderwidth: 2,
                  bordercolor: secondarycolor,
                  textcolor: Colors.black,
                  hintextcolor: Colors.grey,
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02,),

                CustomEditFieldEditProfile(
                  width: 350,
                  height: 60,
                  hintText: "Email",
                  controller: email,
                  borderwidth: 2,
                  bordercolor: secondarycolor,
                  textcolor: Colors.black,
                  hintextcolor: Colors.grey,
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02,),

                CustomEditFieldEditProfile(
                  width: 350,
                  height: 60,
                  hintText: "Password",
                  controller: pass,
                  borderwidth: 2,
                  bordercolor: secondarycolor,
                  textcolor: Colors.black,
                  hintextcolor: Colors.grey,
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02,),

                CustomEditFieldEditProfile(
                  width: 350,
                  height: 60,
                  hintText: "Phone Number",
                  controller: no,
                  borderwidth: 2,
                  bordercolor: secondarycolor,
                  textcolor: Colors.black,
                  hintextcolor: Colors.grey,
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02,),

                CustomEditFieldEditProfile(
                  width: 350,
                  height: 60,
                  hintText: "Date of Birth",
                  controller: dob,
                  borderwidth: 2,
                  bordercolor: secondarycolor,
                  textcolor: Colors.black,
                  hintextcolor: Colors.grey,
                ),

                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.05,),

                Center(
                  child: CustomButton(
                      height: 60,
                      width: 150,
                      text: "Submit",
                      color: primarycolor,
                      fontsize: 20,
                      onPressed: () {

                      },
                      textcolor: Colors.white,
                      fontweight: FontWeight.w600
                  ),
                )

              ],
            ),
          ),
        ),
      );
    }

}