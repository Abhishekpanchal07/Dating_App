import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
            top: DimensionConstants.d43.h,
            left: DimensionConstants.d20.w,
            right: DimensionConstants.d20.w),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const ImageView(
                    path: ImageConstants.leftArrowIcon,
                  ),
                ),
                SizedBox(
                  width: DimensionConstants.d17.w,
                ),
                circularGradientConatiner(
                    parentConatinerHeight: DimensionConstants.d44.h,
                    parentConatinerWidth: DimensionConstants.d44.w,
                    childConatinerHeight: DimensionConstants.d38.h,
                    childConatinerwidth: DimensionConstants.d38.w,
                    imageBorderRaius: DimensionConstants.d18,
                    imageHeight: DimensionConstants.d38.h,
                    imageWidth: DimensionConstants.d38.w),
                SizedBox(
                  width: DimensionConstants.d8.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(StringConstants.grace).regularText(
                        ColorConstant.black,
                        TextAlign.center,
                        DimensionConstants.d20.sp),
                    const Text(StringConstants.online).regularText(
                        ColorConstant.black.withOpacity(0.4),
                        TextAlign.center,
                        DimensionConstants.d12.sp),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: DimensionConstants.d50.h,
            ),
            circularGradientConatiner(
              parentConatinerHeight: DimensionConstants.d128.h,
              parentConatinerWidth: DimensionConstants.d128.w,
              childConatinerHeight: DimensionConstants.d118.h,
              childConatinerwidth: DimensionConstants.d119.w,
              imageBorderRaius: DimensionConstants.d55,
              imageHeight: DimensionConstants.d110.h,
              imageWidth: DimensionConstants.d110.w,
            ),
            const Text(StringConstants.graceAge).bold(ColorConstant.black,
                TextAlign.center, DimensionConstants.d24.sp),
            const Text(StringConstants.friendsOnDating).regularText(
                ColorConstant.black.withOpacity(0.4),
                TextAlign.center,
                DimensionConstants.d12.sp),
            const Text(StringConstants.liveIn).regularText(
                ColorConstant.black.withOpacity(0.4),
                TextAlign.center,
                DimensionConstants.d12.sp),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: DimensionConstants.d48.h,
                  width: DimensionConstants.d310.h,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(DimensionConstants.d15.r),
                      border: Border.all(
                          width: DimensionConstants.d1.w,
                          style: BorderStyle.solid,
                          color: ColorConstant.black.withOpacity(0.2))),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: DimensionConstants.d5.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: DimensionConstants.d24.h,
                          width: DimensionConstants.d122.w,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ImageView(
                                path: ImageConstants.addImageIcon,
                              ),
                              ImageView(
                                path: ImageConstants.galleryIconMessageScreen,
                              ),
                              ImageView(
                                path: ImageConstants.cameraIconMessageScreen,
                              ),
                              ImageView(
                                path: ImageConstants.mikeIconMessageScreen,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: DimensionConstants.d120.w,
                          child: TextField(
                            cursorColor: ColorConstant.grey,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: StringConstants.yourMessage,
                                hintStyle: TextStyle(
                                    color:
                                        ColorConstant.black.withOpacity(0.5))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const ImageView(
                  path: ImageConstants.sendMessageIconMessageScreen,
                )
              ],
            ),
            SizedBox(
              height: DimensionConstants.d17.h,
            )
          ],
        ),
      ),
    );
  }

  Widget circularGradientConatiner({
    double? parentConatinerHeight,
    double? parentConatinerWidth,
    double? childConatinerHeight,
    double? childConatinerwidth,
    double? imageBorderRaius,
    String? imagePath,
    double? imageHeight,
    double? imageWidth,
  }) {
    return Container(
      height: parentConatinerHeight,
      width: parentConatinerWidth,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              ColorConstant.dialogboxgradientcolor3,
              ColorConstant.dialogboxgradientcolor4,
            ]),
      ),
      child: Container(
        height: childConatinerHeight,
        width: childConatinerwidth,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: ColorConstant.textcolor),
        child: Padding(
          padding: const EdgeInsets.all(DimensionConstants.d2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(imageBorderRaius!),
            child: ImageView(
                path: ImageConstants.userDetailScreenGirlImage,
                fit: BoxFit.cover,
                height: imageHeight,
                width: imageWidth),
          ),
        ),
      ),
    );
  }
}
