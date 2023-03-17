// import 'package:boomhit/All_Constants/buttons.dart';
// import 'package:boomhit/All_Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'buttons.dart';
import 'colors.dart';
// import 'package:flutter_switch/flutter_switch.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:syncfusion_flutter_charts/charts.dart' hide LabelPlacement;
// import 'package:syncfusion_flutter_sliders/sliders.dart';



class Component1 extends StatelessWidget {
  const Component1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
        width: 95,
        height: 1,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1
          )
        ),
      ),
        SizedBox(width: 10,),
        Text("or continue with", style: TextStyle(
          color: Colors.white,
          fontSize: 16
        ),),
        SizedBox(width: 10,),
        Container(
          width: 95,
          height: 1,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.white,
                  width: 1
              )
          ),
        ),
        
      ],
    );
  }
}


class Component2 extends StatelessWidget {
  final dynamic image;

  const Component2({
    Key? key,
    this.image
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 90,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 1
        ),
        borderRadius: BorderRadius.circular(30)
      ),
      child: Image.asset(image),

    );
  }
}


class Component3 extends StatelessWidget {
  final dynamic icon;
  final String via;
  final dynamic numoremail;
  const Component3(
      {
        Key? key,
        this.icon, required this.via, this.numoremail
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      width: 379,
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.white,
              width: 1
          ),
          borderRadius: BorderRadius.circular(40)
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
            child: Column(
              children: [
                Image.asset(icon),

              ],
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(via, style: TextStyle(
                color: Colors.white
              ),),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),

              Text(numoremail, style: TextStyle(
                  color: Colors.white
              ),)
            ],
          )

        ],
      ),

    );
  }
}


class Component4 extends StatelessWidget {
  final TextEditingController controller;

  Component4({Key? key, required this.controller}) : super(key: key);

  late  SfRangeValues _values = SfRangeValues(0, 2000);
  bool status = false;
  bool status2 = false;
  bool status3 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 380,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xffD9D9D9),
          border: Border.all(
          color: Colors.white,
        width: 1,
      )

      ),

        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [

              Image.asset("assets/icons/search.png"),

              SizedBox(width: 10,),
              Expanded(child: TextField(
                controller: controller,
                style: TextStyle(
                    fontFamily: 'Quicksand',fontWeight: FontWeight.w400,
                    color: Colors.white
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color:  Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: Get.height * 0.019,
                  ),
                ),
              ),),

              SizedBox(width: 20,)


            ],
          ),
        )



    );
  }
}




class Component5 extends StatelessWidget {

  final double width;
  final String text;

  const Component5({Key? key, required this.width, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: width,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.fromBorderSide(
            BorderSide(
              color: Colors.white,
              width: 1,
            ),
        )
      ),

      child: Center(child: Text(text, style: TextStyle(
        color: Colors.white
      ),)),



    );
  }
}

class Component6 extends StatelessWidget {
  final dynamic color;
  final double height;
  const Component6({Key? key, this.color, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 356,
      height: height,
      decoration: BoxDecoration(
        color: color,


      ),

    );
  }
}


class Component7 extends StatelessWidget {
  final String icon;
  final String text;
  final dynamic color;
  final VoidCallback onPressed;

  const Component7({Key? key, required this.icon, required this.text, required this.onPressed, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Image.asset(icon),
          SizedBox(width: 15,),

          Text(text, style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: color

          ),),

        ],
      ),
    );
  }
}



class Component8 extends StatelessWidget {
  final String text;
  final String price;

  const Component8({Key? key, required this.text, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 350,
          height: 74,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.white,
                  width: 1
              ),
            borderRadius: BorderRadius.circular(10)
          ),

          child: Row(
            children: [
              SizedBox(width: 10,),
              Text(text, style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18
              ),),

              SizedBox(width: 20,),
              
              Container(
                height: 35,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.white,
                  ),
                ),

                child: Center(
                  child: Text(price, style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700
                  ),),
                ),
              ),
              Spacer(),
              
              Image.asset("assets/icons/dropdownevent.png"),

              SizedBox(width: 20,)

            ],
          ),


        ),


      ],
    );
  }
}


class Component9 extends StatelessWidget {
  final String name;
  final String review;
  final String img;

  const Component9({Key? key, required this.name, required this.review, required this.img, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio eget feugiat sapien imperdiet pellentesque dictum. Eros, nunc et potenti ipsum aliquam, ac tincidunt vitae.",
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: Colors.white
          ) ,),

        SizedBox(height: 20,),

        Row(
          children: [
            Image.asset(img),
            SizedBox(width: 10,),
            Text(name, style: TextStyle(
              color: Colors.white,

            ),),
            Spacer(),

            Image.asset("assets/icons/star.png"),
            SizedBox(width: 10,),
            Text(review, style: TextStyle(
              color: Colors.white
            ),)
          ],
        )


      ],
    );
  }
}

class Component10 extends StatelessWidget {
  final String name;
  final String desc;
  final VoidCallback onPressed;


  const Component10({Key? key, required this.name, required this.desc, required this.onPressed, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        
        Text(name, style: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w700
      ),),

        // SizedBox(width: MediaQuery.of(context).size.width*0.15,),
        Spacer(),
        Text(desc, style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400
        ),),
        Spacer(),
        
        
       InkWell(
         onTap: onPressed,
         child:  Image.asset("assets/icons/playbtn.png",),
       ),

        SizedBox(width: MediaQuery.of(context).size.width*0.01,),
        
        
        

      ],
    );
  }
}








