import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogHelper extends StatelessWidget {
  final String? titleValue;
  final FontWeight? titleValueFontWeight;
  final double? titleValueFontSize;
  final double? sizedboxheight;
  final String? contentValue;
  final double? contentValueFontSize;
  final String? positiveTapContentValue;
  final Color? positiveTapcontentValueColor;
  final Color? titleColor;
  final VoidCallback? positiveTap;
  final VoidCallback? negativeTap;
  final double? paddingFromTop;
  const DialogHelper({Key ? key,
  required this.titleValue,
  required this.titleColor,
  required this.titleValueFontWeight,
  required this.titleValueFontSize,
  required this.sizedboxheight,
  required this.contentValue,
  required this.contentValueFontSize,
  required this.positiveTapContentValue,
  required this.positiveTapcontentValueColor,
  this.negativeTap,
  this.positiveTap,
  this.paddingFromTop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DimensionConstants.d20.r)),
      child: SizedBox(
        height: DimensionConstants.d190.h,
        width: DimensionConstants.d374.w,
        child: Padding(
          padding: EdgeInsets.only(top: DimensionConstants.d18.h),
          child: Column(
            children: [
              Text(titleValue!,
              style: TextStyle(
                fontFamily: StringConstants.familyName,
                fontSize: titleValueFontSize,
                color: titleColor,
                fontWeight: titleValueFontWeight!,
              ),),
              SizedBox(
                height: DimensionConstants.d15.h,
              ),
              Text(contentValue!).regularText(
                  ColorConstant.color9B9B9B,
                  TextAlign.center,
                  contentValueFontSize!),
              SizedBox(
                height: sizedboxheight,
              ),
              Container(
                height: DimensionConstants.d1.h,
                width: DimensionConstants.d374.w,
                color: ColorConstant.color9B9B9B,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: paddingFromTop ?? DimensionConstants.d10.h,
                        left: DimensionConstants.d53.w),
                    child: GestureDetector(
                      onTap: negativeTap,
                      child: const Text(StringConstants.cancel).regularText(
                        ColorConstant.black,
                        TextAlign.center,
                        DimensionConstants.d18.sp),
                    )
                  ),
                  SizedBox(
                    width: DimensionConstants.d55.w,
                  ),
                  Container(
                    height: DimensionConstants.d85.h,
                    width: DimensionConstants.d1.w,
                    color: ColorConstant.color9B9B9B,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: paddingFromTop ?? DimensionConstants.d10.h,
                        left: DimensionConstants.d53.w),
                    child: GestureDetector(
                      onTap: positiveTap,
                      child:  Text(positiveTapContentValue!)
                        .regularText(positiveTapcontentValueColor!,
                            TextAlign.center, DimensionConstants.d18.sp),
                    )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
