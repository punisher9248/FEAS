import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp_feas/All_Widgets/widgets.dart';

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


              SizedBox(height: MediaQuery.of(context).size.height*0.02,),

              ItemUploadWidgets(
                  title: "Saw",
                  detail: "Lorem Ipsum\n it is a saw used\nonly 1 month",
                  img: "assets/images/saw.png"
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.04,),

              ItemUploadWidgets(
                  title: "Saw",
                  detail: "Lorem Ipsum\n it is a saw used\nonly 1 month",
                  img: "assets/images/saw.png"
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.08,),

             Container(
               height: 150,
               child:  FutureBuilder<QuerySnapshot>(
                 future: fetchSubCollectionData(),
                 builder: (context, snapshot) {
                   if (snapshot.connectionState == ConnectionState.waiting) {
                     return Center(
                       child: CircularProgressIndicator(),
                     );
                   } else {
                     final List<DocumentSnapshot> documents = snapshot.data!.docs;
                     return ListView.builder(
                       itemCount: documents.length,
                       itemBuilder: (context, index) {
                         final data = documents[index].data();
                         return ListTile(
                           title: Text(documents[index]['details']),
                           subtitle: Text(documents[index]['location']),
                           trailing: Text(documents[index]['price']),


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
                onPressed: (){},
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
    final CollectionReference mainCollectionRef =
    firestore.collection('UserDataInfo');
    final DocumentReference documentRef =
    mainCollectionRef.doc('GWIyQPYaoOe0f9fA0V9ylvY09Es2');
    final CollectionReference subCollectionRef =
    documentRef.collection('upload');
    final QuerySnapshot querySnapshot = await subCollectionRef.get();
    return querySnapshot;
  }


}
