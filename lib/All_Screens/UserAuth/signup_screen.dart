import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_feas/All_Constants/textfield.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import '../../All_Constants/buttons.dart';
import '../../All_Constants/colors.dart';
import '../../All_Models/auth_service.dart';
import 'login_screen.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final fname = TextEditingController();
  final email = TextEditingController();
  final dob = TextEditingController();
  final password = TextEditingController();
  final no = TextEditingController();
  final SignUpController showPass = Get.put(SignUpController());


  final auth=Auth();

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
    final destination='files/$fileName';
    task=FirebaseApi.uploadFile(destination,File(_image!.path));


    final snapShot= await task!.whenComplete(() {});
    final urlDownload= await snapShot.ref.getDownloadURL();
    print('Download-Link:$urlDownload');
    return urlDownload;

  }

  final FirebaseAuth auth1 = FirebaseAuth.instance;

  Future<void> addData(String value1) async {
    final collectionRef = FirebaseFirestore.instance.collection('UserDataInfo');

    await collectionRef.add({
      "First Name":   "${fname.text}",
      "Email" :  "${email.text}",
      "Date of Birth": "${dob.text}",
      "Phone Number": no.text,
      "Password": password.text,
      "profileImg":value1,

    });

    final User? user = await auth1.currentUser;
    final uid = user?.uid;

    final docRef = FirebaseFirestore.instance.collection('UserDataInfo').doc(uid);

    await docRef.set({
      "First Name":   "${fname.text}",
      "Email" :  "${email.text}",
      "Date of Birth": "${dob.text}",
      "Phone Number": no.text,
      "Password": password.text,
      "profileImg":value1,
    });

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

              Center(child: Image.asset("assets/images/feaslogo.png", height: 150,)),

              SizedBox(height: MediaQuery.of(context).size.height*0.04,),

              Row(
                children: [
                  Text("Create your\nAccount", style: TextStyle(
                      color: Colors.black, fontSize: 30, fontWeight: FontWeight.w600
                  ),),
                  SizedBox(width: MediaQuery.of(context).size.width*0.12,),

                  _image != null ?
                  Center(
                      child: Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(File(_image!.path), width: 80, height: 70, fit: BoxFit.cover,)),

                      )
                  ) :
                  Center(child: Container(
                      height:70,
                      width: 80,
                      decoration:BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 2,color: secondarycolor),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: InkWell(
                          onTap: (){_showPicker(context);},
                          child:Icon(Icons.person_add,size: 30,color: secondarycolor)
                      )

                  )),
                ],
              ),
             


              SizedBox(height: MediaQuery.of(context).size.height*0.05,),



              Center(
                child: CustomEditField(
                    width: 350,
                    height: 55,
                    hintText: "Full Name",
                    controller: fname,
                    image: 'assets/icons/profileicon.png',
                    borderwidth: 2,
                  bordercolor: secondarycolor,
                  hintextcolor: Color(0xff7E8389),
                  textcolor: Colors.black,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),


              Center(
                child: CustomEditField(
                  width: 350,
                  height: 55,
                  hintText: "Email",
                  controller: email,
                  image: 'assets/icons/mail.png',
                  borderwidth: 2,
                  bordercolor: secondarycolor,
                  hintextcolor: Color(0xff7E8389),
                  textcolor: Colors.black,
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.02,),


              Center(
                child: CustomEditField(
                  width: 350,
                  height: 55,
                  hintText: "Date of Birth",
                  controller: dob,
                  image: 'assets/icons/calendar.png',
                  borderwidth: 2,
                  bordercolor: secondarycolor,
                  hintextcolor: Color(0xff7E8389),
                  textcolor: Colors.black,
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.02,),


              Center(
                child: CustomEditField(
                  width: 350,
                  height: 55,
                  hintText: "Mobile Number",
                  controller: no,
                  image: 'assets/icons/number.png',
                  borderwidth: 2,
                  bordercolor: secondarycolor,
                  hintextcolor:Color(0xff7E8389),
                  textcolor: Colors.black,
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.02,),


              Center(
                child: CustomPassField(
                  width:350,
                  height: 55,
                  hintText: "Password",
                  controller: password,
                  signupController: SignUpController(),
                  img: "assets/icons/lock.png",
                  hinttextcolor: Color(0xff7E8389),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.03,),

              Center(
                child: CustomButton(
                  height: 56,
                  width: 300,
                  text: "Sign Up",
                  color: primarycolor,
                  fontsize: 20,
                  textcolor: Colors.black,
                  fontweight: FontWeight.w700,
                  onPressed: () async{
                    try{

                      if(_image==null || fname.text.isEmpty||email.text.isEmpty||dob.text.isEmpty||password.text.isEmpty||no.text.isEmpty){

                        Fluttertoast.showToast(
                            msg: "Enter All Filed",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.SNACKBAR,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Color(0xff6A478E),
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                        return;

                      }else if(!email.text.contains('@') || !email.text.contains(".com")){
                        Fluttertoast.showToast(
                            msg: "Wrong Email Format",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.SNACKBAR,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Color(0xff6A478E),
                            textColor: Colors.white,
                            fontSize: 16.0
                        );

                      }
                      auth.handleSignUp(email.text, password.text,no.text,fname.text,dob.text).then((value){
                        if(value=="done"){
                          upload().then((value1) async {
                            addData(value1);
                            Get.to(()=>LoginScreen());

                            Fluttertoast.showToast(
                                msg: "Sign Up Successfully",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.SNACKBAR,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Color(0xFF1E272E),
                                textColor: Colors.white,
                                fontSize: 16.0);
                            email.clear();
                            password.clear();
                            no.clear();
                            fname.clear();
                            dob.clear();
                          });
                        }
                        else{
                          Fluttertoast.showToast(
                              msg: " Already Email Exist",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.SNACKBAR,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Color(0xff6A478E),
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      });

                    }catch(e){
                      Fluttertoast.showToast(
                          msg: "${e}",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.SNACKBAR,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Color(0xFF1E272E),
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }

                  },





                ),
              ),


              SizedBox(height: MediaQuery.of(context).size.height*0.05,),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text("Don't have an account yet?", style: TextStyle(
                      color: Colors.black
                  ),),
                  TextButton(
                      onPressed: (){Get.to(()=>LoginScreen());},
                      child:Text("Login", style: TextStyle(
                          color: secondarycolor
                      ),)
                  )
                ],
              )


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
