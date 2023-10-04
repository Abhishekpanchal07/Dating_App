import 'package:demoapp/constants/Color_Constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  
   final   emailcontroller= TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(
              top: DimensionConstants.d151.h,
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
              ImageView(
                path: ImageConstants.datingLogo,
                height: DimensionConstants.d87.h,
                width: DimensionConstants.d193.w,
              ),
              SizedBox(
                height: DimensionConstants.d40.h,
              ),
             
             Align(
                child : const Text(StringConstants.resetPassword).regularText(
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
              child:  const Text(StringConstants.confirmEmailText).regularText(
                  ColorConstant.grey, TextAlign.center, DimensionConstants.d16.sp),
             ),
              SizedBox(
                height: DimensionConstants.d23.h,
              ),
              CommonWidgets.gradientTextField(
                
                context, textFieldHintText: StringConstants.emailText,
                controllerName: emailcontroller,
              ),
              SizedBox(
                height: DimensionConstants.d47.h,
              ),
              GestureDetector(
                onTap: (){
                  CommonWidgets.emailAndPasswordVerification(context,emailcontroller: emailcontroller);
                },
                child: CommonWidgets.commonButton(StringConstants.continueText)),
            ],
          ),
        ),
      ),
    );
  }
}
