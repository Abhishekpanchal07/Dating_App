import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final otpController = TextEditingController();
  final otpController1 = TextEditingController();
  final otpController2 = TextEditingController();
  final otpController3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(
            top: DimensionConstants.d43.h,
            left: DimensionConstants.d20.w,
            right: DimensionConstants.d20.w),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ColorConstant.bggradientcolor1,
                ColorConstant.bggradientcolor2
              ]),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, RouteConstants.loginScreen),
                child: const ImageView(
                  path: ImageConstants.leftArrowIcon,
                ),
              ),
            ),
            SizedBox(
              height: DimensionConstants.d187.h,
            ),
            const Text(StringConstants.verify).mediumText(
                ColorConstant.headingcolor,
                TextAlign.center,
                DimensionConstants.d36.sp),
            SizedBox(
              height: DimensionConstants.d15.h,
            ),
            const Text(StringConstants.enterOtp).regularText(
                ColorConstant.headingcolor,
                TextAlign.center,
                DimensionConstants.d16.sp),
            SizedBox(
              height: DimensionConstants.d15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                verifyOTpGradientContainer(otpController),
                SizedBox(
                  width: DimensionConstants.d20.w,
                ),
                verifyOTpGradientContainer(otpController1),
                SizedBox(
                  width: DimensionConstants.d20.w,
                ),
                verifyOTpGradientContainer(otpController2),
                SizedBox(
                  width: DimensionConstants.d20.w,
                ),
                verifyOTpGradientContainer(otpController3),
              ],
            ),
              SizedBox(
              height: DimensionConstants.d15.h,
            ),
            GestureDetector(
                onTap: () {
                  CommonWidgets.emailAndPasswordVerification(
                    context,
                  );
                },
                child: CommonWidgets.commonButton(StringConstants.submit)),
          ],
        ),
      ),
    );
  }

  Widget verifyOTpGradientContainer( TextEditingController?controllerName) {
    return Container(
        height: DimensionConstants.d67.h,
        width: DimensionConstants.d67.w,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: [
            ColorConstant.colorEC356E,
            ColorConstant.dashboardGradientColor1
          ]),
        ),
        child: Container(
          height: DimensionConstants.d63.h,
          width: DimensionConstants.d63.w,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: ColorConstant.textcolor),
          child: Center(
            child: TextField(
              
              onChanged: (value) {
                if(value.length == 1 && value.length <= 4 ){
                  FocusScope.of(context).nextFocus();
                }
                else if (value.isEmpty  ){
                  FocusScope.of(context).previousFocus();
                }

              },
              controller: controllerName,
              autofocus: true,
              keyboardType: TextInputType.number,
              maxLength: 1,
              textAlign: TextAlign.center,
              inputFormatters: [],
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: "",
              ),
            ),
          ),
        ));
  }
}
