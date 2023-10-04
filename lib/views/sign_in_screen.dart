import 'package:demoapp/constants/Image_Constants.dart';
import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: DimensionConstants.d214.h,left: DimensionConstants.d20.w,right: DimensionConstants.d20.w),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
            ColorConstant.bggradientcolor1,
            ColorConstant.bggradientcolor2,
          ])
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Image.asset(ImageConstants.signInScreenImage,height: DimensionConstants.d87.h,width: DimensionConstants.d193.w,),
           SizedBox(
            height: DimensionConstants.d30.h,
           ),
           const Text("lorem ipsum dolor sit amet, consectetur").regularText(ColorConstant.headingcolor, TextAlign.center, DimensionConstants.d16.sp),
            const Text("adipiscing edit, sed do eiusmod tempor").regularText(ColorConstant.headingcolor, TextAlign.center, DimensionConstants.d16.sp),
             const Text("incididunt ut labore").regularText(ColorConstant.headingcolor, TextAlign.center, DimensionConstants.d16.sp),
             SizedBox(
            height: DimensionConstants.d20.h,
           ),
           CommonWidgets.gradientBorderButton("Create Account"),
             SizedBox(
            height: DimensionConstants.d20.h,
           ),
            CommonWidgets.gradientBorderButton("Sign In"),
             SizedBox(
            height: DimensionConstants.d20.h,
           ),
           const Text("Trouble signing In ?").regularText(ColorConstant.headingcolor, TextAlign.center, DimensionConstants.d20.sp)
  

          ],
        ),
      ),
    );
  }
}