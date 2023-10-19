import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/widgets/custom_dialogbox.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

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
            top: DimensionConstants.d43.h,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ImageView(
                    path: ImageConstants.leftArrowIcon,
                    height: DimensionConstants.d24.h,
                    width: DimensionConstants.d24.w,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouteConstants.filterOptionScreen);
                  },
                  child: const Text(StringConstants.skipText).mediumText(
                      ColorConstant.pink,
                      TextAlign.end,
                      DimensionConstants.d16.sp),
                ),
              ],
            ),
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
            Expanded(
                child: GridView.builder(
                    itemCount: imagePaths.length + 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: DimensionConstants.d30.w,
                        mainAxisExtent: DimensionConstants.d150.h,
                        crossAxisSpacing: DimensionConstants.d20.h),
                    itemBuilder: (context, index) {
                      return index == imagePaths.length
                          ? addImageButton()
                          : imageContainer(imagePaths[index], index);
                    })),
            SizedBox(
              height: DimensionConstants.d30.h,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteConstants.bottonNavigationScreen);
                  // if (imagePaths.isEmpty) {
                  //   CommonWidgets.showflushbar(
                  //       context, StringConstants.uploadImageError);
                  // }
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
              colors: [
                ColorConstant.dialogboxgradientcolor4,
                ColorConstant.dialogboxgradientcolor3,
              ])),
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
      height: DimensionConstants.d130.w,
      width: DimensionConstants.d111.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DimensionConstants.d50.r)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(DimensionConstants.d14.r),
            child: Image.asset(imagePath,fit: BoxFit.cover,)
            // ImageView(
            //   path: imagePath,
            //   fit: BoxFit.cover,
            // ),
          ),
          Positioned(
            top: DimensionConstants.d15.h,
            right: DimensionConstants.d18.w,
            child: Container(
              height: DimensionConstants.d20.h,
              width: DimensionConstants.d23.w,
              decoration: const BoxDecoration(
                  color: ColorConstant.lightpink, shape: BoxShape.circle),
              child: Center(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          //  imageTapped[index] = !imageTapped[index];
                          imagePaths.removeAt(index); // userImages.removeAt();
                        });
                      },
                      child: const ImageView(
                        path: ImageConstants.crossIcon,
                      ))),
            ),
          ),
        ],
      ),
    );
  }
}
