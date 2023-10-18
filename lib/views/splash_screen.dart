import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';


class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: DimensionConstants.d191.h, bottom: DimensionConstants.d46.h),
        // height: double.infinity,
        // width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: AlignmentDirectional.bottomEnd,
              colors: [
                ColorConstant.bggradientcolor1,
                ColorConstant.bggradientcolor2,
              ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(ImageConstants.splashimage),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, RouteConstants.findYourMatchScreen),
              child: getStarted()),
          ],
        ),
      ),
    );
  }

  Widget getStarted() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GradientText(
                  StringConstants.getStarted,
                  colors: const [
                    ColorConstant.colorF53F77,
                    ColorConstant.color8948EF
                  ],
                  style: TextStyle(
                      fontFamily: StringConstants.familyName,
                      fontWeight: FontWeight.w600,
                      fontSize: DimensionConstants.d20.sp),
                ),
       
        SizedBox(
          width: DimensionConstants.d4.w,
        ),
        Image.asset(
          ImageConstants.rightarrow,
          height: DimensionConstants.d24.h,
          width: DimensionConstants.d24.w,
        ),
      ],
    );
  }
}





