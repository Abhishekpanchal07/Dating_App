import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/Color_Constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
                ColorConstant.bottongradientcolor1,
                ColorConstant.bggradientcolor2,
              ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(ImageConstants.splashimage),
            getStarted(),
          ],
        ),
      ),
    );
  }

  Widget getStarted() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(StringConstants.getText).semiBold(ColorConstant.bottongradientcolor1,TextAlign.center,DimensionConstants.d20.sp),
        const Text(StringConstants.startedText).semiBold(ColorConstant.bottongradientcolor2,TextAlign.center,DimensionConstants.d20.sp),
       
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





