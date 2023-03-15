import 'package:flutter/material.dart';
import 'package:fyp_feas/All_Constants/colors.dart';
import 'package:fyp_feas/All_Screens/Dashboard/goodcitizen_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../All_Constants/buttons.dart';


class RedeemScreen extends StatefulWidget {
  const RedeemScreen({Key? key}) : super(key: key);

  @override
  State<RedeemScreen> createState() => _RedeemScreenState();
}

class _RedeemScreenState extends State<RedeemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

        body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.only(left: 12,right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              Row(
                children: [
                  InkWell(
                    onTap: (){Navigator.pop(context);},
                    child:  Image.asset("assets/icons/back.png"),
                  ),

                  SizedBox(width: MediaQuery.of(context).size.width*0.05,),

                  Text("Redeem Points", style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w700
                  ),),
                  
                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.03,),

              Container(
                height: 130,
                width: 400,
                decoration: BoxDecoration(
                  color: primarycolor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: secondarycolor,
                    width: 2
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Good Citizen Points", style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                      ),),

                      SizedBox(height: MediaQuery.of(context).size.height*0.04,),

                      Text("Mr. Ahmed", style: TextStyle(
                          color: Colors.black,
                        fontSize: 16
                      ),),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      
                      Text("0 points", style: TextStyle(
                        color: Colors.black
                      ),)



                    ],
                  ),
                ),
              ),


              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              
              Text("Tasks to perform",style: TextStyle(
                  color: secondarycolor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700
              ),),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              
              Text("-You have to plant either a seed, plant or mangrove make a short video as proof.\n-To earn more points performs other tasks included (watering, care taking and etc)\n-Points will be given after analyzing the proofs, and will take time also."
                  ,style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w400,
                ), textAlign: TextAlign.justify,),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),

              Text("Terms and Conditions",style: TextStyle(
                  color: secondarycolor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700
              ),),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),

              Text("-Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum \n-Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum \n-Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
                ,style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w400
                ), textAlign: TextAlign.justify,),
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),

              Center(
                child: CustomButton(
                    height: 50,
                    width: 220,
                    text: "Upload a video/image",
                    color: primarycolor,
                    fontsize: 20,
                    onPressed: (){Get.to(()=>GoodCitizenScreen());},
                    textcolor: Colors.white,
                    fontweight: FontWeight.w500
                ),
              ),


            ],
          ),
        )
        )
    );
  }
}
