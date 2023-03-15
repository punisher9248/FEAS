// import 'package:boomhit/All_Models/user_model.dart';
// import 'package:firebase_auth/firebase_auth.dart' as auth;
//
//
// class AuthService{
//
//   final auth.FirebaseAuth _firbaseAuth = auth.FirebaseAuth.instance;
//
//   User? _userFromFirebase(auth.User? user) {
//     if (user == null) {
//       return null;
//     } else{
//       return User(user.uid, user.email);
//     }
//   }
//
//   Stream<User?>? get user {
//     return _firbaseAuth.authStateChanges().map(_userFromFirebase);
//   }
//
//   Future<User?> signInWithEmailAndPassword(
//       String email,
//       String password,
//       ) async{
//     final credential = await _firbaseAuth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//     );
//     return _userFromFirebase(credential.user);
//   }
//
//   Future<User?> createUserWithEmailAndPassword(
//       String email,
//       String password,
//       )async{
//     final credential = await _firbaseAuth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//   return _userFromFirebase(credential.user);
//   }
//
//   Future<void> signOut() async{
//     return await _firbaseAuth.signOut();
//
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../All_Models/google_signin.dart';
import 'dart:io';
import '../All_Constants/utilis.dart';



class Auth{

  final FirebaseAuth auth=FirebaseAuth.instance;

  Future<dynamic> handleSignInEmail(context,String email, String password) async {
    try{
      UserCredential result = await auth.signInWithEmailAndPassword(email: email, password: password);
      final User user = result.user!;
      SharedPreferences preferences=await SharedPreferences.getInstance();
      print(user.uid);


      FirebaseFirestore firestore= FirebaseFirestore.instance;
      QuerySnapshot eventsQuery = await firestore.collection("UserDataInfo").where("EmailAddress",isEqualTo:email ).get();
      eventsQuery.docs.forEach((element) {
        preferences.setString("firstName", "${element["First Name"]}");
        preferences.setString("lastName", "${element["Last Name"]}");
        preferences.setString("passwordUser", "${element["Password"]}");
        preferences.setString("userEmail", email);
        preferences.setString("userPhoneNo", "${element["Phone Number"]}");
        preferences.setString("profileImg", "${element["profileImg"]}");


        Provider.of<GoogleSignInProvider>(context,listen: false).saveUserData(userModel(email: email, phoneNumber: "${element["Phone Number"]}", fName: "${element["First Name"]}",profileImg: "${element["profileImg"]}", password: "${element["Password"]}"));

      });


      Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => new AnimatedBarExample()));



      Fluttertoast.showToast(
          msg: "Login Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFF1E272E),
          textColor: Colors.white,
          fontSize: 16.0
      );



      return user;
    }
    catch(e){
      Fluttertoast.showToast(
          msg: "Incorrect Email or Password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFF1E272E),
          textColor: Colors.white,
          fontSize: 16.0
      );
      return e;
    }
  }

  Future<dynamic> handleSignUp(email, password,phoneNumber,firstName,lastName) async {

    try{

      UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: password);
      final User user = result.user!;

      //return user;
      return "done";

    }catch(e){
      print(e);
      return "fail";

    }

  }

}

class FirebaseApi {

  static UploadTask? uploadFile(String destination, File file,){
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(file);
    } on FirebaseException catch (e){
      return null;
    }




  }
}
