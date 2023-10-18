import 'package:demoapp/constants/Dimension_Constant.dart';
import 'package:demoapp/constants/Image_Constants.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindYourBestMatchScreen extends StatelessWidget {
  const FindYourBestMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: DimensionConstants.d87.h,
        ),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              ColorConstant.bggradientcolor1,
              ColorConstant.bggradientcolor2
            ])),
        child: Column(
          children: [
            getStarted(),
           GestureDetector(
            onTap: () => Navigator.pushNamed(context, RouteConstants.signInScreen),
            child: CommonWidgets.commonButton(StringConstants.startdatingText)),
          
          ],
        ),
      ),
    );
  }
}

Widget getStarted() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text("Online Dating App").mediumText(ColorConstant.headingcolor,
          TextAlign.center, DimensionConstants.d16.sp),
      SizedBox(
        height: DimensionConstants.d20.h,
      ),
      const Text("Find Your").bold(ColorConstant.headingcolor, TextAlign.center,
          DimensionConstants.d40.sp),
      const Text("best match").bold(ColorConstant.headingcolor,
          TextAlign.center, DimensionConstants.d40.sp),
      SizedBox(
        height: DimensionConstants.d20.h,
      ),
      const Text("Amet minim mollit non desurent").mediumText(
          ColorConstant.screen1textcolor,
          TextAlign.center,
          DimensionConstants.d16.sp),
      const Text("ullamco est aliqua").mediumText(
          ColorConstant.lightred, TextAlign.center, DimensionConstants.d16.sp),
      SizedBox(
        height: DimensionConstants.d80.h,
      ),
      Image.asset(
        ImageConstants.findyourmatch,
        height: DimensionConstants.d410.h,
        width: DimensionConstants.d440.w,
      ),
      SizedBox(
        height: DimensionConstants.d10.h,
      ),
    
    ],
  );
}
