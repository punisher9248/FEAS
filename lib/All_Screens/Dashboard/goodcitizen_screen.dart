import 'package:flutter/material.dart';
import 'package:fyp_feas/All_Constants/buttons.dart';
import 'package:fyp_feas/All_Constants/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class GoodCitizenScreen extends StatefulWidget {
  const GoodCitizenScreen({Key? key}) : super(key: key);

  @override
  State<GoodCitizenScreen> createState() => _GoodCitizenScreenState();
}

class _GoodCitizenScreenState extends State<GoodCitizenScreen> {
  final location1 = TextEditingController();
  final details1 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
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

                  Text("Be a Good Citizen", style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),),
                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.03,),

              Center(
                child: Container(
                    height: 200,
                    width: 400,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: secondarycolor,
                            width: 2
                        ),
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset("assets/images/video.png"),
                    )
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),



              Center(
                child: CustomButton(
                    height: 40,
                    width: 190,
                    text: "Upload item image",
                    color: secondarycolor,
                    fontsize: 20,
                    onPressed: (){},
                    textcolor: Colors.white,
                    fontweight: FontWeight.w500
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.03,),

              Text("Location",style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 18
              ),),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),

              Container(
                height: 50,
                width: 360,
                decoration: BoxDecoration(
                    color: Color(0xffFEF5F5),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Colors.black,
                        width: 1
                    )
                ),
                child:  Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                  child: TextField(
                    controller: location1,
                    style: TextStyle(
                        fontFamily: 'Quicksand',fontWeight: FontWeight.w400,
                        color: Colors.black
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Allow GPS for Live Location",
                      hintStyle: TextStyle(
                        color:  Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: Get.height * 0.019,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.03,),

              Text("Details",style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 18
              ),),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),

              Container(
                height: 140,
                width: 360,
                decoration: BoxDecoration(
                    color: Color(0xffFEF5F5),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Colors.black,
                        width: 1
                    )
                ),
                child:  Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                  child: TextField(
                    controller: details1,
                    style: TextStyle(
                        fontFamily: 'Quicksand',fontWeight: FontWeight.w400,
                        color: Colors.black
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter the details",
                      hintStyle: TextStyle(
                        color:  Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: Get.height * 0.019,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.03,),


              SizedBox(height: MediaQuery.of(context).size.height*0.03,),


              Center(
                child:  CustomButton(
                    height: 50,
                    width: 150,
                    text: "Upload",
                    color: primarycolor,
                    fontsize: 20,
                    onPressed: (){},
                    textcolor: Colors.white,
                    fontweight: FontWeight.w500
                ),
              ),


              SizedBox(height: MediaQuery.of(context).size.height*0.03,),





            ],
          ),
        ),
      ),


    );
  }
}
