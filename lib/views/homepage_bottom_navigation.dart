import 'package:demoapp/constants/Dimension_Constant.dart';
import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/stop_scroll.dart';
import 'package:demoapp/modals/homePage_data.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:swipe_cards/swipe_cards.dart';

class HomePageBottomNavigationScreen extends StatefulWidget {
  const HomePageBottomNavigationScreen({super.key});

  @override
  State<HomePageBottomNavigationScreen> createState() =>
      _HomePageBottomNavigationScreenState();
}

class _HomePageBottomNavigationScreenState
    extends State<HomePageBottomNavigationScreen> {
  final pagecontroller = PageController();
  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  late MatchEngine _matchEngine;
  bool showLikeContainer = false;
  bool showRejectCard = false;

  List<HomepageDetailsOfUser> userDetails = [
    HomepageDetailsOfUser(
        name: StringConstants.jesicaParker,
        horoscopeValue: StringConstants.aries,
        userImage: StringConstants.imageurlInboxScreen),
    HomepageDetailsOfUser(
        name: StringConstants.jesicaParker,
        horoscopeValue: StringConstants.aries,
        userImage: ImageConstants.testingImage),
    HomepageDetailsOfUser(
        name: StringConstants.jesicaParker,
        horoscopeValue: StringConstants.aries,
        userImage: ImageConstants.testingImage1),
    HomepageDetailsOfUser(
        name: StringConstants.jesicaParker,
        horoscopeValue: StringConstants.aries,
        userImage: ImageConstants.testingImage2),
    HomepageDetailsOfUser(
        name: StringConstants.jesicaParker,
        horoscopeValue: StringConstants.aries,
        userImage: ImageConstants.testingImage3),
    HomepageDetailsOfUser(
        name: StringConstants.jesicaParker,
        horoscopeValue: StringConstants.aries,
        userImage: ImageConstants.testingImage4),
    HomepageDetailsOfUser(
        name: StringConstants.jesicaParker,
        horoscopeValue: StringConstants.aries,
        userImage: ImageConstants.testingImage5),
  ];
  @override
  void initState() {
    for (var i = 0; i < userDetails.length; i++) {
      _swipeItems.add(SwipeItem(
          likeAction: () {
          
          },
          nopeAction: () {
            Card(
              shape: const CircleBorder(),
              elevation: DimensionConstants.d5,
              child: Container(
                decoration: const BoxDecoration(
                    color: ColorConstant.textcolor, shape: BoxShape.circle),
                height: DimensionConstants.d80.h,
                width: DimensionConstants.d80.w,
                child: const Padding(
                  padding: EdgeInsets.all(DimensionConstants.d15),
                  child: ImageView(
                    fit: BoxFit.cover,
                    path: ImageConstants.crossMarkIcon,
                  ),
                ),
              ),
            );
          },
          superlikeAction: () {}));
    }
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: DimensionConstants.d50.h,
          left: DimensionConstants.d20.w,
          right: DimensionConstants.d20.w,
        ),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GradientText(
                  StringConstants.home,
                  colors: const [
                    ColorConstant.dashboardGradientColor,
                    ColorConstant.dashboardGradientColor1
                  ],
                  style: TextStyle(
                    fontFamily: StringConstants.familyName,
                    fontWeight: FontWeight.w600,
                    fontSize: DimensionConstants.d24.sp,
                  ),
                ),
                // Notification Icon
                const ImageView(
                  path: ImageConstants.notificationIconInboxScreen,
                )
              ],
            ),
            SizedBox(
              height: DimensionConstants.d64.h,
            ),
            SizedBox(
              height: DimensionConstants.d500.h,
              width: DimensionConstants.d375.w,
              child: ScrollConfiguration(
                behavior: NoGlowScrollBehavior(),
                child: GestureDetector(
                  onTapUp: (details) {
                    double screenWidth = MediaQuery.of(context).size.width;
                    if (details.localPosition.dx > screenWidth / 2) {
                      // Tap on right side, show next image

                      pagecontroller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    } else {
                      // Tap on left side, show previous image
                      pagecontroller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    }
                  },
                  child: PageView.builder(
                      itemCount: userDetails.length,
                      controller: pagecontroller,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SwipeCards(
                          matchEngine: _matchEngine,
                          itemBuilder: (context, index) => imageContainer(
                              pageControllerValue: userDetails.length,
                              imagePath: userDetails[index].userImage),
                          onStackFinished: () {},
                        );
                      }),
                ),
              ),
            ),
            SizedBox(
              height: DimensionConstants.d30.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: DimensionConstants.d100.w),
              child: SizedBox(
                height: DimensionConstants.d80.h,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                       // swipeLeft();
                      },
                      child: Card(
                        shape: const CircleBorder(),
                        elevation: DimensionConstants.d5,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: ColorConstant.textcolor,
                              shape: BoxShape.circle),
                          height: DimensionConstants.d80.h,
                          width: DimensionConstants.d80.w,
                          child: const Padding(
                            padding: EdgeInsets.all(DimensionConstants.d15),
                            child: ImageView(
                              fit: BoxFit.cover,
                              path: ImageConstants.crossMarkIcon,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: DimensionConstants.d30.w,
                    ),
                    GestureDetector(
                      onTap: () {
                       // swipeRight();
                        // Simulate swipe right (like action)
    int currentIndex = pagecontroller.page?.toInt() ?? 0;
    pagecontroller.animateToPage(currentIndex + 1,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: ColorConstant.red, shape: BoxShape.circle),
                        height: DimensionConstants.d80.h,
                        width: DimensionConstants.d80.w,
                        child: const Padding(
                          padding: EdgeInsets.all(DimensionConstants.d15),
                          child: ImageView(
                            fit: BoxFit.cover,
                            path: ImageConstants.heartIcon,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget imageContainer({String? imagePath, int? pageControllerValue}) {
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
              path: imagePath,
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
                controller: pagecontroller,
                count: pageControllerValue!,
                effect: JumpingDotEffect(
                    activeDotColor: ColorConstant.textcolor,
                    dotColor: ColorConstant.black.withOpacity(0.4),
                    dotWidth: DimensionConstants.d20.w,
                    dotHeight: DimensionConstants.d5.h),
              )),
          showLikeContainer
              ? Positioned(
                  top: DimensionConstants.d190.h,
                  left: DimensionConstants.d150.w,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: ColorConstant.red, shape: BoxShape.circle),
                    height: DimensionConstants.d80.h,
                    width: DimensionConstants.d80.w,
                    child: const Padding(
                      padding: EdgeInsets.all(DimensionConstants.d15),
                      child: ImageView(
                        fit: BoxFit.cover,
                        path: ImageConstants.heartIcon,
                      ),
                    ),
                  ))
              : const SizedBox()
        ],
      ),
    );
  }

  // void swipeRight() {
  //   int currentIndex = pagecontroller.page?.toInt() ?? 0;
  //   pagecontroller.animateToPage(currentIndex + 1,
  //       duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  // }

  // void swipeLeft() {
  //   int currentIndex = pagecontroller.page?.toInt() ?? 0;
  //   pagecontroller.animateToPage(currentIndex - 1,
  //       duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  // }
}
