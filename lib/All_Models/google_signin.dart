import 'package:flutter/material.dart';

class GoogleSignInProvider extends ChangeNotifier{

  //GoogleSignIn  googleSignIn = GoogleSignIn();
  userModel? userData;
  saveUserData(userModel value){
    userData=value;
    notifyListeners();
  }
//GoogleSignInAccount? _user;
//GoogleSignInAccount get user => _user!;

// Future googleLogin() async{
//   try {
//     final googleUser = await googleSignIn.signIn();
//     if (googleUser == null) return;
//     _user = googleUser;
//     final googleAuth = await googleUser.authentication;
//
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//     await FirebaseAuth.instance.signInWithCredential(credential);
//
//   }catch(e){
//     print(e.toString());
//
//   }
//   notifyListeners();
// }
//
// Future logout() async{
//   await googleSignIn.disconnect();
//   FirebaseAuth.instance.signOut();
//
// }




}


class userModel{

  String fName;
  String email;
  String phoneNumber;
  String profileImg;
  String password;


  userModel({required this.email,required this.phoneNumber,required this.fName, required this.profileImg,required this.password});
}
