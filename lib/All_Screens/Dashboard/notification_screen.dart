
import 'package:flutter/material.dart';
import 'package:fyp_feas/All_Constants/colors.dart';

import '../../All_Widgets/widgets.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 12),
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

                  Text("Notification", style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w700
                  ),),
                  Spacer(),

                  Image.asset("assets/icons/dots.png"),
                  SizedBox(width: MediaQuery.of(context).size.width*0.02,),


                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.05,),

              Text("Today",style: TextStyle(
                  color: secondarycolor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700
              ),),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),


              NotificationWidget(
                img: "assets/images/notificationpic.png",
                eventname: 'Lorem Ipsum',
                cityname: 'lorem ipsum',

              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.01,),


              NotificationWidget(
                img: "assets/images/notificationpic2.png",
                eventname: 'lorem ipsum',
                cityname: 'New York',

              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.01,),


              NotificationWidget(
                img: "assets/images/notificationpic3.png",
                eventname: 'lorem ipsum',
                cityname: 'New York',

              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.01,),


              NotificationWidget(
                img: "assets/images/notificationpic4.png",
                eventname: 'Lorem Ipsum',
                cityname: 'lorem ipsum',

              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.01,),


              NotificationWidget(
                img: "assets/images/notificationpic5.png",
                eventname: 'Lorem Ipsum',
                cityname: 'lorem ipsum',

              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),


              Text("Yesterday",style: TextStyle(
                  color: secondarycolor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700
              ),),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),

              NotificationWidget(
                img: "assets/images/notificationpic3.png",
                eventname: 'Lorem Ipsum',
                cityname: 'lorem ipsum',

              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.01,),


              NotificationWidget(
                img: "assets/images/notificationpic4.png",
                eventname: 'Lorem Ipsum',
                cityname: 'lorem ipsum',

              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.01,),


              NotificationWidget(
                img: "assets/images/notificationpic5.png",
                eventname: 'Lorem Ipsum',
                cityname: 'lorem ipsum',

              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),



            ],
          ),
        ),
      ),


    );
  }
}
