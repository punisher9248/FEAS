import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../All_Constants/buttons.dart';
import '../UserAuth/login_screen.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.07,),

          Center(
              child: Container(
                height: 122,
                width: 122,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/profilepic.png"),
                        fit: BoxFit.fill
                    )

                ),

              )
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.013,),

          Center(
            child: Text("Lorem Ipsum", style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700
            ),),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),

          Center(
            child: Text("loremipsum123@hotmail.com", style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff5D5D5D)
            ),),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.025,),

          Center(
            child: Container(
              width: 340,
              height: 0.5,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(30)
              ),
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.height*0.04,),

          profile(
              "assets/icons/profileicon2.png",
              "Edit Profile",
                  (){}
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.04,),
          profile(
              "assets/icons/wallet.png",
              "Payment",
                  (){}
          ),

          SizedBox(height: MediaQuery.of(context).size.height*0.04,),
          profile(
              "assets/icons/bellicon.png",
              "Notification",
                  (){}
          ),

          SizedBox(height: MediaQuery.of(context).size.height*0.04,),
          profile(
              "assets/icons/security.png",
              "Security",
                  (){}
          ),

          SizedBox(height: MediaQuery.of(context).size.height*0.04,),

          profile(
              "assets/icons/help.png",
              "Help",
                  (){}
          ),

          SizedBox(height: MediaQuery.of(context).size.height*0.04,),

          profile(
              "assets/icons/eye.png",
              "Dark Theme",
                  (){}
          ),

          SizedBox(height: MediaQuery.of(context).size.height*0.04,),

          profile(
              "assets/icons/logout.png",
              "Logout",
                  (){showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
                ),


                context: context,
                isScrollControlled: true,
                builder: (context) =>

                    Container(
                      height: 300,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),

                      child: Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height*0.004,),
                            Image.asset("assets/icons/bookmarkline.png"),

                            SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                            Text("Logout",style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Colors.red
                            ),),

                            SizedBox(height: MediaQuery.of(context).size.height*0.04,),

                            Container(
                              width: 350,
                              height: 0.7,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(30)
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.015,),

                            Text("Are you sure, you want to logout",style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                            ),),

                            SizedBox(height: MediaQuery.of(context).size.height*0.03,),


                            CustomButton(
                                height: 60,
                                width: 300,
                                text: 'Yes, continue',
                                fontsize: 19,
                                color: Color(0xff016DFF),
                                onPressed: (){Get.to(()=>LoginScreen());},
                              textcolor: Colors.black,
                              fontweight: FontWeight.w400,
                            ),


                            SizedBox(height: MediaQuery.of(context).size.height*0.025,),

                            CustomButton(
                                height: 60,
                                width: 300,
                                fontsize: 19,
                                text: 'Cancel',
                                color: Colors.orangeAccent,
                                onPressed: (){Navigator.pop(context);},
                              textcolor: Colors.black,
                              fontweight: FontWeight.w400,
                            ),









                          ],

                        ),
                      ),


                    ),);}
          ),



        ],
      ),


    );
  }

  Widget profile(String icon, String description, VoidCallback press){
    return Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: InkWell(
          child: Row(
            children: [

              Image.asset(icon),
              SizedBox(width: MediaQuery.of(context).size.width*0.04,),

              Text(description, style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff5D5D5D)
              ),),

            ],
          ),
          onTap: press,

        )
    );
  }



}
