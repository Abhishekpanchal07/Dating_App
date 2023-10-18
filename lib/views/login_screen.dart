import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isobsecure = true;
  bool ischeckbox = true;
  final formkey = GlobalKey<FormState>();
  final controller = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      isobsecure = !isobsecure;
      ischeckbox = !ischeckbox;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(
                top: DimensionConstants.d183.h,
                left: DimensionConstants.d20.w,
                right: DimensionConstants.d20.w),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  ColorConstant.bggradientcolor1,
                  ColorConstant.bggradientcolor2
                ])),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Image.asset(
                    ImageConstants.signInScreenImage,
                    width: DimensionConstants.d193.w,
                    height: DimensionConstants.d87.h,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                 Align(
                  alignment: Alignment.topLeft,
                  child:  const Text(StringConstants.loginScreenWelcomeText)
                      .regularText(ColorConstant.headingcolor, TextAlign.center,
                          DimensionConstants.d24.sp),
                 ),
                  SizedBox(
                    height: DimensionConstants.d8.h,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: const Text(StringConstants.loginScreenSignInText).regularText(
                      ColorConstant.grey,
                      TextAlign.center,
                      DimensionConstants.d16.sp),
                  ),
                  SizedBox(
                    height: DimensionConstants.d23.h,
                  ),
                  CommonWidgets.gradientTextField(
                    context,
                    controllerName:controller,
                    textFieldHintText: StringConstants.emailText,
                  ),
                  SizedBox(
                    height: DimensionConstants.d21.h,
                  ),
                  aminatedTextField(),
                  SizedBox(
                    height: DimensionConstants.d25.h,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(DimensionConstants.d10),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                ischeckbox = !ischeckbox;
                              });
                            },
                            child: ischeckbox
                                ? CommonWidgets.getsvgpicture(
                                    ImageConstants.markedCheckbox)
                                : CommonWidgets.getsvgpicture(
                                    ImageConstants.checkBox)),
                      ),
                      SizedBox(
                        width: DimensionConstants.d5.w,
                      ),
                      const Text(StringConstants.loginScreenRememberMe)
                          .regularText(ColorConstant.darkgrey, TextAlign.center,
                              DimensionConstants.d16.sp)
                    ],
                  ),
                  SizedBox(
                    height: DimensionConstants.d25.h,
                  ),
                  GestureDetector(
                      onTap: () {
                        CommonWidgets.emailAndPasswordVerification(context,
                            emailcontroller: controller,
                            passwordController: passwordController);
                      },
                      child: CommonWidgets.commonButton(
                          StringConstants.signInText)),
                  SizedBox(
                    height: DimensionConstants.d30.h,
                  ),
                  GestureDetector(
                    onTap:() => Navigator.pushNamed(context,RouteConstants.resetPasswordScreen ),
                    child: const Text(StringConstants.forgetPasswordText).regularText(
                      ColorConstant.pink,
                      TextAlign.center,
                      DimensionConstants.d14.sp),
                  )
                     
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget aminatedTextField() {
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
                ColorConstant.buttongradientcolor2,
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
          controller: passwordController,
          obscureText: isobsecure,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: StringConstants.passwordText,
              hintStyle: TextStyle(
                  fontFamily: StringConstants.familyName,
                  fontSize: DimensionConstants.d16.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorConstant.grey),
              contentPadding: EdgeInsets.symmetric(
                horizontal: DimensionConstants.d15.w,
                vertical: DimensionConstants.d14.h,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isobsecure = !isobsecure;
                    });
                  },
                  icon: isobsecure
                      ? Padding(
                          padding: const EdgeInsets.all(DimensionConstants.d5),
                          child: Padding(
                            padding:
                                const EdgeInsets.all(DimensionConstants.d0),
                            child: SvgPicture.asset(
                                ImageConstants.passwordHideIcon),
                          ),
                        )
                      : SvgPicture.asset(ImageConstants.showPasswordIcon))),
        ),
      ),
    );
  }
}
