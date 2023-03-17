
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';


import '../All_Constants/colors.dart';
import '../All_Constants/components.dart';


class NearbyItems extends StatelessWidget {
  final String image;
  final String participant;
  final String eventtitle;
  final String itemname;
  final String date;
  final VoidCallback onPressed;


  const NearbyItems({
    Key? key,
    required this.image,
    required this.eventtitle,
    required this.participant,
    required this.itemname,
    required this.date,
    required this.onPressed, required String name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 248,
        width: 340,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              image: AssetImage(image),
            )
        ),

        child: Stack(
          children: [
            Positioned(
                top: 15,
                left: 10,
                child: Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Color(0xff242424),
                      borderRadius: BorderRadius.circular(25)
                  ),

                  child: Center(
                    child: Text(participant, style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Colors.white
                    ),),
                  ),

                )
            ),

            Positioned(
                top: 22,
                right: 25,
                child: InkWell(
                  child: Image.asset("assets/icons/like.png"),
                )
            ),


            Positioned(
                bottom: 20,
                left: 10,
                right: 10,
                child: Container(
                    width: 300,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Color(0xff242424),
                        borderRadius: BorderRadius.circular(25)
                    ),

                    child: Padding(
                      padding: const EdgeInsets.only(left: 15,right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text(eventtitle, style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                          ),),
                          SizedBox(height: 15,),

                          Row(
                            children: [
                              Image.asset("assets/images/popularprofileimg.png"),
                              SizedBox(width: 10,),

                              Text(date, style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12
                              ),),

                              Spacer(),

                              Text(date, style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white
                              ),),
                              SizedBox(width: 5,)

                            ],
                          )

                        ],
                      ),
                    )

                )
            ),

          ],
        ),






      ),
    );
  }
}



// class NearbyEventsWidget extends StatelessWidget {
//   final String title;
//   final String rent;
//   final String reviews;
//   final String reviews2;
//   final String price;
//   final String img;
//
//
//   const NearbyEventsWidget({Key? key,
//     required this.title,
//     required this.rent,
//     required this.reviews,
//     required this.price,
//     required this.img,
//     required this.reviews2,}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: Container(
//         height: 140,
//         width: 380,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: Colors.white,
//
//           boxShadow: [
//             BoxShadow(
//               //blurRadius: 0.5,
//             )
//           ]
//         ),
//
//         child: Padding(
//           padding: const EdgeInsets.only(top: 20),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(width: 15,),
//               Image.asset(img),
//
//               SizedBox(width: 15,),
//
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//
//                   Text(title, style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w700,
//                       fontSize: 18
//                   ),),
//                   SizedBox(height: 10,),
//                   Text(rent, style: TextStyle(
//                       color: Colors.grey,
//                       fontWeight: FontWeight.w700,
//                       fontSize: 14
//                   ),),
//
//                   SizedBox(height: 30,),
//                   Row(
//                     children: [
//                       Text(reviews, style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w700,
//                           fontSize: 14
//                       ),),
//                       SizedBox(width: 10,),
//
//                       Image.asset("assets/icons/star.png"),
//                       SizedBox(width: 10,),
//
//                       Text(reviews2,style: TextStyle(
//                           color: Colors.black54,
//                           fontWeight: FontWeight.w700,
//                           fontSize: 14
//                       ),)
//
//
//                     ],
//                   ),
//
//                 ],
//               ),
//               Spacer(),
//
//               Text(price,style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.w700,
//                   fontSize: 20
//               ), ),
//
//               SizedBox(width: 20,)
//
//             ],
//           ),
//         ),
//
//
//       ),
//     );
//   }
// }



class NotificationWidget extends StatelessWidget {
  final String eventname;
  final String cityname;

  final String img;

  const NotificationWidget({Key? key,
    required this.eventname,
    required this.cityname,
    required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      shadowColor: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.only(left: 8,right: 8),
        child: Container(
          width: MediaQuery.of(context).size.width*1,
          height: 80,
          decoration: BoxDecoration(
              color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [

            ]
          ),
          child: Row(
            children: [
              Image.asset(img),
              SizedBox(width: 15,),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(eventname, style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Colors.black
                    ),),
                    SizedBox(height: 10,),

                    Text(cityname,style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Colors.grey
                    ), ),
                  ],
                ),
              ),





            ],
          ),


        ),
      ),
    );
  }
}



class WishlistWidget extends StatelessWidget {
  final String title;
  final String distance;
  final String reviews;
  final String price;
  final String img;


  const WishlistWidget({Key? key, required this.title, required this.distance, required this.reviews, required this.price, required this.img,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 380,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: secondarycolor,
        border: Border.fromBorderSide(
          BorderSide(
              color: Colors.white,
              width: 2
          ),
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 15,),
            Expanded(child:  Image.asset(img),),

            SizedBox(width: 15,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(title, style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18
                ),),
                SizedBox(height: 10,),
                Text(distance, style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14
                ),),

                SizedBox(height: 10,),

                Row(
                  children: [

                    Image.asset("assets/icons/star.png"),
                    Text(reviews, style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 14
                    ),),
                  ],
                )

              ],
            ),
            Spacer(),

            Column(
              children: [
                Text(price,style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14
                ), ),
                Spacer(),
                Image.asset('assets/icons/wishlist.png'),

                SizedBox(height: 20,),

              ],
            ),

            SizedBox(width: 20,)

          ],
        ),
      ),


    );
  }
}



class ChatWidget extends StatelessWidget {
  final String eventname;
  final String msg;
  final String date;
  final String img;

  const ChatWidget({Key? key, required this.eventname, required this.img, required this.msg, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      shadowColor: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.only(left: 5,right: 5),
        child: Container(
          width: MediaQuery.of(context).size.width*12,
          height: 80,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),

          ),
          child: Row(
            children: [
              SizedBox(width: 10,),
              Image.asset(img),
              SizedBox(width: 15,),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(eventname, style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Colors.black
                    ),),
                    SizedBox(height: 10,),

                    Text(msg,style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis,

                      color: Colors.grey,
                    ),
                      softWrap: true,
                    )



                  ],
                ),
              ),

              Spacer(),

              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(date, style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Colors.black
                ),),
              ),





            ],
          ),


        ),
      ),
    );
  }
}


//
// class OngoingWidgets extends StatelessWidget {
//   final String title;
//   final String citydate;
//   final String img;
//
//   const OngoingWidgets({Key? key, required this.title, required this.citydate, required this.img}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       width: 350,
//       height: 203,
//       decoration: BoxDecoration(
//         color: secondarycolor,
//         borderRadius: BorderRadius.circular(25),
//         border: Border.all(
//             color: Colors.white,
//             width: 1
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
//         child: Column(
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Image.asset(img),
//                 SizedBox(width: 15,),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 5,),
//                     Text(title, style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700,
//                     ),),
//                     SizedBox(height: 5,),
//                     Text(citydate, style: TextStyle(
//                       fontSize: 13,
//                       fontWeight: FontWeight.w400,
//                     ),),
//                     SizedBox(height: 15,),
//
//                     Container(
//                       width: 60,
//                       height: 24,
//                       decoration: BoxDecoration(
//                         color: Colors.black,
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       child: Center(
//                         child: Text("Paid", style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 9,
//                             fontWeight: FontWeight.w400
//                         ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 15),
//
//             Component6(
//               color: Colors.black.withOpacity(0.25),
//               height: 1,
//             ),
//
//             SizedBox(height: 20,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CustomButton2(
//                     height: 38,
//                     width: 150,
//                     text: "Cancel Booking",
//                     color: secondarycolor,
//                     fontsize: 16,
//                     onPressed: (){
//                       showModalBottomSheet<void>(
//                         context: context,
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//                         isDismissible: false,
//                         enableDrag: false,
//                         builder: (BuildContext context) {
//                           return StatefulBuilder(
//                               builder: (BuildContext context, StateSetter setState){
//                                 return Container(
//                                   height: 300,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(25),
//                                     color: primarycolor,
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(left:20,right: 20),
//                                     child: SingleChildScrollView(
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                         mainAxisSize: MainAxisSize.min,
//                                         children: <Widget>[
//                                           SizedBox(height: 10,),
//                                           Center(child: Image.asset("assets/icons/linewhite.png")),
//                                           SizedBox(height: 15,),
//
//                                           Text("Cancel Booking", style: TextStyle(
//                                               fontSize: 20,
//                                               color: Color(0xffFD314F),
//                                               fontWeight: FontWeight.w700
//                                           ),),
//                                           SizedBox(height: 15,),
//
//                                           Component6(
//                                             height: 2,
//                                             color: Colors.white,),
//                                           SizedBox(height: 15,),
//
//                                           Text("Are you sure, you want to cancel your", style: TextStyle(
//                                               fontSize: 20,
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.w700
//                                           ),),
//                                           SizedBox(height: 5,),
//
//                                           Text(" E-Tickets?", style: TextStyle(
//                                               fontSize: 20,
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.w700
//                                           ),),
//
//                                           SizedBox(height: 15,),
//
//
//                                           Text("only 80%  of the money you can refund from your payment", style: TextStyle(
//                                               fontSize: 13,
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.w700
//                                           ),),
//                                           SizedBox(height: 5,),
//
//                                           Text("according to our policy", style: TextStyle(
//                                               fontSize: 13,
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.w700
//                                           ),),
//
//                                           SizedBox(height: 25,),
//
//
//
//                                           Row(
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             children: [
//
//                                               CustomButton(
//                                                   height: 50,
//                                                   width: 160,
//                                                   text: "Cancel",
//                                                   color: Colors.white,
//                                                   fontsize: 19,
//                                                   onPressed: (){Navigator.pop(context);},
//                                                   textcolor: primarycolor,
//                                                   fontweight: FontWeight.w700
//                                               ),
//                                               SizedBox(width: 10,),
//
//                                               CustomButton(
//                                                   height: 50,
//                                                   width: 160,
//                                                   text: "Yes, Continue",
//                                                   color: secondarycolor,
//                                                   fontsize: 19,
//                                                   onPressed: (){Get.to(()=>CancelTicketScreen());},
//                                                   textcolor: primarycolor,
//                                                   fontweight: FontWeight.w700
//                                               ),
//                                             ],
//                                           )
//
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               }
//                           );
//
//                         },
//                       );
//                     },
//                     textcolor: Colors.white,
//                     fontweight: FontWeight.w700
//                 ),
//                 SizedBox(width: 10,),
//
//                 CustomButton(
//                     height: 38,
//                     width: 150,
//                     text: "View Ticket",
//                     color: Colors.white,
//                     fontsize: 16,
//                     onPressed: (){Get.to(()=>TicketScreen());},
//                     textcolor: primarycolor,
//                     fontweight: FontWeight.w700
//                 )
//               ],
//             )
//
//           ],
//         ),
//       ),
//
//     );
//
//   }
// }



class ItemUploadWidgets extends StatelessWidget {
  final String title;
  final String detail;
  final String img;

  const ItemUploadWidgets({Key? key,
    required this.title,
    required this.detail,
    required this.img
  }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 300,
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
            color: Colors.white,
            width: 1
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: Colors.grey,
            spreadRadius: 1
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(img),
                SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5,),
                    Text(title, style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),),
                    SizedBox(height: 5,),
                    Text(detail, style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),),
                    SizedBox(height: 15,),

                  ],
                ),

              ],
            ),


          ],
        ),
      ),

    );

  }
}



class CanceledWidgets extends StatelessWidget {
  final String title;
  final String citydate;
  final String img;

  const CanceledWidgets({Key? key, required this.title, required this.citydate, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 350,
      height: 203,
      decoration: BoxDecoration(
        color: secondarycolor,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
            color: Colors.white,
            width: 1
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(img),
                SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5,),
                    Text(title, style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),),
                    SizedBox(height: 5,),
                    Text(citydate, style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),),
                    SizedBox(height: 15,),

                    Container(
                      width: 95,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Color(0xff404040),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text("Canceled & Refunded", style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.w400
                        ),),
                      ),
                    ),
                  ],
                ),

              ],
            ),
            SizedBox(height: 15),

            Component6(
              color: Colors.black.withOpacity(0.25),
              height: 1,
            ),

            SizedBox(height: 20,),
            Container(
              height: 33,
              width: 340,
              decoration: BoxDecoration(
                color: Color(0xff404040),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Image.asset("assets/icons/completed.png"),
                  SizedBox(width: 10,),
                  Text("You canceled this hotel bookng ", style: TextStyle(
                      color: Colors.white
                  ),)
                ],
              ),
            )

          ],
        ),
      ),

    );

  }
}


// class CancelTicketWidget extends StatelessWidget {
//   final String img;
//   final String text;
//
//   const CancelTicketWidget({Key? key, required this.img, required this.text}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 380,
//       height: 70,
//       decoration: BoxDecoration(
//           color: primarycolor,
//           borderRadius: BorderRadius.circular(25),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black45,
//               offset: const Offset(
//                 5.0,
//                 5.0,
//               ),
//               blurRadius: 10.0,
//               spreadRadius: 2.0,
//             ),
//           ]
//       ),
//
//       child: Row(
//         children: [
//           SizedBox(width: MediaQuery.of(context).size.width*0.05,),
//           Image.asset(img),
//
//           SizedBox(width: MediaQuery.of(context).size.width*0.05,),
//           Text(text, style: TextStyle(
//               color: Colors.white,
//               fontSize: 15,
//               fontWeight: FontWeight.w400
//           ),),
//
//           Spacer(),
//
//           ChangeNotifierProvider(
//             create: (_) => CheckboxProvider(),
//             child: Consumer<CheckboxProvider>(
//               builder: (context, checkboxProvider, _) => Checkbox(
//                 activeColor: secondarycolor,
//                 shape: CircleBorder(),
//                 side: BorderSide(color: Colors.white),
//                 value: checkboxProvider.isChecked,
//                 onChanged: (value) {
//                   checkboxProvider.isChecked = value ?? true;
//                 },
//               ),
//             ),
//           ),
//           SizedBox(width: MediaQuery.of(context).size.width*0.03,),
//
//
//
//         ],
//       ),
//     );
//   }
//
// }


class CheckboxProvider with ChangeNotifier {
  bool _isChecked = false;

  bool get isChecked => _isChecked;

  set isChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }
}



