import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'colors.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';


class CustomEditField extends StatelessWidget {
  final TextEditingController controller;
  final double width ;
  final double height;
  final String hintText;
  final String image;
  final dynamic bordercolor;
  final dynamic hintextcolor;
  final double borderwidth;
  final dynamic textcolor;

  const CustomEditField(
      {Key? key,
        required this.width,
        required this.height,
        required this.hintText,
        required this.controller,
        required this.image,

        this.bordercolor, this.hintextcolor,  required this.borderwidth, this.textcolor,
      })
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: borderwidth, color: bordercolor),
        ),

        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            children: [

              Image.asset(image),
              SizedBox(width: 10,),
              Expanded(child: TextField(
                controller: controller,
                style: TextStyle(
                    fontFamily: 'Quicksand',fontWeight: FontWeight.w400,
                    color: textcolor
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color:  hintextcolor,
                    fontWeight: FontWeight.w500,
                    fontSize: Get.height * 0.019,
                  ),
                ),
              ),)
            ],
          ),
        )
    );
  }
}




class CustomEditField3 extends StatelessWidget {
  final TextEditingController controller;
  final double width ;
  final double height;
  final String hintText;
  final dynamic bordercolor;
  final dynamic hintextcolor;
  final double borderwidth;
  final dynamic textcolor;

  const CustomEditField3(
      {Key? key,
        required this.width,
        required this.height,
        required this.hintText,
        required this.controller,


        this.bordercolor, this.hintextcolor,  required this.borderwidth, this.textcolor,
      })
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: borderwidth, color: bordercolor),
        ),

        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [

              SizedBox(width: 10,),
              Expanded(child: TextField(
                controller: controller,
                style: TextStyle(
                    fontFamily: 'Quicksand',fontWeight: FontWeight.w400,
                    color: textcolor
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color:  hintextcolor,
                    fontWeight: FontWeight.w500,
                    fontSize: Get.height * 0.019,
                  ),
                ),
              ),)
            ],
          ),
        )
    );
  }
}

class CustomEditField4 extends StatelessWidget {
  final TextEditingController controller;
  final double width ;
  final double height;
  final String hintText;
  final String image;
  final dynamic bordercolor;
  final dynamic hintextcolor;
  final double borderwidth;
  final dynamic textcolor;

  const CustomEditField4(
      {Key? key,
        required this.width,
        required this.height,
        required this.hintText,
        required this.controller,
        required this.image,

        this.bordercolor, this.hintextcolor,  required this.borderwidth, this.textcolor,
      })
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: borderwidth, color: bordercolor),
        ),

        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [

              SizedBox(width: 10,),
              Expanded(child: TextField(
                controller: controller,
                style: TextStyle(
                    fontFamily: 'Quicksand',fontWeight: FontWeight.w400,
                    color: textcolor
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color:  hintextcolor,
                    fontWeight: FontWeight.w500,
                    fontSize: Get.height * 0.019,
                  ),
                ),
              ),),
              Spacer(),


              SizedBox(width: 20,)
            ],
          ),
        )
    );
  }
}


class CustomEditField5 extends StatelessWidget {
  final TextEditingController controller;
  final double width ;
  final double height;
  final String hintText;
  final String image;
  final String image2;
  final dynamic bordercolor;
  final dynamic hintextcolor;
  final double borderwidth;
  final dynamic textcolor;

  const CustomEditField5(
      {Key? key,
        required this.width,
        required this.height,
        required this.hintText,
        required this.controller,
        required this.image,

        this.bordercolor, this.hintextcolor,  required this.borderwidth, this.textcolor, required this.image2,
      })
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: borderwidth, color: bordercolor),
        ),

        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [

              Image.asset(image),
              SizedBox(width: 10,),

              Expanded(child: TextField(
                controller: controller,
                style: TextStyle(
                    fontFamily: 'Quicksand',fontWeight: FontWeight.w400,
                    color: textcolor
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color:  hintextcolor,
                    fontWeight: FontWeight.w500,
                    fontSize: Get.height * 0.019,
                  ),
                ),
              ),),

              Image.asset(image2),
              SizedBox(width: 10,),
            ],
          ),
        )
    );
  }
}



class CustomEditField6 extends StatelessWidget {
  final TextEditingController controller;
  final double width ;
  final double height;
  final String hintText;
  final dynamic bordercolor;
  final dynamic hintextcolor;
  final double borderwidth;
  final dynamic textcolor;

  const CustomEditField6(
      {Key? key,
        required this.width,
        required this.height,
        required this.hintText,
        required this.controller,


        this.bordercolor, this.hintextcolor,  required this.borderwidth, this.textcolor,
      })
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: borderwidth, color: bordercolor),
        ),

        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: [

              SizedBox(width: 10,),
              Expanded(child: TextField(
                controller: controller,
                style: TextStyle(
                    fontFamily: 'Quicksand',fontWeight: FontWeight.w400,
                    color: textcolor
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color:  hintextcolor,
                    fontWeight: FontWeight.w500,
                    fontSize: Get.height * 0.019,
                  ),
                ),
              ),)
            ],
          ),
        )
    );
  }
}

class CustomEditField2 extends StatelessWidget {
  final TextEditingController controller;
  final double width ;
  final double height;
  final String hintText;
  final String image;
  final dynamic bordercolor;
  final dynamic hintextcolor;
  final double borderwidth;
  final dynamic textcolor;
  final SignUpController signupController;




  const CustomEditField2(
      {Key? key,
        required this.width,
        required this.height,
        required this.hintText,
        required this.controller,
        required this.image,
        this.bordercolor,
        this.hintextcolor,
        required this.borderwidth, this.textcolor, required this.signupController,

      })
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: borderwidth, color: bordercolor),
        ),

        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            children: [

              Image.asset(image),
              SizedBox(width: 15,),
              Expanded(
                child: Obx(
                      () => TextField(
                    controller: controller,
                    obscureText:
                    signupController.isPasswordHide.value ? true : false,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Quicksand',fontWeight: FontWeight.w400
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: Get.height * 0.019,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  signupController.togglePassword();
                },
                child: Obx(
                      () => Icon(
                    signupController.isPasswordHide.value
                        ? Icons.visibility_off_rounded
                        : Icons.remove_red_eye_rounded,
                    color: secondarycolor,
                  ),
                ),
              ),
              SizedBox(width: 5,)

            ],
          ),
        )
    );
  }
}

class CustomPassField extends StatelessWidget {
  final SignUpController signupController;
  final TextEditingController controller;
  final String hintText;
  final String img;
  final dynamic hinttextcolor;
  final double width ;
  final double height;


  const CustomPassField({
    Key? key,

    required this.hintText,
    required this.controller,
    required this.signupController, required this.img, required this.hinttextcolor, required this.width, required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width,
      height: height,

      padding:EdgeInsets.only(left: 15,right: 15),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          border: Border.all(color: Color(0xff4193B9), width: 2),
        borderRadius: BorderRadius.circular(20),

      ),
      child: Row(
        children: [

          Image.asset(img),
          SizedBox(width: 10,),

          Expanded(
            child: Obx(
                  () => TextField(
                controller: controller,
                obscureText:
                signupController.isPasswordHide.value ? true : false,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Quicksand',fontWeight: FontWeight.w400
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color:  hinttextcolor,
                    fontWeight: FontWeight.w500,
                    fontSize: Get.height * 0.019,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              signupController.togglePassword();
            },
            child: Obx(
                  () => Icon(
                signupController.isPasswordHide.value
                    ? Icons.visibility_off_rounded
                    : Icons.remove_red_eye_rounded,
                color: Colors.black,
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class SignUpController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  RxBool isPasswordHide = true.obs;
  RxBool rememeberMe = false.obs;

  void togglePassword() {
    isPasswordHide.value = !isPasswordHide.value;
  }
}

