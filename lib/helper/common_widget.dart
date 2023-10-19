import 'package:another_flushbar/flushbar.dart';
import 'package:demoapp/constants/Dimension_Constant.dart';
import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/decoration_constants.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonWidgets {
  static Widget commonButton(String text) {
    return Container(
      height: DimensionConstants.d60.h,
      width: DimensionConstants.d200.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DimensionConstants.d40.r),
        gradient: const LinearGradient(colors: [
          ColorConstant.bottongradientcolor1,
          ColorConstant.bottongradientcolor2
        ]),
      ),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontSize: DimensionConstants.d16.h,
            fontWeight: FontWeight.w500,
            fontFamily: StringConstants.familyName),
      )),
    );
  }

  static Widget gradientBorderButton(
    String text,
  ) {
    return Container(
      width: DimensionConstants.d373.w,
      height: DimensionConstants.d60.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DimensionConstants.d10.w),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ColorConstant.buttongradientcolor1,
                ColorConstant.buttongradientcolor2
              ])),
      child: Container(
        width: DimensionConstants.d368.w,
        height: DimensionConstants.d55.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DimensionConstants.d9.w),
          color: ColorConstant.buttonbgcolor,
        ),
        alignment: Alignment.center,
        child: Text(text).regularText(ColorConstant.headingcolor,
            TextAlign.center, DimensionConstants.d20.h),
      ),
    );
  }

// gradient textfield

  static Widget gradientTextField(
    BuildContext context, {
    TextEditingController? controllerName,
    String? textFieldHintText,
    String? commonTextFieldErrorMessage,
    String? validationvalue,
    String? validationErrorMessage,
    Widget? suffixicon,
    bool? value,
    VoidCallback? onTap,
  }) {
    return Container(
      width: DimensionConstants.d374.w,
      height: DimensionConstants.d60.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DimensionConstants.d10.w),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                ColorConstant.buttongradientcolor1,
                ColorConstant.bottongradientcolor2,
              ])),
      child: Container(
        width: DimensionConstants.d370.w,
        height: DimensionConstants.d55.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DimensionConstants.d9.w),
          color: ColorConstant.buttonbgcolor,
        ),
        child: TextFormField(
          controller: controllerName,
          readOnly: value ?? false,
          onTap: onTap,
          decoration: ViewDecoration.inputDecorationWithCurve(
              textFieldHintText!,
              suffixIcon: suffixicon),
        ),
      ),
    );
  }

  static Widget getsvgpicture(String path) {
    return SvgPicture.asset(path);
  }

  static dynamic showflushbar(BuildContext context, String text) {
    return Flushbar(
      message: text,
      duration: Duration(seconds: DimensionConstants.d3.toInt()),
      messageColor: ColorConstant.textcolor,
      backgroundGradient: const LinearGradient(colors: [
        ColorConstant.bottongradientcolor1,
        ColorConstant.bottongradientcolor2
      ]),
      flushbarPosition: FlushbarPosition.BOTTOM,
      borderRadius: BorderRadius.circular(DimensionConstants.d20),
      margin: const EdgeInsets.all(DimensionConstants.d20),
    ).show(context);
  }

  static void emailAndPasswordVerification(BuildContext context,
      {emailcontroller, passwordController, confirmPasswordcontroller, String? routerName}) {
    if (emailcontroller.text.isEmpty) {
      CommonWidgets.showflushbar(context, StringConstants.unFillEmailText);
    } else if (!RegExp(StringConstants.emailVerificationText)
        .hasMatch(emailcontroller.text)) {
      CommonWidgets.showflushbar(context, StringConstants.emailErrorText);
    } else if (passwordController.text.isEmpty) {
      CommonWidgets.showflushbar(context, StringConstants.unFillPasswordText);
    } else if (passwordController.text.length < 8) {
      CommonWidgets.showflushbar(
          context, StringConstants.passwordLengthErrorText);
    } else if (!RegExp(StringConstants.passwordVerificationText)
        .hasMatch(passwordController.text)) {
      CommonWidgets.showflushbar(context, StringConstants.passwordErrorText);
    } else if (confirmPasswordcontroller.text.isEmpty) {
      CommonWidgets.showflushbar(
          context, StringConstants.unFillConfirmPassword);
    } else if (confirmPasswordcontroller.text != passwordController.text) {
      CommonWidgets.showflushbar(context, StringConstants.confirmPasswordError);
    } else {
      Navigator.pushNamed(context,RouteConstants.loginScreen );
    }
  }

  //gradient container
  static Widget gradientContainer(
      {String? text, String? imagePath,
       VoidCallback? ontap,
       double? height,
       double? innerContainerHeight,
       FontWeight? fontweight,
       Color? textcolor,
       double? paddingFromTop,
       double? paddingFromBottom}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          width: DimensionConstants.d374.w,
          height: height ?? DimensionConstants.d60.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(DimensionConstants.d10.w),
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorConstant.buttongradientcolor1,
                    ColorConstant.gradientContainerColor,
                  ])),
          child: Container(
              width: DimensionConstants.d370.w,
              height:  innerContainerHeight ?? DimensionConstants.d55.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(DimensionConstants.d9.w),
                color: ColorConstant.buttonbgcolor,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: paddingFromTop ?? DimensionConstants.d20.h,
                    left: DimensionConstants.d18.w,
                    bottom: paddingFromBottom ?? DimensionConstants.d13.h,
                    right: DimensionConstants.d14.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text!,
                      style: TextStyle(
                          color: textcolor ?? ColorConstant.headingcolor,
                          fontSize: DimensionConstants.d16.h,
                          fontWeight:  fontweight ?? FontWeight.w500,
                          fontFamily: StringConstants.familyName),
                    ),
                    ImageView(
                      path: imagePath,
                    )
                  ],
                ),
              ))),
    );
  }

  static void profileScreenValidation(
    BuildContext context, {
    TextEditingController? firstNameController,
    TextEditingController? lastNameController,
    TextEditingController? aboutNameController,
    TextEditingController? dobNameController,
    String? genderValue,
    String? horoscopeValue,
  }) {
    if (firstNameController!.text.isEmpty) {
      showflushbar(context, StringConstants.firstNameErrortextProfileScreen);
    } else if (lastNameController!.text.isEmpty) {
      showflushbar(context, StringConstants.lastNameErrortextProfileScreen);
    } else if (aboutNameController!.text.isEmpty) {
      showflushbar(context, StringConstants.aboutNameErrortextProfileScreen);
    } else if (dobNameController!.text.isEmpty) {
      showflushbar(context, StringConstants.dobNameErrortextProfileScreen);
    } else if (horoscopeValue == null) {
      showflushbar(context, StringConstants.horoscopeErrortextProfileScreen);
    } else if (genderValue == null) {
      showflushbar(context, StringConstants.genderErrortextProfileScreen);
    } else {
      Navigator.pushNamed(context, RouteConstants.interestScreen);
    }
  }

  static Widget gridViewContainer(String containerText) {
    return Container(
        height: DimensionConstants.d60.h,
        width: DimensionConstants.d178.w,
        decoration: BoxDecoration(
          color: ColorConstant.buttonbgcolor,
          borderRadius: BorderRadius.circular(DimensionConstants.d10.r),
        ),
        child: Center(
          child: Text(containerText).regularText(ColorConstant.headingcolor,
              TextAlign.center, DimensionConstants.d14.sp),
        ));
  }

  static Widget gradientGridViewContainer(String containerText) {
    return Container(
      height: DimensionConstants.d60.h,
      width: DimensionConstants.d178.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              ColorConstant.bottongradientcolor1,
              ColorConstant.bottongradientcolor2
            ]),
        borderRadius: BorderRadius.circular(DimensionConstants.d12.r),
      ),
      child: Container(
        height: DimensionConstants.d58.h,
        width: DimensionConstants.d173.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorConstant.buttonbgcolor,
          borderRadius: BorderRadius.circular(DimensionConstants.d12.r),
        ),
        child: Text(containerText).regularText(ColorConstant.headingcolor,
            TextAlign.center, DimensionConstants.d14.sp),
      ),
    );
  }

  // Add photos Conatiner

  static Widget addPhotosGriedViewContainer(
      String? imagePathforAddPhotoContainer) {
    return Container(
      height: DimensionConstants.d139.h,
      width: DimensionConstants.d111.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DimensionConstants.d15.r),
      ),
      child: Center(child: ImageView(path: imagePathforAddPhotoContainer)),
    );
  }
  // for filterScreen validation

  static void filterScreenValidation(
    BuildContext context, {
    String? genderValue,
    String? selectedLanguage,
    String? selectedAge,
    String? selectedFriendshipInterest,
  }) {
    if (selectedFriendshipInterest == null) {
      showflushbar(context, StringConstants.filterScreenErrorMessage);

    }
      else if (genderValue == null) {
      showflushbar(context, StringConstants.filterScreenErrorMessage1);
    }
     else if (selectedAge == null) {
      showflushbar(context, StringConstants.filterScreenErrorMessage2);
    } 
     else if (selectedLanguage == null) {
      showflushbar(context, StringConstants.filterScreenErrorMessage3);
    }

     else {
      Navigator.pushNamed(context, RouteConstants.addPhotoScreen);
    }
  }
  // user chat card 
  static Widget userchatCard({String? imagepath,String? username,String? userMessage}) {
    return Row(
      children: [
        Container(
          height: DimensionConstants.d57.h,
          width: DimensionConstants.d57.w,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: ImageView(
             height: DimensionConstants.d57.h,
          width: DimensionConstants.d57.w,
            circleCrop: true,
            fit: BoxFit.cover,
            path: imagepath,
          ),
        ),
        SizedBox(
          width: DimensionConstants.d15.w,
        ),
       Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(username!).regularText(ColorConstant.black, TextAlign.center,
                      DimensionConstants.d19.sp),
                  Text(userMessage!).regularText(ColorConstant.black.withOpacity(0.4),
                      TextAlign.center, DimensionConstants.d19.sp),
                ],
              ),
        
               Container(
              height: DimensionConstants.d24.h,
              width: DimensionConstants.d24.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        ColorConstant.dashboardGradientColor1,
                        ColorConstant.inboxScreenGradientColor
                      ])),
              child: Center(
                child: const Text("1").regularText(ColorConstant.textcolor,
                    TextAlign.center, DimensionConstants.d13.sp),
              ))
            ],
          ),
        ),
      ],
    );
  }
}
