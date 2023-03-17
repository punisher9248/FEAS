import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../All_Constants/buttons.dart';
import '../UserAuth/login_screen.dart';
import 'editprofile_screen.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> dataList = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;

   var name;
   var email;
   var  photoUrl;

 void fetchSubCollectionData() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = await auth.currentUser;
    if (user != null) {
      String userId = user.uid;
      DocumentReference userRef = FirebaseFirestore.instance.collection('UserDataInfo').doc(userId);
      userRef.get().then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
             email = documentSnapshot.get('Email');
             name = documentSnapshot.get('First Name');
             photoUrl = documentSnapshot.get('profileImg');
            print(email);
            print(name);

        }else{
          throw("fail to load data");
        }
      });
    }
  }

  @override
  void initState() {

   setState(() {
     fetchSubCollectionData();
   });

    Timer(Duration(seconds: 1), () {fetchSubCollectionData();});
    Timer(Duration(seconds: 2), () {fetchSubCollectionData();});
    Timer(Duration(seconds: 3), () {fetchSubCollectionData();});
    Timer(Duration(seconds: 4), () {fetchSubCollectionData();});
    Timer(Duration(seconds: 5), () {fetchSubCollectionData();});


    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body:Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.09,),

            Center(
                child: Container(
                  height: 122,
                  width: 122,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage("${photoUrl}"),
                          fit: BoxFit.fill
                      )

                  ),

                )
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.013,),

            Center(
              child: Text("${name}", style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w700
              ),),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),

            Center(
              child: Text("${email}", style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,

              ),),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.025,),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: Text("Redeem Points: -", style: TextStyle(
                  fontSize: 16,fontWeight: FontWeight.w700
              ),),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),

            Center(
              child: Container(
                width: 380,
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
                "Edit your Profile",
                    (){Get.to(()=>EditProfileScreen());}
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.06,),


            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("Items You have uploaded:", style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 16
              ),),
            ),


            Flexible(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder<QuerySnapshot>(
                  future: fetchSubCollectionProductData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      final List<DocumentSnapshot> documents = snapshot.data!.docs;
                      return ListView.builder(
                        itemCount: documents.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Container(
                                width: 300,
                                height: 110,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.white, width: 1),
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
                                          Image.network("${documents[index]['ProductImage']}",width: 100,height: 80,),
                                          SizedBox(width: 15,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 5,),
                                              Text("${documents[index]['ProductName']}", style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                              ),),
                                              SizedBox(height:20,),
                                              Text("${documents[index]['ProductDescription']}", style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),),
                                              SizedBox(height: 15,),

                                            ],
                                          ),
                                          Spacer(),

                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 5,),
                                              Text("${documents[index]['Location']}", style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                              ),),
                                              SizedBox(height: 25,),
                                              Text("${documents[index]['Price']}", style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),),
                                              SizedBox(height: 15,),


                                            ],
                                          ),
                                          SizedBox(width: 15,),

                                        ],
                                      ),


                                    ],
                                  ),
                                ),

                              )
                          );



                        },
                      );
                    }
                  },
                ),
              ),
            ),



            SizedBox(height: MediaQuery.of(context).size.height*0.04,),

            // profile(
            //     "assets/icons/logout.png",
            //     "Logout",
            //         (){showModalBottomSheet(
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
            //       ),
            //
            //
            //       context: context,
            //       isScrollControlled: true,
            //       builder: (context) =>
            //
            //           Container(
            //             height: 300,
            //             width: Get.width,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(25),
            //               color: Colors.white,
            //             ),
            //
            //             child: Padding(
            //               padding: const EdgeInsets.only(left: 15,right: 15),
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.center,
            //                 children: [
            //                   SizedBox(height: MediaQuery.of(context).size.height*0.004,),
            //                   Image.asset("assets/icons/bookmarkline.png"),
            //
            //                   SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            //
            //                   Text("Logout",style: TextStyle(
            //                       fontSize: 22,
            //                       fontWeight: FontWeight.w700,
            //                       color: Colors.red
            //                   ),),
            //
            //                   SizedBox(height: MediaQuery.of(context).size.height*0.04,),
            //
            //                   Container(
            //                     width: 350,
            //                     height: 0.7,
            //                     decoration: BoxDecoration(
            //                         color: Colors.grey,
            //                         borderRadius: BorderRadius.circular(30)
            //                     ),
            //                   ),
            //                   SizedBox(height: MediaQuery.of(context).size.height*0.015,),
            //
            //                   Text("Are you sure, you want to logout",style: TextStyle(
            //                       fontSize: 18,
            //                       fontWeight: FontWeight.w600,
            //                       color: Colors.black
            //                   ),),
            //
            //                   SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            //
            //
            //                   CustomButton(
            //                       height: 60,
            //                       width: 300,
            //                       text: 'Yes, continue',
            //                       fontsize: 19,
            //                       color: Color(0xff016DFF),
            //                       onPressed: (){Get.to(()=>LoginScreen());},
            //                     textcolor: Colors.black,
            //                     fontweight: FontWeight.w400,
            //                   ),
            //
            //
            //                   SizedBox(height: MediaQuery.of(context).size.height*0.025,),
            //
            //                   CustomButton(
            //                       height: 60,
            //                       width: 300,
            //                       fontsize: 19,
            //                       text: 'Cancel',
            //                       color: Colors.orangeAccent,
            //                       onPressed: (){Navigator.pop(context);},
            //                     textcolor: Colors.black,
            //                     fontweight: FontWeight.w400,
            //                   ),
            //
            //
            //
            //
            //
            //
            //
            //
            //
            //                 ],
            //
            //               ),
            //             ),
            //
            //
            //           ),);}
            // ),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),



          ],
        ),
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
                  color: Colors.black
              ),),

            ],
          ),
          onTap: press,

        )
    );
  }

   Future<QuerySnapshot> fetchSubCollectionProductData() async {
     final FirebaseAuth auth = FirebaseAuth.instance;
     final User? user = await auth.currentUser;
     final uid = user?.uid;

     if (user == null) {
       print("No User");
     }

     final CollectionReference mainCollectionRef = firestore.collection('UserDataInfo');
     final DocumentReference documentRef = mainCollectionRef.doc(uid);
     final CollectionReference subCollectionRef = documentRef.collection('MyProduct');
     final QuerySnapshot querySnapshot = await subCollectionRef.get();
     print(querySnapshot);
     return querySnapshot;
   }

}
