import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final dynamic color;
  final double fontsize;
  final VoidCallback onPressed;
  final dynamic textcolor;
  final dynamic fontweight;

  const CustomButton(
      {Key? key,
        required this.height,
        required this.width,
        required this.text,
        required this.color,
        required this.fontsize,
        required this.onPressed,
        required this.textcolor,
        required this.fontweight,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: textcolor,
                fontSize: fontsize,
                fontFamily: 'Quicksand',fontWeight: fontweight

            ),
          ),
        ),
      ),
    );
  }
}


class CustomButton2 extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final dynamic color;
  final double fontsize;
  final VoidCallback onPressed;
  final dynamic textcolor;
  final dynamic fontweight;

  const CustomButton2(
      {Key? key,
        required this.height,
        required this.width,
        required this.text,
        required this.color,
        required this.fontsize,
        required this.onPressed,
        required this.textcolor,
        required this.fontweight,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
         color: color,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.white,
            width: 2,
          )
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: textcolor,
                fontSize: fontsize,
                fontFamily: 'Quicksand',fontWeight: fontweight

            ),
          ),
        ),
      ),
    );
  }
}