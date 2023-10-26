import 'package:demoapp/constants/Dimension_Constant.dart';
import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/helper/stop_scroll.dart';
import 'package:demoapp/modals/drag_widget.dart';
import 'package:demoapp/modals/homepage_data.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomePageBottomNavigationScreen extends StatefulWidget {
  const HomePageBottomNavigationScreen({super.key});

  @override
  State<HomePageBottomNavigationScreen> createState() =>
      _HomePageBottomNavigationScreenState();
}

class _HomePageBottomNavigationScreenState
    extends State<HomePageBottomNavigationScreen>  with SingleTickerProviderStateMixin {
  
  ValueNotifier<Swipe> swipeNotifier = ValueNotifier(Swipe.none);

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
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        userDetails.removeLast();
        _animationController.reset();
        swipeNotifier.value = Swipe.none;
      }
    });
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
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ValueListenableBuilder(
                        valueListenable: swipeNotifier,
                        builder: (context, swipe, _) => Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: List.generate(userDetails.length, (index) {
                            if (index == userDetails.length - 1) {
                              return PositionedTransition(
                                  rect: RelativeRectTween(
                                    begin: RelativeRect.fromSize(
                                        const Rect.fromLTWH(0, 0, 580, 340),
                                        const Size(580, 340)),
                                    end: RelativeRect.fromSize(
                                        Rect.fromLTWH(
                                            swipe != Swipe.none
                                                ? swipe == Swipe.left
                                                    ? -300
                                                    : 300
                                                : 0,
                                            0,
                                            580,
                                            340),
                                        const Size(580, 340)),
                                  ).animate(CurvedAnimation(
                                    parent: _animationController,
                                    curve: Curves.easeInOut,
                                  )),
                                  child: RotationTransition(
                                      turns: Tween<double>(
                                              begin: 0,
                                              end: swipe != Swipe.none
                                                  ? swipe == Swipe.left
                                                      ? -0.1 * 0.3
                                                      : 0.1 * 0.3
                                                  : 0.0)
                                          .animate(
                                        CurvedAnimation(
                                          parent: _animationController,
                                          curve: const Interval(0, 0.4,
                                              curve: Curves.easeInOut),
                                        ),
                                      ),
                                      child: DragWidget(
                                        homepageDetailsOfUser:
                                            userDetails[index],
                                        index: index,
                                        swipeNotifier: swipeNotifier,
                                        isLastCard: true,
                                      )));
                            }
                            else {
                  return DragWidget(
                    homepageDetailsOfUser: userDetails[index],
                    index: index,
                    swipeNotifier: swipeNotifier, 
                    
                  );
                }
                          }),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: DragTarget<int>(
                        builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                        ) {
                          return IgnorePointer(
                            child: Container(
                              height: 700.0,
                              width: 80.0,
                              color: Colors.transparent,
                            ),
                          );
                        },
                        onAccept: (int index) {
                          setState(() {
                            userDetails.removeAt(index);
                          });
                        },
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: DragTarget<int>(
                        builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                        ) {
                          return IgnorePointer(
                            child: Container(
                              height: 700.0,
                              width: 80.0,
                              color: Colors.transparent,
                            ),
                          );
                        },
                        onAccept: (int index) {
                          setState(() {
                            userDetails.removeAt(index);
                          });
                        },
                      ),
                    ),
                  ],
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
                         swipeNotifier.value = Swipe.left;
                    _animationController.forward();
                        
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
                         swipeNotifier.value = Swipe.right;
                    _animationController.forward();
                        
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

 
}
