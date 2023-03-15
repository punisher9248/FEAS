import 'package:flutter/material.dart';
import 'package:fyp_feas/All_Constants/buttons.dart';
import 'package:fyp_feas/All_Constants/colors.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  // String _text = 'Initial Text';
  // final _textController = TextEditingController();
  //
  // void _changeText() {
  //   setState(() {
  //     _text = _textController.text;
  //   });
  // }
  //
  // @override
  // void dispose() {
  //   _textController.dispose();
  //   super.dispose();
  // }

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
              Row(
                children: [
                  InkWell(
                      onTap: (){Navigator.pop(context);},
                      child: Image.asset("assets/icons/back.png")),
                  SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                  Text("Details", style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),),
                  
                 




                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.03,),


              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: secondarycolor,
                      width: 2
                    ),
                    borderRadius: BorderRadius.circular(25)
                  ),
                    child: Image.asset("assets/images/sawbig.png")
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.03,),


              Container(
                decoration: BoxDecoration(
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Saw", style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 25
                    ),),
                    SizedBox(width: MediaQuery.of(context).size.width*0.05,),


                    Text("4.5", style: TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 15
                    ),),
                    SizedBox(width: MediaQuery.of(context).size.width*0.02,),

                    Image.asset("assets/icons/star.png"),

                    Spacer(),

                    Text("RS 50",style: TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 22
                    ), ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.03,),


                  ],
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              Text("Description",style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 18
              ),),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),

              Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget nibh at varius rhoncus sapien nibh a malesuada ullamcorper. Morbi elementum egestas elit vivamus."),

              SizedBox(height: MediaQuery.of(context).size.height*0.02),

              Container(
                height: 1,
                decoration: BoxDecoration(
                  color: Colors.grey
                ),
              ),


              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Text("Delivery",style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 18
              ),),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),


              Text("Items is nearby\nwill be delivered to you in a day"),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),



              Container(
                height: 1,
                decoration: BoxDecoration(
                    color: Colors.grey
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),

              Text("Details",style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 18
              ),),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),


              Text("Lorem Ipsum quality\nipsum quality\nlorem texture\nsoft nature"),
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                      height: 50,
                      width: 150,
                      text: "Chat",
                      color: primarycolor,
                      fontsize: 20,
                      onPressed: (){},
                      textcolor: Colors.white,
                      fontweight: FontWeight.w500
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                  CustomButton(
                      height: 50,
                      width: 150,
                      text: "Rent now",
                      color: secondarycolor,
                      fontsize: 20,
                      onPressed: (){},
                      textcolor: Colors.white,
                      fontweight: FontWeight.w500
                  ),
                ],
              )


            ],
          ),
        ),
      ),

    );
  }
}
