import 'package:demoapp/constants/Image_Constants.dart';
import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SignInOptionScreen extends StatelessWidget {
  const SignInOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: DimensionConstants.d43.h,
        left: DimensionConstants.d20.w,
        right: DimensionConstants.d20.w),
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
            Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(context,RouteConstants.signInScreen),
                      child: const ImageView(
                        path: ImageConstants.leftArrowIcon,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: DimensionConstants.d88.h,
                  ),
           Image.asset(ImageConstants.signInScreenImage,height: DimensionConstants.d87.h,width: DimensionConstants.d193.w,),
           SizedBox(
            height: DimensionConstants.d30.h,
           ),
           const Text(StringConstants.dummyText).regularText(ColorConstant.headingcolor, TextAlign.center, DimensionConstants.d16.sp),
            const Text(StringConstants.dummyText1).regularText(ColorConstant.headingcolor, TextAlign.center, DimensionConstants.d16.sp),
             const Text(StringConstants.dummyText2).regularText(ColorConstant.headingcolor, TextAlign.center, DimensionConstants.d16.sp),
             SizedBox(
            height: DimensionConstants.d20.h,
           ),
           GestureDetector(
            onTap: () => Navigator.pushNamed(context, RouteConstants.loginScreen),
            child: CommonWidgets.gradientBorderButton(StringConstants.signInWithApple)),
             SizedBox(
            height: DimensionConstants.d20.h,
           ),
           GestureDetector(
            onTap: () => Navigator.pushNamed(context, RouteConstants.loginScreen),
            child: CommonWidgets.gradientBorderButton(StringConstants.signInWithEmail)),
             SizedBox(
            height: DimensionConstants.d20.h,
           ),
            CommonWidgets.gradientBorderButton(StringConstants.signInWithPhone),
             SizedBox(
            height: DimensionConstants.d20.h,
           ),
         GestureDetector(
          onTap: () => Navigator.pushNamed(context, RouteConstants.recoverAccountScreen),
          child:   const Text(StringConstants.signInTroubleText).regularText(ColorConstant.headingcolor, TextAlign.center, DimensionConstants.d20.sp),
         )
  

          ],
        ),
      ),
    );
  }
}