import 'dart:io';

import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/sharedperferences_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/helper/stop_scroll.dart';
import 'package:demoapp/services/api.dart';
import 'package:demoapp/widgets/custom_dialogbox.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPhoto extends StatefulWidget {
  const AddPhoto({super.key});

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  List<String> imagePaths = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: DimensionConstants.d73.h,
            left: DimensionConstants.d20.w,
            right: DimensionConstants.d20.w),
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              ColorConstant.bggradientcolor1,
              ColorConstant.bggradientcolor2
            ])),
        child: Column(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     GestureDetector(
            //       onTap: () {
            //         Navigator.pop(context);
            //       },
            //       child: ImageView(
            //         path: ImageConstants.leftArrowIcon,
            //         height: DimensionConstants.d24.h,
            //         width: DimensionConstants.d24.w,
            //       ),
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         Navigator.pushNamed(
            //             context, RouteConstants.filterOptionScreen);
            //       },
            //       child: const Text(StringConstants.skipText).mediumText(
            //           ColorConstant.pink,
            //           TextAlign.end,
            //           DimensionConstants.d16.sp),
            //     ),
            //   ],
            // ),
            const Text(StringConstants.addPhotoText).mediumText(
                ColorConstant.headingcolor,
                TextAlign.center,
                DimensionConstants.d36.sp),
            SizedBox(
              height: DimensionConstants.d5.h,
            ),
            const Text(StringConstants.dummyAddPhotosText).regularText(
                ColorConstant.headingcolor,
                TextAlign.center,
                DimensionConstants.d16.sp),
            const Text(StringConstants.dummyAddPhotosText2).regularText(
                ColorConstant.headingcolor,
                TextAlign.center,
                DimensionConstants.d16.sp),
            SizedBox(
              height: DimensionConstants.d30.h,
            ),
            ScrollConfiguration(
              behavior: NoGlowScrollBehavior(),
              child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: imagePaths.length + 1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: DimensionConstants.d3.toInt(),
                      mainAxisSpacing: DimensionConstants.d30.w,
                      childAspectRatio: DimensionConstants.d1,
                      mainAxisExtent: DimensionConstants.d140.h,
                      crossAxisSpacing: DimensionConstants.d20.h),
                  itemBuilder: (context, index) {
                    return index == imagePaths.length
                        ? addImageButton()
                        : imageContainer(imagePaths[index], index);
                  }),
            ),
            SizedBox(
              height: DimensionConstants.d30.h,
            ),
            GestureDetector(
                onTap: () {
                  if (imagePaths.isEmpty) {
                    CommonWidgets.showflushbar(
                        context, StringConstants.uploadImageError);
                  } else {
                    hitAddUserImages();
                  }
                },
                child:
                    CommonWidgets.commonButton(StringConstants.continueText)),
            SizedBox(
              height: DimensionConstants.d298.h,
            )
          ],
        ),
      ),
    );
  }

  Widget addImageButton() {
    return Container(
      height: DimensionConstants.d139.h,
      width: DimensionConstants.d111.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DimensionConstants.d15.r),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [ColorConstant.lightred, ColorConstant.color8948EF])),
      child: Container(
        height: DimensionConstants.d42.h,
        width: DimensionConstants.d42.w,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: ColorConstant.buttonbgcolor,
          shape: BoxShape.circle,
        ),
        child: Center(
            child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CustomDialogBox(
                          galleryTap: () async {
                            Navigator.pop(context);
                            final ImagePicker picker = ImagePicker();
                            final XFile? photo = await picker.pickImage(
                                source: ImageSource.gallery);
                            if (photo != null) {
                              setState(() {
                                imagePaths.add(photo.path);
                              });
                            }
                          },
                          cameraTap: () async {
                            Navigator.pop(context);
                            final ImagePicker picker = ImagePicker();
                            final XFile? photo = await picker.pickImage(
                                source: ImageSource.camera);
                            if (photo != null) {
                              setState(() {
                                imagePaths.add(photo.path);
                              });
                            }
                          },
                        );
                      });
                },
                child: const ImageView(
                  path: ImageConstants.addIcon,
                ))),
      ),
    );
  }

  Widget imageContainer(String imagePath, int index) {
    return Container(
      height: DimensionConstants.d150.h,
      width: DimensionConstants.d111.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DimensionConstants.d50.r)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(DimensionConstants.d14.r),
            child: ImageView(
              path: imagePath,
              height: DimensionConstants.d150.h,
              width: DimensionConstants.d111.w,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: DimensionConstants.d7.h,
            right: DimensionConstants.d12.w,
            child: Container(
              height: DimensionConstants.d30.h,
              width: DimensionConstants.d25.w,
              decoration: const BoxDecoration(
                  color: ColorConstant.lightred, shape: BoxShape.circle),
              child: Center(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          //  imageTapped[index] = !imageTapped[index];
                          imagePaths.removeAt(index); // userImages.removeAt();
                        });
                      },
                      child: ImageView(
                        path: ImageConstants.crossIcon,
                        height: DimensionConstants.d16.h,
                      ))),
            ),
          ),
        ],
      ),
    );
  }

  // hit add user images
  Future<void> hitAddUserImages() async {
    SharedPreferences getSavedValues = await SharedPreferences.getInstance();
    try {
      final modal = await Api.addUserImages(
          imagepath: imagePaths,
          tokenValue: getSavedValues.getString(SharedpreferenceKeys.jwtToken),
          userId: getSavedValues.getString(SharedpreferenceKeys.userId));
      if (modal.success == true) {
        if (mounted) {
          CommonWidgets.showflushbar(context, modal.message.toString());
          Navigator.pushNamed(context, RouteConstants.filterOptionScreen);
        }
      } else {
        if (mounted) {
          CommonWidgets.showflushbar(context, modal.message.toString());
        }
      }
    } on SocketException catch (e) {
      if (mounted) {
        CommonWidgets.showflushbar(context, e.toString());
      }
    }
  }
}
