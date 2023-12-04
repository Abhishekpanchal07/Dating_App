import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendMessageScreen extends StatefulWidget {
  const SendMessageScreen({super.key});

  @override
  State<SendMessageScreen> createState() => _SendMessageScreenState();
}

class _SendMessageScreenState extends State<SendMessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(
          top: DimensionConstants.d43.h,
          right: DimensionConstants.d20.w,
          left: DimensionConstants.d20.w
        ),
        child: SingleChildScrollView(
          child: Column(
            
            children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: ImageView(path: ImageConstants.leftArrowIcon,)),
              SizedBox(
                height: DimensionConstants.d63.h,
              ),
             const ImageView(path: ImageConstants.sendMessageScreenPic,),
             SizedBox(
              height: DimensionConstants.d21.h,
             ),
             const Text(StringConstants.sendMessageScreenText).bold(ColorConstant.red, TextAlign.center, DimensionConstants.d30.sp),
             const Text(StringConstants.sendMessageScreenText1).regularText(ColorConstant.black, TextAlign.center, DimensionConstants.d14.sp),
             SizedBox(
              height: DimensionConstants.d20.h,
             ),
             GestureDetector(
              onTap: () => Navigator.pushNamed(context, RouteConstants.inboxScreen),
               child: Container(
                height: DimensionConstants.d56.h,
                width: DimensionConstants.d256.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(DimensionConstants.d10),
                  gradient: const LinearGradient(colors: [
                    ColorConstant.bottongradientcolor1,
                    ColorConstant.buttongradientcolor2
                  ]),
                  
                ),
                child: Center(
                  child: const Text(StringConstants.sendMessage).regularText(ColorConstant.textcolor, TextAlign.center, DimensionConstants.d16.sp),
                )
               ),
             ),
             SizedBox(
              height: DimensionConstants.d20.h,
             ),
             GestureDetector(
              onTap:() => Navigator.pop(context) ,
               child: Container(
                height: DimensionConstants.d56.h,
                width: DimensionConstants.d256.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(DimensionConstants.d10),
                 color: ColorConstant.dashboardGradientColor1.withOpacity(0.1)
                  
                ),
                child: Center(
                  child: const Text(StringConstants.keepSwiping).regularText(ColorConstant.red, TextAlign.center, DimensionConstants.d16.sp),
                )
               ),
             ),
             SizedBox(
              height: DimensionConstants.d118.h,
             ),

            ],
          ),
        ),
      ),
    );
  }
}