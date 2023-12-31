import 'package:demoapp/constants/Color_Constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/providers/login_and_create_new_account.dart';
import 'package:demoapp/views/base_view.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewAccount extends StatefulWidget {
  const CreateNewAccount({super.key});

  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailControllerforcreateaccount = TextEditingController();
  bool isobsecure = false;
  bool ischeckbox = false;
  bool isconfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BaseView<LoginAndcreateNewAccountProvider>(
        builder: (context, provider, child) => Scaffold(
          body: SingleChildScrollView(
            child: Container(
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
                    ColorConstant.bggradientcolor2,
                  ])),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
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
                    height: DimensionConstants.d90.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(StringConstants.createNewAccount)
                        .regularText(ColorConstant.headingcolor,
                            TextAlign.center, DimensionConstants.d24.sp),
                  ),
                  SizedBox(
                    height: DimensionConstants.d13.h,
                  ),
                  CommonWidgets.gradientTextField(context,
                      controllerName: emailControllerforcreateaccount,
                      textFieldHintText: StringConstants.emailText),
                  SizedBox(
                    height: DimensionConstants.d21.h,
                  ),
                  aminatedTextField(provider,
                      textfieldhinttext: StringConstants.passwordText,
                      controllerName: passwordController),
                  SizedBox(
                    height: DimensionConstants.d20.h,
                  ),
                  confirmPasswordAnimatedTextField(provider,
                      controllerName: confirmPasswordController,
                      textfieldhinttext: StringConstants.confirmPassword),
                  SizedBox(
                    height: DimensionConstants.d20.h,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(DimensionConstants.d10),
                        child: GestureDetector(
                            onTap: () {
                              provider.changeremembermeboolValue();
                            },
                            child: provider.rememberMe
                                ? const ImageView(
                                    path: ImageConstants.markedCheckbox,
                                  )
                                : const ImageView(
                                    path: ImageConstants.checkBox)),
                      ),
                      SizedBox(
                        width: DimensionConstants.d5.w,
                      ),
                      const Text(StringConstants.loginScreenRememberMe)
                          .regularText(ColorConstant.lightpink,
                              TextAlign.center, DimensionConstants.d16.sp)
                    ],
                  ),
                  SizedBox(
                    height: DimensionConstants.d20.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      emailAndPasswordVerification(context, provider,
                          emailcontroller: emailControllerforcreateaccount,
                          passwordController: passwordController,
                          confirmPasswordcontroller: confirmPasswordController);
                    },
                    child: CommonWidgets.commonButton(
                        StringConstants.continueText),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget aminatedTextField(LoginAndcreateNewAccountProvider provider,
      {String? textfieldhinttext, TextEditingController? controllerName}) {
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
          style: const TextStyle(
              color: ColorConstant.headingcolor,
              fontFamily: StringConstants.familyName),
          controller: controllerName,
          obscureText: provider.changeVisibility,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: textfieldhinttext,
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
                    provider.changeboolValue();
                  },
                  icon: provider.changeVisibility
                      ? const Padding(
                          padding: EdgeInsets.all(DimensionConstants.d5),
                          child: Padding(
                              padding: EdgeInsets.all(DimensionConstants.d0),
                              child: ImageView(
                                path: ImageConstants.passwordHideIcon,
                              )),
                        )
                      : const ImageView(
                          path: ImageConstants.showPasswordIcon,
                        ))),
        ),
      ),
    );
  }

  Widget confirmPasswordAnimatedTextField(
      LoginAndcreateNewAccountProvider provider,
      {String? textfieldhinttext,
      TextEditingController? controllerName}) {
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
          style: const TextStyle(
              color: ColorConstant.headingcolor,
              fontFamily: StringConstants.familyName),
          controller: controllerName,
          obscureText: provider.confirmPasswordbool,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: textfieldhinttext,
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
                    provider.changeconfirmboolValue();
                  },
                  icon: provider.confirmPasswordbool
                      ? const Padding(
                          padding: EdgeInsets.all(DimensionConstants.d5),
                          child: Padding(
                              padding: EdgeInsets.all(DimensionConstants.d0),
                              child: ImageView(
                                path: ImageConstants.passwordHideIcon,
                              )),
                        )
                      : const ImageView(
                          path: ImageConstants.showPasswordIcon,
                        ))),
        ),
      ),
    );
  }

  void emailAndPasswordVerification(
    BuildContext context,
    LoginAndcreateNewAccountProvider provider, {
    emailcontroller,
    passwordController,
    confirmPasswordcontroller,
  }) {
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
      provider.hitSignupApi(
          context, emailcontroller.text, passwordController.text);

      // Navigator.pushNamed(context, RouteConstants.profileDetaisScreen);
    }
  }

// hit Api
  // Future<void> hitSignupApi(
  //     String? email, String? password, String? deviceToken) async {

  //   try {
  //     final modal = await Api.signUp(
  //       email: email,
  //       password: password,
  //     );

  //     if (modal.success == true) {
  //       SharedpreferenceKeys.prefs!
  //           .setString(SharedpreferenceKeys.userId, modal.data!.id.toString());
  //       SharedpreferenceKeys.prefs!.setString(
  //           SharedpreferenceKeys.jwtToken, modal.jwtToken.toString());
  //       // create Account
  //       SharedpreferenceKeys.prefs!.setString(
  //           SharedpreferenceKeys.createAccountSuccessfully,
  //           modal.message.toString());
  //            SharedpreferenceKeys.prefs!.setString(
  //           SharedpreferenceKeys.loginStatus,
  //           modal.data!.status.toString());
  //       if (mounted) {
  //         Navigator.pushNamed(context, RouteConstants.profileDetaisScreen);
  //       }
  //     } else {
  //       if (mounted) {
  //         CommonWidgets.showflushbar(context, modal.message.toString());
  //       }
  //     }
  //   } on SocketException catch (e) {
  //     if (mounted) {
  //       CommonWidgets.showflushbar(context, e.toString());
  //     }
  //   }
  // }

  // Future<void> accountCreatedSuccessfully() async {
  //   if (mounted) {
  //     CommonWidgets.showflushbar(
  //         context,
  //         SharedpreferenceKeys.prefs!
  //             .getString(SharedpreferenceKeys.createAccountSuccessfully)
  //             .toString());
  //   }
  // }
}
