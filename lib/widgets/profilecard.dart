import 'package:demoapp/constants/api_constants.dart';
import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/modals/homepage_data.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProfileCard extends StatefulWidget {
  final List<String>? userImages;
  final HomepageDetailsOfUser? homepageDetailsOfUser;
  const ProfileCard(
      {Key? key,  this.userImages,  this.homepageDetailsOfUser})
      : super(key: key);

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
      child: GestureDetector(
        onTapUp: (details) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (details.localPosition.dx > screenWidth / 2) {
      // Tap on right side, show next image
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      // Tap on left side, show previous image
      pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  },
        child: Stack(
          children: [
            Positioned(
                child: SizedBox(
                   height: DimensionConstants.d500.h,
                   width: DimensionConstants.d375.w,
                  child: PageView.builder(
                      itemCount: widget.homepageDetailsOfUser!.userImage!.length,
                      controller: pageController,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return
                         ClipRRect(
                      borderRadius:
                          BorderRadius.circular(DimensionConstants.d20.r),
                      child: ImageView(
                        fit: BoxFit.cover,
                        path: ApiUrls.baseUrl + widget.homepageDetailsOfUser!.userImage![index],
                        height: DimensionConstants.d500.h,
                        width: DimensionConstants.d375.w,
                      ),
                    );
                        //  const ImageView(
                        //   path: ImageConstants.userAccountgirlImage,
                        // );
                      }),
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
                      Text(widget.homepageDetailsOfUser!.name.toString())
                          .mediumText(ColorConstant.textcolor, TextAlign.center,
                              DimensionConstants.d24.sp),
                      Text(widget.homepageDetailsOfUser!.horoscopeValue.toString())
                          .regularText(ColorConstant.textcolor, TextAlign.center,
                              DimensionConstants.d14.sp),
                    ],
                  ),
                )),
            Positioned(
                top: DimensionConstants.d10.h,
                left: DimensionConstants.d120.w,
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: widget.homepageDetailsOfUser!.userImage!.length,
                  effect: JumpingDotEffect(
                      activeDotColor: ColorConstant.textcolor,
                      dotColor: ColorConstant.black.withOpacity(0.4),
                      dotWidth: DimensionConstants.d20.w,
                      dotHeight: DimensionConstants.d5.h),
                )),
          ],
        ),
      ),
    );
  }
}
