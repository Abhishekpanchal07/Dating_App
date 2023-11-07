import 'dart:developer';
import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class EnableLocation extends StatefulWidget {
  
   const EnableLocation({super.key});

  @override
  State<EnableLocation> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<EnableLocation> {
  bool onTap = false;
  Position? exactLoaction;
  String? currentLocation;
  double currentValue = 0;

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
      child: Column(children: [
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
        //    GestureDetector(
        //     onTap: () {
        //       Navigator.pushNamed(context, RouteConstants.bottonNavigationScreen);
        //     },
        //     child:  const Text(StringConstants.skipText).mediumText(
        //         ColorConstant.pink, TextAlign.end, DimensionConstants.d16.sp),
        //    )
        //   ],
        // ),
        const Text(StringConstants.location).mediumText(
            ColorConstant.headingcolor,
            TextAlign.center,
            DimensionConstants.d36.sp),
        SizedBox(
          height: DimensionConstants.d5.h,
        ),
        const Text(StringConstants.locationScreenText).regularText(
            ColorConstant.headingcolor,
            TextAlign.center,
            DimensionConstants.d16.sp),
        const Text(StringConstants.locationScreenText1).regularText(
            ColorConstant.headingcolor,
            TextAlign.center,
            DimensionConstants.d16.sp),
        SizedBox(
          height: DimensionConstants.d40.h,
        ),
        SizedBox(
          height: DimensionConstants.d39.h,
          width: DimensionConstants.d373.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(StringConstants.enableLocation).regularText(
                  ColorConstant.headingcolor,
                  TextAlign.start,
                  DimensionConstants.d16.sp),
              Transform.scale(
                scale: DimensionConstants.d1,
                child: SizedBox(
                  width: DimensionConstants.d80.w,
                  child: CupertinoSwitch(
                      thumbColor: ColorConstant.lightred,
                      activeColor: ColorConstant.headingcolor,
                      trackColor: ColorConstant.headingcolor,
                      value: onTap,
                      onChanged: (value) async {
                        setState(() {
                          onTap = !onTap;
                        });
                        if (value) {
                          try {
                            await getCurrentLocation(); // Wait for getCurrentLocation to complete
                            await getAddress();
                          } catch (e) {
                            log(e.toString());
                          }
                        }
                      }),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: DimensionConstants.d30.h,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: const Text(StringConstants.currentLoaction).regularText(
              ColorConstant.headingcolor,
              TextAlign.center,
              DimensionConstants.d16.sp),
        ),
       
        SizedBox(
          height: DimensionConstants.d30.h,
        ),
        CommonWidgets.gradientContainer(
          text: currentLocation ?? StringConstants.locationValue,
          imagePath: ImageConstants.locationIcon,
        ),
         SizedBox(
                    height: DimensionConstants.d30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(StringConstants.distanceRange).regularText(
                          ColorConstant.headingcolor,
                          TextAlign.center,
                          DimensionConstants.d16.sp),
                      const Text(StringConstants.distance).regularText(
                          ColorConstant.darkpink,
                          TextAlign.center,
                          DimensionConstants.d16.sp),
                    ],
                  ),
                  SizedBox(
                    height: DimensionConstants.d20.h,
                  ),
                  SfSliderTheme(
                      data: SfSliderThemeData(
                          thumbStrokeColor: ColorConstant.lightred,
                          thumbColor: ColorConstant.textcolor,
                          thumbStrokeWidth: DimensionConstants.d2),
                      child: SfSlider(
                          inactiveColor: ColorConstant.headingcolor,
                          activeColor: ColorConstant.lightred,
                          value: currentValue,
                          onChanged: (value) {
                            setState(() {
                              currentValue = value;
                            });
                          })),
        SizedBox(
          height: DimensionConstants.d40.h,
        ),
        GestureDetector(
            onTap: () {
              if (currentLocation == null) {
                CommonWidgets.showflushbar(
                    context, StringConstants.enableLocationError);
              }
              Navigator.pushNamed(
                  context, RouteConstants.bottonNavigationScreen);
            },
            child: CommonWidgets.commonButton(StringConstants.continueText)),
      ]),
    ));
  }

  getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (mounted) {
        CommonWidgets.showflushbar(context, StringConstants.disableLocation);
      }
    }

    permission = (await Geolocator.checkPermission());
    if (permission == LocationPermission.denied) {
      permission = (await Geolocator.requestPermission());
      if (permission == LocationPermission.denied) {
        if (mounted) {
          CommonWidgets.showflushbar(context, StringConstants.deniedLocation);
        }
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (mounted) {
        CommonWidgets.showflushbar(
            context, StringConstants.permanentlyDeniedLocation);
      }
    }

    exactLoaction = await Geolocator.getCurrentPosition();
    setState(() {});
  }

  Future<void> getAddress() async {
    try {
      if (exactLoaction != null) {
        List<Placemark> placeMarks = await placemarkFromCoordinates(
            exactLoaction!.latitude.toDouble(),
            exactLoaction!.longitude.toDouble());
        Placemark place = placeMarks[0];
        setState(() {
          currentLocation = "${place.locality},${place.country}";
        });
        setState(() {});
      }
      //  else {
      //   CommonWidgets.showflushbar(
      //       context, StringConstants.confirmPasswordError);
      // }
    } catch (e) {
      log(e.toString());
    }
  }
}
