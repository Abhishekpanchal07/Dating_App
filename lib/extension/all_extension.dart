import 'package:demoapp/constants/string_constants.dart';
import 'package:flutter/material.dart';

extension ExtendText on Text {
  regularText(Color color, TextAlign center, double textSize,
      {double? height, int? maxLines, double? letterSpacing, overFlow}) {
    return Text(
      data!,
      textAlign: center,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        color: color,
        height: height,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w400,
        fontSize: textSize,
        fontFamily: StringConstants.familyName,
      ),
    );
  }

  mediumText(Color color, TextAlign center, double textSize,
      {double? height, int? maxLines, double? letterSpacing, overFlow}) {
    return Text(
       data!,
      textAlign: center,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        color: color,
        height: height,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w500,
        fontSize: textSize,
        fontFamily: StringConstants.familyName,
      ),
    );
  }
  semiBold(Color color, TextAlign center, double textSize,
      {double? height, int? maxLines, double? letterSpacing, overFlow}){
 return Text(
       data!,
      textAlign: center,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        color: color,
        height: height,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w600,
        fontSize: textSize,
        fontFamily: StringConstants.familyName,
      ),
    );
  }
  bold(Color color, TextAlign center, double textSize,
      {double? height, int? maxLines, double? letterSpacing, overFlow}){
 return Text(
       data!,
      textAlign: center,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        color: color,
        height: height,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w700,
        fontSize: textSize,
        fontFamily: StringConstants.familyName,
      ),
    );
  }
}
