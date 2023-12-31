import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/sharedperferences_constants.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/views/homepage_bottom_navigation.dart';
import 'package:demoapp/views/inbox_screen.dart';
import 'package:demoapp/views/matches.dart';
import 'package:demoapp/views/user_account_screen.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<BottomNavigationScreen> {
  int currentIndex = 0;
  bool onClick = false;
  List<Widget> screeens = [
    const HomePageBottomNavigationScreen(),
    const MatchScreen(),
    const InboxScreen(),
    const UserAccountScreen(),
  ];
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
  Future<void> enableLocationSuccessfully() async {
    SharedPreferences getSavedvalue = await SharedPreferences.getInstance();
    if (mounted) {
      CommonWidgets.showflushbar(
          context,
          getSavedvalue
              .getString(SharedpreferenceKeys.enablelocationSuccessfully)
              .toString());
    }
    setState(() {
      getSavedvalue.getString(
                  SharedpreferenceKeys.enablelocationSuccessfully) ==
              null
          ? isvalue = true
          : isvalue = false;
    });
  }

  @override
  void initState() {
    isvalue ? enableLocationSuccessfully() : userloginSuccessfully();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screeens.elementAt(currentIndex),
      bottomNavigationBar: Container(
        height: DimensionConstants.d81.h,
        width: DimensionConstants.d414.w,
        color: ColorConstant.textcolor,
        child: Stack(
          children: [
            Container(
              height: DimensionConstants.d2.h,
              width: DimensionConstants.d414.w,
              color: ColorConstant.grey,
            ),
            Positioned(
              top: DimensionConstants.d5.h,
              left: DimensionConstants.d1.w,
              right: DimensionConstants.d5.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  currentIndex == 0
                      ? Container(
                          height: DimensionConstants.d5.h,
                          width: DimensionConstants.d50.w,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                            ColorConstant.buttongradientcolor1,
                            ColorConstant.buttongradientcolor2
                          ])))
                      : const SizedBox(),
                  SizedBox(
                    width: DimensionConstants.d40.w,
                  ),
                  currentIndex == 1
                      ? Container(
                          height: DimensionConstants.d5.h,
                          width: DimensionConstants.d50.w,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                            ColorConstant.buttongradientcolor1,
                            ColorConstant.buttongradientcolor2
                          ])))
                      : const SizedBox(),
                  SizedBox(
                    width: DimensionConstants.d40.w,
                  ),
                  currentIndex == 2
                      ? Container(
                          height: DimensionConstants.d5.h,
                          width: DimensionConstants.d50.w,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                            ColorConstant.buttongradientcolor1,
                            ColorConstant.buttongradientcolor2
                          ])))
                      : const SizedBox(),
                  SizedBox(
                    width: DimensionConstants.d40.w,
                  ),
                  currentIndex == 3
                      ? Container(
                          height: DimensionConstants.d5.h,
                          width: DimensionConstants.d50.w,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                            ColorConstant.buttongradientcolor1,
                            ColorConstant.buttongradientcolor2
                          ])))
                      : const SizedBox(),
                ],
              ),
            ),
            Positioned(
              top: DimensionConstants.d18.h,
              //left: DimensionConstants.d30.w,
              //bottom: DimensionConstants.d5.h,
              right: DimensionConstants.d5.w,
              child: SizedBox(
                height: DimensionConstants.d82.h,
                width: DimensionConstants.d413.w,
                child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    elevation: DimensionConstants.d6,
                    currentIndex: currentIndex,
                    onTap: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    items: [
                      BottomNavigationBarItem(
                          icon: currentIndex == 0
                              ? const ImageView(
                                  path: ImageConstants.dashboardIcon,
                                )
                              : const ImageView(
                                  path: ImageConstants.dashboardHomeIcon,
                                ),
                          label: ''),
                      BottomNavigationBarItem(
                          icon: currentIndex == 1
                              ? const ImageView(
                                  path: ImageConstants.dashboardMenu1Icon,
                                )
                              : const ImageView(
                                  path: ImageConstants.dashboardMenuIcon,
                                ),
                          label: ''),
                      BottomNavigationBarItem(
                          icon: currentIndex == 2
                              ? const ImageView(
                                  path: ImageConstants.dashboardChattingIcon,
                                )
                              : const ImageView(
                                  path: ImageConstants.chattingIcon,
                                ),
                          label: ''),
                      BottomNavigationBarItem(
                          icon: currentIndex == 3
                              ? const ImageView(
                                  path: ImageConstants.personAccountIcon,
                                )
                              : const ImageView(
                                  path: ImageConstants.accountIcon,
                                ),
                          label: '')
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
