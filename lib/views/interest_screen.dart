import 'dart:io';
import 'package:demoapp/constants/Color_Constants.dart';
import 'package:demoapp/constants/Dimension_Constant.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/sharedperferences_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/helper/stop_scroll.dart';
import 'package:demoapp/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestState();
}

class _InterestState extends State<InterestScreen> {
  bool isSeeMore = false;
  bool interest = false;
  List<String> containerText = [
    StringConstants.photographyText,
    StringConstants.trackkingText,
    StringConstants.racingText,
    StringConstants.musicText,
    StringConstants.travelingText,
    StringConstants.shopingText,
    StringConstants.campingText,
    StringConstants.artCraftText,
    StringConstants.swimmingText,
    StringConstants.drinkingText,
    StringConstants.extreameSportsText,
    StringConstants.fitnessText,
  ];
  List<bool> selectInterest = [];

  List<String>? passArguments = [];
  List? userInterests = [];
  Future<void> userloginSuccessfully() async {
    SharedPreferences getSavedvalue = await SharedPreferences.getInstance();
    if (mounted) {
      CommonWidgets.showflushbar(
          context,
          getSavedvalue
              .getString(SharedpreferenceKeys.loginSuccessfully)
              .toString());
    }
  }

  bool isvalue = false;
  Future<void> profileUpdatedSuccessfully() async {
    SharedPreferences getSavedvalue = await SharedPreferences.getInstance();
    if (mounted) {
      CommonWidgets.showflushbar(
          context,
          getSavedvalue
              .getString(SharedpreferenceKeys.profileUpdatedSuccessfully)
              .toString());
    }
    setState(() {
      getSavedvalue
                  .getString(SharedpreferenceKeys.profileUpdatedSuccessfully) ==
              null
          ? isvalue = true
          : isvalue = false;
    });
  }

  @override
  void initState() {
    super.initState();
    for (var i = 1; i <= containerText.length; i++) {
      selectInterest.add(false);
      isvalue ? profileUpdatedSuccessfully() : userloginSuccessfully();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: DimensionConstants.d73.h,
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
        child: ScrollConfiguration(
          behavior: NoGlowScrollBehavior(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.pop(context);
                //       },
                //       child: ImageView(
                //         path: ImageConstants.leftArrowIcon,
                //         height: DimensionConstants.d24.h,
                //         width: DimensionConstants.d24.w,
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.pushNamed(context, RouteConstants.addPhotoScreen);
                //       },
                //       child: const Text(StringConstants.skipText).mediumText(
                //           ColorConstant.pink,
                //           TextAlign.end,
                //           DimensionConstants.d16.sp),
                //     )
                //   ],
                // ),
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
                SizedBox(
                  height: isSeeMore
                      ? DimensionConstants.d500.h
                      : DimensionConstants.d160.h,
                  child: ScrollConfiguration(
                    behavior: NoGlowScrollBehavior(),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
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
                                String selectedContainerText =
                                    containerText[index];
                                // selectInterest[index]
                                //     ? passArguments!.add(selectedContainerText)
                                //     : passArguments!.remove(selectedContainerText);
                                //print(passArguments!.length);
                                for (int i = 0; i < 1; i++) {
                                  selectInterest[index]
                                      ? userInterests!.add({
                                          "intrestName": selectedContainerText
                                        })
                                      : userInterests!.removeWhere((element) =>
                                          element["intrestName"] ==
                                          selectedContainerText);
                                }
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
                ),
                SizedBox(
                  height: DimensionConstants.d27.h,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSeeMore = !isSeeMore;
                    });
                  },
                  child: GradientText(
                    isSeeMore ? StringConstants.hide : StringConstants.seeMore,
                    colors: const [
                      ColorConstant.colorF53F77,
                      ColorConstant.color8948EF
                    ],
                    style: TextStyle(
                        fontFamily: StringConstants.familyName,
                        fontWeight: FontWeight.w500,
                        fontSize: DimensionConstants.d16.sp),
                  ),
                ),
                SizedBox(
                  height: DimensionConstants.d24.h,
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        // if (passArguments!.isEmpty) {
                        //   // CommonWidgets.showflushbar(
                        //   //     context, StringConstants.unTapInterestError);
                        //   Navigator.pushNamed(
                        //       context, RouteConstants.userDetailScreen,
                        //       arguments: []);
                        // } else {
                        //   Navigator.pushNamed(
                        //       context, RouteConstants.userDetailScreen,
                        //       arguments: passArguments);
                        // }
                        if (userInterests!.isEmpty) {
                          CommonWidgets.showflushbar(context,
                              StringConstants.unchooseInterestErrorMessage);
                        } else {
                          hitUserInterestApi();
                        }
                      });
                    },
                    child: CommonWidgets.commonButton(
                        StringConstants.continueText)),
                SizedBox(
                  height: DimensionConstants.d112.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // hit add interest Api
  Future<void> hitUserInterestApi() async {
    SharedPreferences getToken = await SharedPreferences.getInstance();
    try {
      final modal = await Api.addUserInterest(
        
          userInterest: userInterests,
          tokenValue:  getToken.getString(SharedpreferenceKeys.jwtToken),
          );
          // set message value 
      SharedPreferences setMessageValue = await SharedPreferences.getInstance();
      setMessageValue.setString(
          SharedpreferenceKeys.interestUpdatedSuccessfully, modal.message);
      if (modal.success == true) {
        if (mounted) {
         // CommonWidgets.showflushbar(context, modal.message.toString());
          Navigator.pushNamed(context, RouteConstants.addPhotoScreen);
        }
      } else {
        if (mounted) {
          CommonWidgets.showflushbar(context, modal.message.toString());
        }
      }
    } on SocketException catch (e) {
      if (mounted) {
        CommonWidgets.showflushbar(context, e.toString());
      }
    }
  }
}
