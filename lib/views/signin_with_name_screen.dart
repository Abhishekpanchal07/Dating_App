import 'package:demoapp/constants/Dimension_Constant.dart';
import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInByName extends StatelessWidget {
  SignInByName({super.key});
  final firstNameValue = TextEditingController();
  final lastNameValue = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                ColorConstant.bggradientcolor1,
                ColorConstant.bggradientcolor2
              ])),
          padding: EdgeInsets.only(
              top: DimensionConstants.d43.h,
              left: DimensionConstants.d20.w,
              right: DimensionConstants.d20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: ImageView(
                    path: ImageConstants.leftArrowIcon,
                  ),
                ),
                SizedBox(
                  height: DimensionConstants.d64.h,
                ),
                const ImageView(
                  path: ImageConstants.datingLogo,
                ),
                SizedBox(
                  height: DimensionConstants.d40.h,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: const Text(StringConstants.whatsyourNameText)
                        .regularText(ColorConstant.headingcolor,
                            TextAlign.center, DimensionConstants.d24.sp)),
                SizedBox(
                  height: DimensionConstants.d50.h,
                ),
                CommonWidgets.gradientTextField(context,
                    controllerName: firstNameValue,
                    textFieldHintText: StringConstants.firstNamw),
                SizedBox(
                  height: DimensionConstants.d21.h,
                ),
                CommonWidgets.gradientTextField(context,
                    controllerName: lastNameValue,
                    textFieldHintText: StringConstants.lastName),
                SizedBox(
                  height: DimensionConstants.d50.h,
                ),
                GestureDetector(
                    onTap: () {
                      if (firstNameValue.text.isEmpty) {
                        CommonWidgets.showflushbar(context,
                            StringConstants.firstNameErrortextProfileScreen);
                      } else if (lastNameValue.text.isEmpty) {
                        CommonWidgets.showflushbar(context,
                            StringConstants.lastNameErrortextProfileScreen);
                      } else {
                        Navigator.pushNamed(
                            context, RouteConstants.sendMessageScreen);
                      }
                    },
                    child:
                        CommonWidgets.commonButton(StringConstants.signInText)),
                SizedBox(
                  height: DimensionConstants.d30.h,
                ),
                const Text(StringConstants.forgetPasswordText).regularText(
                    ColorConstant.lightred,
                    TextAlign.center,
                    DimensionConstants.d16.sp),
                SizedBox(
                  height: DimensionConstants.d236.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
