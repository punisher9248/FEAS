import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fyp_feas/All_Screens/UserAuth/user_auth_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => UserAuthentication()));});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Center(
              child: Image.asset("assets/images/feaslogo.png"),
              ),

          
        ],
      ),

    );
  }
}
