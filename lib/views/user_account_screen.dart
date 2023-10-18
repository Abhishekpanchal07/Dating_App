import 'package:demoapp/constants/Color_Constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class UserAccountScreen extends StatefulWidget {
  final List? conatinerChildTextValue;
  const UserAccountScreen({Key? key, required this.conatinerChildTextValue})
      : super(key: key);

  @override
  State<UserAccountScreen> createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              child: SizedBox(
                height: DimensionConstants.d470.h,
                width: DimensionConstants.d414.w,
                child: PageView.builder(
                    itemCount: 5,
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const ImageView(
                        path: ImageConstants.userAccountgirlImage,
                      );
                    }),
              ),
            ),
            Positioned(
                top: DimensionConstants.d359.h,
                left: DimensionConstants.d166.w,
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 5,
                  effect: const JumpingDotEffect(
                      activeDotColor: ColorConstant.inboxScreenGradientColor,
                      dotColor: ColorConstant.textcolor),
                )),
            Positioned(
                top: DimensionConstants.d53.h,
                right: DimensionConstants.d20.w,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouteConstants.editProfileScreen);
                  },
                  child: const ImageView(
                    path: ImageConstants.editProfileIcon,
                  ),
                )),
            Positioned(
              top: DimensionConstants.d400.h,
              child: Container(
                height: DimensionConstants.d500.h,
                width: DimensionConstants.d414.w,
                padding: EdgeInsets.only(
                    top: DimensionConstants.d30.h,
                    left: DimensionConstants.d30.w,
                    right: DimensionConstants.d30.w),
                decoration: BoxDecoration(
                    color: ColorConstant.textcolor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(DimensionConstants.d30.r),
                        topRight: Radius.circular(DimensionConstants.d30.r))),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(StringConstants.jesicaParker).bold(
                            ColorConstant.black,
                            TextAlign.center,
                            DimensionConstants.d24.sp),
                        SizedBox(
                          height: DimensionConstants.d9.h,
                        ),
                        const Text(StringConstants.aries).regularText(
                            ColorConstant.black,
                            TextAlign.start,
                            DimensionConstants.d14.sp),
                        SizedBox(
                          height: DimensionConstants.d30.h,
                        ),
                        // zodiac Sign
                        const Text(StringConstants.zodiacSign).bold(
                            ColorConstant.black,
                            TextAlign.center,
                            DimensionConstants.d16.sp),
                        SizedBox(
                          height: DimensionConstants.d9.h,
                        ),
                        const Text(StringConstants.aries).regularText(
                            ColorConstant.black,
                            TextAlign.start,
                            DimensionConstants.d14.sp),

                        SizedBox(
                          height: DimensionConstants.d30.h,
                        ),
                        // location

                        const Text(StringConstants.location).bold(
                            ColorConstant.black,
                            TextAlign.center,
                            DimensionConstants.d16.sp),
                        SizedBox(
                          height: DimensionConstants.d9.h,
                        ),
                        const Text(StringConstants.jessicaLoaction).regularText(
                            ColorConstant.black,
                            TextAlign.center,
                            DimensionConstants.d16.sp),
                        SizedBox(
                          height: DimensionConstants.d30.h,
                        ),
                        // birthday
                        const Text(StringConstants.birthday).bold(
                            ColorConstant.black,
                            TextAlign.center,
                            DimensionConstants.d16.sp),
                        SizedBox(
                          height: DimensionConstants.d9.h,
                        ),
                        const Text(StringConstants.birthdayDate).regularText(
                            ColorConstant.black,
                            TextAlign.center,
                            DimensionConstants.d16.sp),

                        SizedBox(
                          height: DimensionConstants.d30.h,
                        ),

                        // About
                        const Text(StringConstants.about).bold(
                            ColorConstant.black,
                            TextAlign.center,
                            DimensionConstants.d16.sp),
                        SizedBox(
                          height: DimensionConstants.d9.h,
                        ),

                        const Text(
                          StringConstants.jessicaDescription,
                        ).regularText(
                          ColorConstant.black,
                          TextAlign.start,
                          DimensionConstants.d14.sp,
                        ),

                        SizedBox(
                          height: DimensionConstants.d30.h,
                        ),
                        // Interests
                        const Text(StringConstants.interests).bold(
                            ColorConstant.black,
                            TextAlign.center,
                            DimensionConstants.d16.sp),

                        SizedBox(
                          height: DimensionConstants.d200.h,
                          width: MediaQuery.of(context).size.width,
                          child: GridView.builder(
                              itemCount: widget.conatinerChildTextValue!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: DimensionConstants.d7.w,
                                mainAxisSpacing: DimensionConstants.d10.h,
                                childAspectRatio: DimensionConstants.d4,
                              ),
                              itemBuilder: (context, index) {
                                return widget
                                        .conatinerChildTextValue!.isNotEmpty
                                    ? gradientcontainer(
                                        containerchildText: widget
                                            .conatinerChildTextValue![index])
                                    : const SizedBox();
                              }),
                        )
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

// user interests container
  Widget gradientcontainer({String? containerchildText}) {
    return Container(
      height: DimensionConstants.d32.h,
      width: DimensionConstants.d118.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DimensionConstants.d5),
          color: ColorConstant.inboxScreenGradientColor),
      child: Container(
        height: DimensionConstants.d27.h,
        width: DimensionConstants.d111.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(DimensionConstants.d5),
            color: ColorConstant.textcolor),
        child: Padding(
          padding: const EdgeInsets.all(DimensionConstants.d5),
          child: Row(children: [
            const ImageView(
              path: ImageConstants.seenIcon,
            ),
            Text(containerchildText!).bold(
                ColorConstant.red, TextAlign.center, DimensionConstants.d11.sp)
          ]),
        ),
      ),
    );
  }
}
