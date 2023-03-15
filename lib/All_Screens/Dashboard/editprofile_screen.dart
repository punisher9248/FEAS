import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_feas/All_Widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../All_Constants/buttons.dart';
import '../../All_Constants/colors.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  List<String> dataList = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.065,),
              
              Row(
                children: [
                  InkWell(
                    onTap: (){Navigator.pop(context);},
                    child: Image.asset("assets/icons/back.png"),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                  
                  Container(
                    height: 60,
                    width: 60,
                    child: Image.asset("assets/images/editprofile.png"),
                  ),

                  SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("LOREM IPSUM", style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700
                      ),),
                      SizedBox(height: MediaQuery.of(context).size.height*0.005,),

                      Text("loremipsum123@gmail.com", style: TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w500
                      ),),

                      Text("Over all rating -", style: TextStyle(
                        fontSize: 13,fontWeight: FontWeight.w400
                      ),),

                    ],
                  ),
             

                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.02,),


              Text("Redeem Points: 1000", style: TextStyle(
                fontSize: 16,fontWeight: FontWeight.w700
              ),),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),


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
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),

              Center(child: Text("Items You have uploaded", style: TextStyle(
                fontWeight: FontWeight.w600
              ),)),


             Container(
               height: Get.height,
               child:  FutureBuilder<QuerySnapshot>(
                 future: fetchSubCollectionData(),
                 builder: (context, snapshot) {
                   if (snapshot.connectionState == ConnectionState.waiting) {
                     return Center(child: CircularProgressIndicator());
                   } else {
                     final List<DocumentSnapshot> documents = snapshot.data!.docs;
                     return ListView.builder(
                       itemCount: documents.length,
                       itemBuilder: (context, index) {
                         return Padding(
                             padding: EdgeInsets.only(top: 20),
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
                                     Image.network("${documents[index]['ProductImage']}",width: 80,height: 80,),
                                     SizedBox(width: 15,),
                                     Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         SizedBox(height: 5,),
                                         Text("${documents[index]['ProductName']}", style: TextStyle(
                                           fontSize: 18,
                                           fontWeight: FontWeight.w700,
                                         ),),
                                         SizedBox(height: 5,),
                                         Text("${documents[index]['ProductDescription']}", style: TextStyle(
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

                         )
                         );



                       },
                     );
                   }
                 },
               ),
             )







            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        height: 80,
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CustomButton(
                height: 50,
                width: 160,
                text: "Delete Item",
                color: primarycolor,
                fontsize: 20,
                onPressed: (){fetchSubCollectionData();},
                textcolor: Colors.white,
                fontweight: FontWeight.w500
            ),
            SizedBox(width: MediaQuery.of(context).size.width*0.04,),

            CustomButton(
                height: 50,
                width: 160,
                text: "Edit Profile",
                color: primarycolor,
                fontsize: 20,
                onPressed: (){},
                textcolor: Colors.white,
                fontweight: FontWeight.w500
            ),
          ],
        )
      ),


    );
  }

  Future<QuerySnapshot> fetchSubCollectionData() async {
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
