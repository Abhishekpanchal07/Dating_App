import 'dart:io';

import 'package:demoapp/constants/Color_Constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/sharedperferences_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/services/api.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                height: DimensionConstants.d64.h,
              ),
              ImageView(
                path: ImageConstants.datingLogo,
                height: DimensionConstants.d87.h,
                width: DimensionConstants.d193.w,
              ),
              SizedBox(
                height: DimensionConstants.d40.h,
              ),
              Align(
                child: const Text(StringConstants.resetPassword).regularText(
                    ColorConstant.headingcolor,
                    TextAlign.start,
                    DimensionConstants.d24.sp),
                alignment: Alignment.centerLeft,
              ),
              SizedBox(
                height: DimensionConstants.d11.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(StringConstants.confirmEmailText).regularText(
                    ColorConstant.grey,
                    TextAlign.center,
                    DimensionConstants.d16.sp),
              ),
              SizedBox(
                height: DimensionConstants.d23.h,
              ),
              CommonWidgets.gradientTextField(
                context,
                textFieldHintText: StringConstants.emailText,
                controllerName: emailcontroller,
              ),
              SizedBox(
                height: DimensionConstants.d47.h,
              ),
              GestureDetector(
                  onTap: () {
                    if (emailcontroller.text.isEmpty) {
                      CommonWidgets.showflushbar(
                          context, StringConstants.unFillEmailText);
                    } else if (!RegExp(StringConstants.emailVerificationText)
                        .hasMatch(emailcontroller.text)) {
                      CommonWidgets.showflushbar(
                          context, StringConstants.emailErrorText);
                    } else {
                      hitUserForgetPassword(email: emailcontroller.text);
                    }
                  },
                  child:
                      CommonWidgets.commonButton(StringConstants.continueText)),
            ],
          ),
        ),
      ),
    );
  }

  // hit forget Password Api
  Future<void> hitUserForgetPassword({String? email}) async {
    SharedPreferences getSavedValues = await SharedPreferences.getInstance();
    SharedPreferences getemailId = await SharedPreferences.getInstance();
    getemailId.setString(
        SharedpreferenceKeys.forgetPasswordEmailId, email.toString());
    try {
      final modal = await Api.forgetPassword(
          email: email,
          tokenValue: getSavedValues.getString(SharedpreferenceKeys.jwtToken));
      if (modal.success == true) {
        if (mounted) {
          CommonWidgets.showflushbar(context, modal.message.toString());
          Navigator.pushNamed(context, RouteConstants.otpVerificationScreen);
        }
      } else {
        if (mounted) {
          CommonWidgets.showflushbar(context, modal.message.toString());
        }
      }
    } on SocketException catch (e) {
      if (mounted) {
        CommonWidgets.showflushbar(context, e.toString());
      }
    }
  }
 
}
