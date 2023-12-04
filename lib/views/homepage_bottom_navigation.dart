import 'package:demoapp/constants/Dimension_Constant.dart';
import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/sharedperferences_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/helper/stop_scroll.dart';
import 'package:demoapp/modals/drag_widget.dart';
import 'package:demoapp/providers/homepage_bottomnavigation_provider.dart';
import 'package:demoapp/views/base_view.dart';
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
    extends State<HomePageBottomNavigationScreen>
    with SingleTickerProviderStateMixin {
  ValueNotifier<Swipe> swipeNotifier = ValueNotifier(Swipe.none);
  late final AnimationController _animationController;

  // List<HomepageDetailsOfUser> userDetails = [
  //   // HomepageDetailsOfUser(
  //   //     name: StringConstants.jesicaParker,
  //   //     horoscopeValue: StringConstants.aries,
  //   //     userImage:userImagesUrl),
  //   // HomepageDetailsOfUser(
  //   //     name: StringConstants.jesicaParker,
  //   //     horoscopeValue: StringConstants.aries,
  //   //     userImage:userImagesUrl
  //   //     // ImageConstants.testingImage
  //   //     ),
  //   // HomepageDetailsOfUser(
  //   //     name: StringConstants.jesicaParker,
  //   //     horoscopeValue: StringConstants.aries,
  //   //     userImage:userImagesUrl!
  //   //     // ImageConstants.testingImage1
  //   //      ),
  //   // HomepageDetailsOfUser(
  //   //     name: StringConstants.jesicaParker,
  //   //     horoscopeValue: StringConstants.aries,
  //   //     userImage:userImagesUrl!
  //   //     // ImageConstants.testingImage2
  //   //      ),
  //   // HomepageDetailsOfUser(
  //   //     name: StringConstants.jesicaParker,
  //   //     horoscopeValue: StringConstants.aries,
  //   //     userImage:userImagesUrl!
  //   //      //ImageConstants.testingImage3
  //   //      ),
  //   // HomepageDetailsOfUser(
  //   //     name: StringConstants.jesicaParker,
  //   //     horoscopeValue: StringConstants.aries,
  //   //     userImage:userImagesUrl!
  //   //      //ImageConstants.testingImage4
  //   //      ),
  //   // HomepageDetailsOfUser(
  //   //     name: StringConstants.jesicaParker,
  //   //     horoscopeValue: StringConstants.aries,
  //   //     userImage:userImagesUrl!
  //   //     // ImageConstants.testingImage5
  //   //      ),
  // ];

  // @override
  // void initState() {
  //   super.initState();
  //   //hitApi();

  // }

  // @override
  // Widget build(BuildContext context) {
  //
  //   throw UnimplementedError();
  // }

  // Future<void> hitApi() async {
  //   await hitUserListingApi();
  //   _animationController = AnimationController(
  //     duration: const Duration(milliseconds: 500),
  //     vsync: this,
  //   );
  //   _animationController.addStatusListener((status) {
  //     if (status == AnimationStatus.completed) {
  //       provider.userDetails.removeLast();
  //       _animationController.reset();
  //       swipeNotifier.value = Swipe.none;
  //     }
  //   });
  // setState(() {});

  @override
  void dispose() {
    super.dispose();
    swipeNotifier.dispose();
    _animationController.dispose();
  }

  // UserListing? modal;
  int usercurrentindex = 0;

  @override
  Widget build(BuildContext context) {
    return BaseView<HomePageProvider>(
      onModelReady: (provider) async {
        SharedpreferenceKeys.islogin = true;
        await provider.hitUserListingApi(context);
        _animationController = AnimationController(
          duration: const Duration(milliseconds: 500),
          vsync: this,
        );
        _animationController.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            provider.userDetails.removeLast();
            _animationController.reset();
            swipeNotifier.value = Swipe.none;
          }
        });
        
      },
      builder: (context, provider, child) => Scaffold(
        body: provider.modal == null
            ? CommonWidgets.showProgressbar()
            : Container(
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
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteConstants.notificationScreen);
                          },
                          child: const ImageView(
                            path: ImageConstants.notificationIconInboxScreen,
                          ),
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
                                  children: List.generate(
                                      provider.userDetails.length, (index) {
                                    provider.usercurrentindex = index;
                                   
                                    if (index ==
                                        provider.userDetails.length - 1) {
                                      return PositionedTransition(
                                          rect: RelativeRectTween(
                                            begin: RelativeRect.fromSize(
                                                const Rect.fromLTWH(
                                                    0, 0, 580, 340),
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
                                                    provider.userDetails[index],
                                                index: index,
                                                swipeNotifier: swipeNotifier,
                                                isLastCard: true,
                                              )));
                                    } else {
                                      return DragWidget(
                                        homepageDetailsOfUser:
                                            provider.userDetails[index],
                                        //userimages: dummyImages,
                                        //userDetails[index].userImage,
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
                                  provider
                                      .userDetails[index].opponentid![index];
                                  provider.userDetails.removeAt(index);
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
                                  provider
                                      .userDetails[index].opponentid![index];
                                  provider.userDetails.removeAt(index);
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
                                provider.swipeLeft(context,
                                    useropponentid:
                                        provider
                                                .userDetails[
                                                    provider.usercurrentindex!]
                                                .opponentid![
                                            provider.usercurrentindex!]);
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
                                    padding:
                                        EdgeInsets.all(DimensionConstants.d15),
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
                                provider.swipeRight(context,
                                    useropponentid:
                                        provider
                                                .userDetails[
                                                    provider.usercurrentindex!]
                                                .opponentid![
                                            provider.usercurrentindex!]);
                                swipeNotifier.value = Swipe.right;
                                _animationController.forward();
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: ColorConstant.red,
                                    shape: BoxShape.circle),
                                height: DimensionConstants.d80.h,
                                width: DimensionConstants.d80.w,
                                child: const Padding(
                                  padding:
                                      EdgeInsets.all(DimensionConstants.d15),
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
      ),
    );
  }
}

// get user listing
// Future<void> hitUserListingApi() async {
//   SharedPreferences getToken = await SharedPreferences.getInstance();
//   try {
//     modal = await Api.userlisting(
//         jwtToken: getToken.getString(SharedpreferenceKeys.jwtToken));

//     if (modal!.success == true) {
//       for (int i = 0; i < modal!.data!.length; i++) {
//         if (modal!.data![i].status == 5) {
//           DateTime currentDate = DateTime.now();
//           DateTime userDob = DateTime.parse(modal!.data![i].birthDate);
//           int currentAge = currentDate.year - userDob.year;

//           userDetails.add(
//             HomepageDetailsOfUser(
//               name:
//                   '${modal!.data![i].firstName}${modal!.data![i].lastName},${currentAge.toString()}',
//               horoscopeValue: modal!.data![i].zodiac,
//               userImage: modal!.data![i].image[0].image,
//               //location: modal.data![i].userLocation
//             ),
//           );

//         }
//       }
//       setState(() {});
//     }
//   } on DioException catch (e) {
//     if (mounted) {
//       CommonWidgets.showflushbar(context, e.toString());
//     }
//   }
// }
