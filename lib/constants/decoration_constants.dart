import 'package:demoapp/constants/Dimension_Constant.dart';
import 'package:demoapp/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ViewDecoration {
  static InputDecoration inputDecorationWithCurve(
  
    String fieldName,
     {
    IconData? icon,
    Widget? prefixIcon,
    Widget? suffixIcon,
    Color? fillColor,
    double? radius,
    double? textSize,
    Color? textFilledColor,
    bool imageView = false,
    String? path,
  }) {
    return InputDecoration(
prefixIcon: prefixIcon,
suffixIcon: suffixIcon,
hintText: fieldName,
hintStyle: textFieldStyle(DimensionConstants.d16.h, ColorConstant.grey),
contentPadding: EdgeInsets.symmetric(
  horizontal: DimensionConstants.d15.w,
  vertical: DimensionConstants.d14.h
),
border: InputBorder.none,

    );
  }
  static TextStyle textFieldStyle(double size,Color color){
return TextStyle(
  fontFamily: "Lexend",
  fontWeight: FontWeight.w400,
  color: color,
  fontSize: size
);
}

}

