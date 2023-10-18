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

class AccountRecover extends StatelessWidget {
  const AccountRecover({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
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
                  onTap: () => Navigator.pushNamed(context, RouteConstants.signInScreen),
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
                child : const Text(StringConstants.accountRecoveryText).regularText(
                  ColorConstant.headingcolor,
                  TextAlign.start,
                  DimensionConstants.d24.sp),
                  alignment: Alignment.centerLeft,
             ),
             
              SizedBox(
                height: DimensionConstants.d23.h,
              ),
              CommonWidgets.gradientTextField(
                
                context, textFieldHintText: StringConstants.accountRecoveryEmailText,
                controllerName: emailController,
              ),
               SizedBox(
                height: DimensionConstants.d9.h,
              ),
              const Text(StringConstants.recoverAccountText).regularText(
                  ColorConstant.black.withOpacity(0.4),
                  TextAlign.center,
                  DimensionConstants.d10.sp),

              SizedBox(
                height: DimensionConstants.d30.h,
              ),
              GestureDetector(
                onTap: (){
                  CommonWidgets.emailAndPasswordVerification(context,emailcontroller: emailController);
                },
                child: CommonWidgets.commonButton(StringConstants.continueText)),
            ],
          ),
        ),
      ),
    );
  }
}
