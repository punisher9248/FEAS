import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:fyp_feas/All_Constants/buttons.dart';
import 'package:fyp_feas/All_Constants/colors.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../All_Models/auth_service.dart';


class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final itemname = TextEditingController();
  final details = TextEditingController();
  final location = TextEditingController();
  final price = TextEditingController();



  final FirebaseAuth auth = FirebaseAuth.instance;

  Future inputData() async {
    final User? user = await auth.currentUser;
    final uid = user?.uid;


      if (user == null) {
        return null;
      }

      // Get the user's document from Firestore
      final doc = await FirebaseFirestore.instance
          .collection('UserDataInfo')
          .doc(user.uid)
          .get();

      // Return the document ID
    //print(doc.id);

      // // Get the document reference for the document with the given ID
      // final docRef = FirebaseFirestore.instance.collection('UserDataInfo').doc(doc.id);
      //
      // // Create a subcollection using the 'collection' method on the document reference
      // final subcollectionRef = docRef.collection('my_subcollection');
      //
      // // Add a document to the subcollection
      // await subcollectionRef.add({'field1': 'value1', 'field2': 'value2'});
     // print(doc.id);
      print(uid);




      return doc.id;







    // Define a reference to the parent document
//     DocumentReference<Map<String, dynamic>> parentDocRef =
//     FirebaseFirestore.instance.collection('UserDataInfo').doc(uid);
//
// // Define a reference to the subcollection
//     CollectionReference<Map<String, dynamic>> subcollectionRef =
//     parentDocRef.collection('subcollection_name');
//
// // Create a new document in the subcollection
//     final newDocumentRef = await subcollectionRef.add({
//       'field1': 'value1',
//       'field2': 'value2',
//     });

    final userDocRef = FirebaseFirestore.instance.collection('UserDataInfo').doc(uid);
    final ordersCollectionRef = userDocRef.collection('orders');
    ordersCollectionRef.add({
      'order_number': '123',
      'date': DateTime.now(),
      'status': 'pending',
    });



    print(uid);

  }

  final ImagePicker _picker = ImagePicker();

  XFile? _image;

  Future getImagefromcamera() async {
    var image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
      print(_image!.path);
    });
  }

  Future getImagefromGallery() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {

      _image = image;

      print('file path----${_image!.path}');
    });
  }

  UploadTask? task;

  Future<String> upload() async{


    final fileName=basename(_image!.path);
    final destination='UploadProduct/$fileName';
    task=FirebaseApi.uploadFile(destination,File(_image!.path));


    final snapShot= await task!.whenComplete(() {});
    final urlDownload= await snapShot.ref.getDownloadURL();
    print('Download-Link:$urlDownload');
    return urlDownload;

  }


  Future<void> addProduct() async {
    final User? user = await auth.currentUser;
    final uid = user?.uid;

    if (user == null) {
      return null;
    }

    upload().then((value1) async {

      final subcollectionRef = FirebaseFirestore.instance
          .collection('UserDataInfo')
          .doc(uid)
          .collection('MyProduct');
      await subcollectionRef.add({
        'ProductName': '${itemname.text.toString()}',
        'ProductDescription': '${details.text.toString()}',
        'Location':'${location.text.toString()}',
        'Price':'${price.text.toString()}',
        'ProductImage':'${value1}'

      });


      Fluttertoast.showToast(
          msg: "Item Uploaded Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFF1E272E),
          textColor: Colors.white,
          fontSize: 16.0);
      itemname.clear();
      details.clear();
      location.clear();
      price.clear();
    });







  }


  @override
  void initState() {
    super.initState();
  }




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

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("Upload Item", style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.03,),

              _image != null ?
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
                      child: Image.file(File(_image!.path), width: 55, height: 55, fit: BoxFit.cover),
                    )
                ),
              ) :
              Center(child: Center(
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
                    child: InkWell(
                      onTap: (){_showPicker(context);},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Upload Image here to Click"),
                          SizedBox(height: 10),
                          Icon(Icons.add),
                        ],
                      ),
                    )
                ),
              )),


              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              

              Text("Item Name",style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Column(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 3,
                        child: TextField(
                          controller: itemname,
                          style: TextStyle(
                              fontFamily: 'Quicksand',fontWeight: FontWeight.w400,
                              color: Colors.black
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter item name",
                            hintStyle: TextStyle(
                              color:  Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: Get.height * 0.019,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              Text("Details",style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),

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
                    controller: details,
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



              Text("Location",style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 18
              ),),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),

              Container(
                height: 70,
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
                    controller: location,
                    style: TextStyle(
                        fontFamily: 'Quicksand',fontWeight: FontWeight.w400,
                        color: Colors.black
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your location",
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



              Text("Price",style: TextStyle(
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5),
                  child: Row(
                    children: [
                      Image.asset("assets/images/pak.png"),
                      SizedBox(width: MediaQuery.of(context).size.width*0.02,),

                      Flexible(
                        fit: FlexFit.tight,
                        flex: 3,
                        child: TextField(
                          controller: price,
                          style: TextStyle(
                              fontFamily: 'Quicksand',fontWeight: FontWeight.w400,
                              color: Colors.black
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter your price",
                            hintStyle: TextStyle(
                              color:  Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: Get.height * 0.019,
                            ),
                          ),
                        ),
                      ),





                    ],
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.03,),


              Center(
                child:  CustomButton(
                    height: 50,
                    width: 150,
                    text: "Upload",
                    color: primarycolor,
                    fontsize: 20,
                    textcolor: Colors.white,
                    fontweight: FontWeight.w500,
                    onPressed: (){

                      addProduct();

                      // if(details.text.isEmpty||location.text.isEmpty||price.text.isEmpty||itemname.text.isEmpty){
                      //
                      //   Fluttertoast.showToast(
                      //       msg: "enter all field",
                      //       toastLength: Toast.LENGTH_SHORT,
                      //       gravity: ToastGravity.SNACKBAR,
                      //       timeInSecForIosWeb: 1,
                      //       backgroundColor: Color(0xFF1E272E),
                      //       textColor: Colors.white,
                      //       fontSize: 16.0);
                      //
                      // }
                      // else{
                      //   //inputData(details.text,price.text,location.text,itemname.text,);
                      //   inputData();
                      //   Fluttertoast.showToast(
                      //       msg: "Item Uploaded Successfully",
                      //       toastLength: Toast.LENGTH_SHORT,
                      //       gravity: ToastGravity.SNACKBAR,
                      //       timeInSecForIosWeb: 1,
                      //       backgroundColor: Color(0xFF1E272E),
                      //       textColor: Colors.white,
                      //       fontSize: 16.0);
                      //   // details.clear();
                      //   // price.clear();
                      //   // location.clear();
                      // }


                    },

                ),
              ),


              SizedBox(height: MediaQuery.of(context).size.height*0.03,),





            ],
          ),
        ),
      ),


    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        getImagefromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      getImagefromcamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
