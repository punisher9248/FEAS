import 'package:flutter/material.dart';
import 'package:fyp_feas/All_Constants/colors.dart';
import 'package:fyp_feas/All_Constants/components.dart';
import 'package:fyp_feas/All_Screens/Dashboard/redeem_screen.dart';
import 'package:fyp_feas/All_Screens/Dashboard/uploaditem_screen.dart';
import 'package:fyp_feas/All_Widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'chat_screen.dart';
import 'details_screen.dart';
import 'notification_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.06,),

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset("assets/icons/testlogo.png"),
                  SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                  Text("FEAS", style: TextStyle(
                    color: Colors.black, fontSize: 34
                  ) ,),
                  Spacer(),

                  InkWell(
                      onTap: (){Get.to(()=>RedeemScreen());},
                      child: Image.asset("assets/icons/redeem.png", height: 26,)),
                  SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                  
                  InkWell(
                      onTap: (){Get.to(()=>NotificationScreen());},
                      child: Image.asset("assets/icons/notification.png")),
                  SizedBox(width: MediaQuery.of(context).size.width*0.01,),

                  InkWell(
                      onTap: (){Get.to(()=>ChatScreen());},
                      child: Image.asset("assets/icons/chat.png"))





                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.035,),

              Component4(
                controller: search,
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              
              Container(
                height: 300,
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: secondarycolor,
                      width: 2
                    ),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                       image: AssetImage("assets/images/testimgmap.png"),fit: BoxFit.cover
                    )
                  ),
                  ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              
              Text("Items to rent nearby", style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600
              ),),

              SizedBox(height: MediaQuery.of(context).size.height*0.02,),



              InkWell(
                onTap: (){Get.to(()=>DetailsScreen());},
                child: NearbyEventsWidget(
                  title: "Saw",
                  rent: "Rent for 2 days",
                  reviews: "4.8",
                  reviews2: "(356 reviews)",
                  price: "Rs 50",
                  img: 'assets/images/saw.png'
            ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.02,),



              NearbyEventsWidget(
                  title: "Saw",
                  rent: "Rent for 3 days",
                  reviews: "4.8",
                  reviews2: "(356 reviews)",
                  price: "Rs 100",
                  img: 'assets/images/saw.png'
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.02,),


              NearbyEventsWidget(
                  title: "Saw",
                  rent: "Rent for 3 days",
                  reviews: "4.8",
                  reviews2: "(356 reviews)",
                  price: "Rs 100",
                  img: 'assets/images/saw.png'
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.02,),









            ],
          ),
        ),
      ),


    );
  }
}
