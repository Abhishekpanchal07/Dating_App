import 'package:demoapp/constants/Color_Constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CreateNewAccount extends StatefulWidget {
  const CreateNewAccount({super.key});

  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailControllerforcreateaccount = TextEditingController();
  bool isobsecure = true;
  bool ischeckbox = true;
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(
                top: DimensionConstants.d159.h,
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
                      .regularText(ColorConstant.headingcolor, TextAlign.center,
                          DimensionConstants.d24.sp),
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
                aminatedTextField(
                    textfieldhinttext: StringConstants.passwordText,
                    controllerName: passwordController),
                SizedBox(
                  height: DimensionConstants.d20.h,
                ),
                CommonWidgets.gradientTextField(context,
                    controllerName: confirmPasswordController,
                    textFieldHintText: StringConstants.confirmPassword,
                    suffixicon: const Padding(
                      padding: EdgeInsets.all(DimensionConstants.d10),
                      child: ImageView(
                        path: ImageConstants.showPasswordIcon,
                      ),
                    )),
                SizedBox(
                  height: DimensionConstants.d20.h,
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
                              ? const ImageView(
                                  path: ImageConstants.markedCheckbox,
                                )
                              : const ImageView(path: ImageConstants.checkBox)),
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
                  height: DimensionConstants.d20.h,
                ),
                GestureDetector(
                  onTap: () {
                    CommonWidgets.emailAndPasswordVerification(context,emailcontroller: emailControllerforcreateaccount,
                    passwordController: passwordController,
                    confirmPasswordcontroller: confirmPasswordController);
                  },
                  child:
                      CommonWidgets.commonButton(StringConstants.continueText),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget aminatedTextField(
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
          controller: controllerName,
          obscureText: isobsecure,
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
