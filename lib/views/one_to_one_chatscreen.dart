import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/stop_scroll.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OneToOneChatScreen extends StatefulWidget {
  final String userName;
  final String userImagePath;
  const OneToOneChatScreen(
      {Key? key, required this.userName, required this.userImagePath})
      : super(key: key);

  @override
  State<OneToOneChatScreen> createState() => _SearchedUserProfileScreenState();
}

class _SearchedUserProfileScreenState extends State<OneToOneChatScreen> {
  bool onTap = false;
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
        child: Column(children: [
          // name and profile pic
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
                imageWidth: DimensionConstants.d38.w,
                imagePath: widget.userImagePath,
              ),
              SizedBox(
                width: DimensionConstants.d8.w,
              ),
              GestureDetector(
                onTap: () {
                 // Navigator.pushNamed(context, RouteConstants.userAccountScreen);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.userName).regularText(ColorConstant.black,
                        TextAlign.center, DimensionConstants.d20.sp),
                    const Text(StringConstants.online).regularText(
                        ColorConstant.black.withOpacity(0.4),
                        TextAlign.center,
                        DimensionConstants.d12.sp)
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: DimensionConstants.d16.h,
          ),
          // user chat

          Expanded(
            child: ScrollConfiguration(
              behavior: NoGlowScrollBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: DimensionConstants.d1.h,
                          width: DimensionConstants.d157.w,
                          color: ColorConstant.offwhite,
                        ),
                        SizedBox(
                          width: DimensionConstants.d5.w,
                        ),
                        const Text(StringConstants.todayText).regularText(
                            ColorConstant.black,
                            TextAlign.center,
                            DimensionConstants.d12.sp),
                        SizedBox(
                          width: DimensionConstants.d5.w,
                        ),
                        Container(
                          height: DimensionConstants.d1.h,
                          width: DimensionConstants.d159.w,
                          color: ColorConstant.offwhite,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: DimensionConstants.d10.h,
                    ),
                    messageContainer(
                        containerBgColor: ColorConstant.dashboardGradientColor1
                            .withOpacity(0.2),
                        containerChildText: StringConstants.hiJakeText,
                        aligmentValue: Alignment.topLeft),
                    SizedBox(
                      height: DimensionConstants.d4.h,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: const Text(StringConstants.messageSendTime)
                          .regularText(ColorConstant.black.withOpacity(0.4),
                              TextAlign.center, DimensionConstants.d12.sp),
                    ),
                    SizedBox(
                      height: DimensionConstants.d10.h,
                    ),
                    messageContainer(
                        containerBgColor:
                            ColorConstant.searchUserScreenContainerColor,
                        containerChildText: StringConstants.replyofhiJakeText,
                        aligmentValue: Alignment.topRight),
                    SizedBox(
                      height: DimensionConstants.d15.h,
                    ),
                    messageSeen(StringConstants.messageSeenTime),
                    SizedBox(
                      height: DimensionConstants.d10.h,
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: ImageView(
                          path: ImageConstants.userDetailScreenGirlImage,
                          height: DimensionConstants.d248.h,
                          width: DimensionConstants.d199.w,
                          radius: DimensionConstants.d5.r,
                        )),
                    SizedBox(
                      height: DimensionConstants.d15.h,
                    ),
                    messageSeen(StringConstants.messageSeenTime),
                  ],
                ),
              ),
            ),
          ),
          chatTextField(),
          SizedBox(
            height: DimensionConstants.d17.h,
          ),
        ]),
      ),
    );
  }

  // widgets

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
                path: imagePath,
                fit: BoxFit.cover,
                height: imageHeight,
                width: imageWidth),
          ),
        ),
      ),
    );
  }

  Widget chatTextField() {
    return GestureDetector(
      onTap: () {
        setState(() {
          onTap = !onTap;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: DimensionConstants.d48.h,
            width: DimensionConstants.d310.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(DimensionConstants.d15.r),
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
                    width: DimensionConstants.d5.w,
                  ),
                  onTap
                      ? Expanded(
                          child: SizedBox(
                            width: DimensionConstants.d120.w,
                            child: TextField(
                              maxLines: 10,
                              cursorColor: ColorConstant.grey,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: StringConstants.yourMessage,
                                  hintStyle: TextStyle(
                                      color: ColorConstant.black
                                          .withOpacity(0.5))),
                            ),
                          ),
                        )
                      : SizedBox(
                          width: DimensionConstants.d120.w,
                          child: TextField(
                            maxLines: 10,
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
    );
  }

  Widget messageContainer(
      {Color? containerBgColor,
      String? containerChildText,
      Alignment? aligmentValue}) {
    return Align(
      alignment: aligmentValue!,
      child: Container(
          height: DimensionConstants.d98.h,
          width: DimensionConstants.d255.w,
          decoration: BoxDecoration(
            color: containerBgColor,
            borderRadius: BorderRadius.circular(DimensionConstants.d15.r),
          ),
          child: Padding(
            padding: const EdgeInsets.all(DimensionConstants.d16),
            child: Text(containerChildText!).regularText(ColorConstant.black,
                TextAlign.start, DimensionConstants.d14.sp),
          )),
    );
  }

  Widget messageSeen(String? time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text(StringConstants.messageSeenTime).regularText(
            ColorConstant.black.withOpacity(0.4),
            TextAlign.center,
            DimensionConstants.d12.sp),
        const ImageView(
          path: ImageConstants.seenIcon,
        ),
      ],
    );
  }
}
