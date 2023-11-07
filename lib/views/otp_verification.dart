import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

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
  final formkey = GlobalKey<FormState>();
  late FocusNode otpValue1;
  late FocusNode otpValue2;
  late FocusNode otpValue3;
  late FocusNode otpValue4;
  bool onClick = false;
  @override
  void initState() {
    super.initState();
    otpValue1 = FocusNode();
    otpValue2 = FocusNode();
    otpValue3 = FocusNode();
    otpValue4 = FocusNode();
  }

  @override
  void dispose() {
    otpValue1.dispose();
    otpValue2.dispose();
    otpValue3.dispose();
    otpValue4.dispose();

    super.dispose();
  }

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
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () =>
                      Navigator.pop(context),
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
                  verifyOTpContainer(
                      otpValue: otpController,
                      controllerName: otpController,
                      focusnodeValue: otpValue1,
                      focusRequestValue: otpValue2),
                  SizedBox(
                    width: DimensionConstants.d20.w,
                  ),
                  verifyOTpContainer(
                      otpValue: otpController1,
                      controllerName: otpController1,
                      focusnodeValue: otpValue2,
                      focusRequestValue: otpValue3),
                  SizedBox(
                    width: DimensionConstants.d20.w,
                  ),
                  verifyOTpContainer(
                      otpValue: otpController2,
                      controllerName: otpController2,
                      focusnodeValue: otpValue3,
                      focusRequestValue: otpValue4),
                  SizedBox(
                    width: DimensionConstants.d20.w,
                  ),
                  verifyOTpContainer(
                      otpValue: otpController3,
                      controllerName: otpController3,
                      focusnodeValue: otpValue4,
                      focusRequestValue: otpValue4),

                 
                ],
              ),
              SizedBox(
                height: DimensionConstants.d30.h,
              ),
              GestureDetector(
                  onTap: () {
                    verifyOTP(
                        otpcontroller1: otpController,
                        otpcontroller2: otpController1,
                        otpcontroller3: otpController2,
                        otpcontroller4: otpController3);
                  },
                  child: CommonWidgets.commonButton(StringConstants.submit)),
              SizedBox(
                height: DimensionConstants.d30.h,
              ),
              GradientText(
                StringConstants.resendOtp,
                colors: const [
                  ColorConstant.colorF53F77,
                  ColorConstant.color8948EF
                ],
                style: TextStyle(
                    fontFamily: StringConstants.familyName,
                    fontWeight: FontWeight.w400,
                    fontSize: DimensionConstants.d16.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
  // OTP Container

  Widget verifyOTpContainer(
      {TextEditingController? controllerName,
      TextEditingController? otpValue,
      FocusNode? focusnodeValue,
      FocusNode? focusRequestValue}) {
    return Container(
        height: DimensionConstants.d67.h,
        width: DimensionConstants.d67.w,
        alignment: Alignment.center,
        decoration: otpValue!.text.isEmpty
            ? const BoxDecoration(
                shape: BoxShape.circle, color: ColorConstant.color979797)
            : const BoxDecoration(
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
            child: TextFormField(
              focusNode: focusnodeValue,
              onChanged: (value) {
                setState(() {
                  otpValue.text = value;
                });
                if (value.isEmpty && focusnodeValue == otpValue1) {
                  
                  FocusScope.of(context).requestFocus(otpValue1);
                }
              else  if (value.length == 1) {
                  focusnodeValue!.unfocus();
                  FocusScope.of(context).requestFocus(focusRequestValue);
                } else if (value.isEmpty) {
                  FocusScope.of(context).previousFocus();
                } else if (value.isEmpty && focusnodeValue == otpValue1) {
                  FocusScope.of(context).previousFocus();
                }
              },
              controller: controllerName,
              // textInputAction: TextInputAction.next,
              autofocus: true,
              keyboardType: TextInputType.number,
              maxLength: 1,
              textAlign: TextAlign.center,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: "",
              ),
              onFieldSubmitted: (term) {
                focusnodeValue!.unfocus();
                FocusScope.of(context).requestFocus(focusRequestValue);
              },
            ),
          ),
        ));
  }
  // Widget verifyOTpContainer() {
  //   return Container(
  //       height: DimensionConstants.d67.h,
  //       width: DimensionConstants.d67.w,
  //       alignment: Alignment.center,
  //       decoration: const BoxDecoration(
  //           shape: BoxShape.circle, color: ColorConstant.color979797),
  //       child: Container(
  //         height: DimensionConstants.d63.h,
  //         width: DimensionConstants.d63.w,
  //         alignment: Alignment.center,
  //         decoration: const BoxDecoration(
  //             shape: BoxShape.circle, color: ColorConstant.textcolor),
  //         child: const Center(
  //           child: Text(""),
  //         ),
  //       ));
  // }

  // OTP Verification Function
  void verifyOTP({
    TextEditingController? otpcontroller1,
    TextEditingController? otpcontroller2,
    TextEditingController? otpcontroller3,
    TextEditingController? otpcontroller4,
  }) {
    if (otpcontroller1!.text.isEmpty &&
        otpcontroller2!.text.isEmpty &&
        otpcontroller3!.text.isEmpty &&
        otpcontroller4!.text.isEmpty) {
      CommonWidgets.showflushbar(context, StringConstants.unfillOTPErrorText);
    } else if (otpcontroller1.text.isEmpty ||
        otpcontroller2!.text.isEmpty ||
        otpcontroller3!.text.isEmpty ||
        otpcontroller4!.text.isEmpty) {
      CommonWidgets.showflushbar(context, StringConstants.unfillOTPErrorText);
    } else {
      Navigator.pushNamed(context, RouteConstants.createNewPasswordScreen);
    }
  }
}
