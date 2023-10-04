import 'package:demoapp/constants/Color_Constants.dart';
import 'package:demoapp/constants/Dimension_Constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestState();
}

class _InterestState extends State<InterestScreen> {
  List<String> containerText = [
    StringConstants.photographyText,
    StringConstants.cookingText,
    StringConstants.videoGamingText,
    StringConstants.musicText,
    StringConstants.travelingText,
    StringConstants.shopingText,
    StringConstants.speechesText,
    StringConstants.artCraftText,
    StringConstants.swimmingText,
    StringConstants.drinkingText,
    StringConstants.extreameSportsText,
    StringConstants.fitnessText,
  ];
  List<bool> selectInterest = [];
  bool itemTapped = false;

  @override
  void initState() {
    
    super.initState();
    for (var i = 1; i <= containerText.length; i++) {
      selectInterest.add(false);
    }
  }

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
                ImageView(
                  path: ImageConstants.leftArrowIcon,
                  height: DimensionConstants.d24.h,
                  width: DimensionConstants.d24.w,
                ),
                const Text(StringConstants.skipText).mediumText(
                    ColorConstant.pink,
                    TextAlign.end,
                    DimensionConstants.d16.sp),
              ],
            ),
            const Text(StringConstants.likeAndInterest).mediumText(
                ColorConstant.headingcolor,
                TextAlign.center,
                DimensionConstants.d36.sp),
            SizedBox(
              height: DimensionConstants.d10.h,
            ),
            const Text(StringConstants.shareLikeInterestText).regularText(
                ColorConstant.headingcolor,
                TextAlign.center,
                DimensionConstants.d16.sp),
            SizedBox(
              height: DimensionConstants.d31.h,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: DimensionConstants.d20.w,
                    childAspectRatio: DimensionConstants.d3,
                    crossAxisSpacing: DimensionConstants.d20.h),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectInterest[index] = !selectInterest[index];
                          itemTapped = true;
                        });
                      },
                      child: selectInterest[index]
                          ? CommonWidgets.gradientGridViewContainer(
                              containerText[index])
                          : CommonWidgets.gridViewContainer(
                              containerText[index]));
                },
                itemCount: containerText.length,
              ),
            ),
            SizedBox(
              height: DimensionConstants.d27.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(StringConstants.see).mediumText(ColorConstant.pink,
                    TextAlign.center, DimensionConstants.d16.sp),
                SizedBox(
                  width: DimensionConstants.d4.w,
                ),
                const Text(StringConstants.more).mediumText(
                    ColorConstant.buttongradientcolor2,
                    TextAlign.center,
                    DimensionConstants.d16.sp)
              ],
            ),
            SizedBox(
              height: DimensionConstants.d24.h,
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    if (itemTapped == false) {
                      CommonWidgets.showflushbar(
                          context, StringConstants.unTapInterestError);
                    } else {
                      Navigator.pushNamed(
                          context, RouteConstants.profileDetaisScreen);
                    }
                  });
                },
                child:
                    CommonWidgets.commonButton(StringConstants.continueText)),
            SizedBox(
              height: DimensionConstants.d112.h,
            ),
          ],
        ),
      ),
    );
  }
}
