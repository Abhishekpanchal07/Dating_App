import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/modals/homepage_data.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProfileCard extends StatefulWidget {
  final HomepageDetailsOfUser homepageDetailsOfUser;
  const ProfileCard({Key?key, required this.homepageDetailsOfUser}) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  final pageController = PageController();
  bool showLikeContainer = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: DimensionConstants.d500.h,
      width: DimensionConstants.d375.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DimensionConstants.d20.r),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(DimensionConstants.d20.r),
            child: ImageView(
              fit: BoxFit.cover,
              path: widget.homepageDetailsOfUser.userImage,
              height: DimensionConstants.d500.h,
              width: DimensionConstants.d375.w,
            ),
          ),
          Positioned(
              bottom: DimensionConstants.d0.h,
              //left: DimensionConstants.d20.w,
              child: Container(
                padding: EdgeInsets.only(
                  top: DimensionConstants.d15.h,
                  left: DimensionConstants.d20.w,
                ),
                decoration: BoxDecoration(
                    color: ColorConstant.black.withOpacity(0.4),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(DimensionConstants.d15.r),
                      bottomRight: Radius.circular(DimensionConstants.d15.r),
                    )),
                height: DimensionConstants.d100.h,
                width: DimensionConstants.d375.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(StringConstants.jesicaParker).mediumText(
                        ColorConstant.textcolor,
                        TextAlign.center,
                        DimensionConstants.d24.sp),
                    const Text(StringConstants.aries).regularText(
                        ColorConstant.textcolor,
                        TextAlign.center,
                        DimensionConstants.d14.sp),
                  ],
                ),
              )),
          Positioned(
              top: DimensionConstants.d10.h,
              left: DimensionConstants.d120.w,
              child: SmoothPageIndicator(
                controller: pageController,
                count: 1,
                effect: JumpingDotEffect(
                    activeDotColor: ColorConstant.textcolor,
                    dotColor: ColorConstant.black.withOpacity(0.4),
                    dotWidth: DimensionConstants.d20.w,
                    dotHeight: DimensionConstants.d5.h),
              )),
         
        ],
      ),
    );
  }
}
