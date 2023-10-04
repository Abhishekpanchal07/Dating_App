import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialogBox extends StatefulWidget {
 
 final VoidCallback? galleryTap;
  final VoidCallback? cameraTap;
  
  const CustomDialogBox(
      {Key? key,
     
      this.cameraTap,
      this.galleryTap})
      : super(key: key);

  @override
  State<CustomDialogBox> createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: DimensionConstants.d350.h,
        width: DimensionConstants.d410.w,
        child: Padding(
          padding: EdgeInsets.only(
            top: DimensionConstants.d26.h,
            right: DimensionConstants.d20.w,
            left: DimensionConstants.d20.w,
            bottom: DimensionConstants.d32.h,
          ),
          child: Column(children: [
            const Text(StringConstants.addPhotosText).semiBold(
                ColorConstant.lightblack,
                TextAlign.center,
                DimensionConstants.d26.sp),
            SizedBox(
              height: DimensionConstants.d27.h,
            ),
            GestureDetector(
              onTap: widget.cameraTap,
              child: addCameraGalleryIcon(ColorConstant.dialogboxgradientcolor1, ColorConstant.dialogboxgradientcolor2, StringConstants.camera, ImageConstants.cameraSvg)
            ),
            SizedBox(
              height: DimensionConstants.d16.h,
            ),
            GestureDetector(
              onTap: widget.galleryTap,
              child: addCameraGalleryIcon(ColorConstant.dialogboxgradientcolor3, ColorConstant.dialogboxgradientcolor4, StringConstants.gallery, ImageConstants.galleryIcon)
            ),
          ]),
        ),
      ),
    );
  }

  Widget addCameraGalleryIcon(Color? color1, Color? color2, String? containerText,
       String? iconPath) {
    return Container(
         height: DimensionConstants.d105.h,
        width: DimensionConstants.d350.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(DimensionConstants.d12.r),
            gradient: LinearGradient(colors: [
             color1!,
              color2!
            ])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: DimensionConstants.d15.h,
                  bottom: DimensionConstants.d15.h,
                  left: DimensionConstants.d18.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(StringConstants.uploadFrom).regularText(
                      ColorConstant.buttonbgcolor,
                      TextAlign.center,
                      DimensionConstants.d16.sp),
                  Text(containerText!).bold(
                      ColorConstant.buttonbgcolor,
                      TextAlign.center,
                      DimensionConstants.d30.sp),
                ],
              ),
            ),
            ImageView(
              path: iconPath,
            ),
          ],
        ));
  }
}
