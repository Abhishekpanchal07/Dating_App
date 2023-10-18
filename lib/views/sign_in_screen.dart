import 'package:demoapp/constants/Image_Constants.dart';
import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
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
           const Text(StringConstants.signInScreenDummyText).regularText(ColorConstant.headingcolor, TextAlign.center, DimensionConstants.d16.sp),
            const Text(StringConstants.signInScreenDummyText1).regularText(ColorConstant.headingcolor, TextAlign.center, DimensionConstants.d16.sp),
             const Text(StringConstants.signInScreenDummyText2).regularText(ColorConstant.headingcolor, TextAlign.center, DimensionConstants.d16.sp),
             SizedBox(
            height: DimensionConstants.d20.h,
           ),
           GestureDetector(
            onTap: () => Navigator.pushNamed(context, RouteConstants.signInWithNameScreen),
            child: CommonWidgets.gradientBorderButton(StringConstants.createNewAccount)),
             SizedBox(
            height: DimensionConstants.d20.h,
           ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, RouteConstants.signInOptionScreen),
              child: CommonWidgets.gradientBorderButton(StringConstants.signInText)),
             SizedBox(
            height: DimensionConstants.d20.h,
           ),
           GestureDetector(
             onTap: () => Navigator.pushNamed(context, RouteConstants.recoverAccountScreen),
             child: const Text(StringConstants.signInTroubleText).regularText(ColorConstant.headingcolor, TextAlign.center, DimensionConstants.d20.sp) ,
           )
           
  

          ],
        ),
      ),
    );
  }
}