import 'dart:developer';

import 'package:demoapp/constants/Color_Constants.dart';
import 'package:demoapp/constants/api_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/sharedperferences_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/helper/stop_scroll.dart';
import 'package:demoapp/services/api.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class UserAccountScreen extends StatefulWidget {
  // final List? conatinerChildTextValue;
  const UserAccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<UserAccountScreen> createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  @override
  void initState() {
    hitgettinguserDetailApi();
    super.initState();
  }

  void hitgettinguserDetailApi() async {
    await hitUserById();
    await getAddress();
    setState(() {});
  }

  List conatinerChildTextValue = [];
  List<String> userImages = [];
  String userName = "";
  int? userAge;
  String userEmail = "";
  String userBirthdate = "";
  String userAbout = "";
  String hereTo = "";
  double? longitude;
  double? latitude;
  String? userCurrentLocation;
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
                  
                    itemCount: userImages.length,
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ImageView(
                        fit: BoxFit.cover,
                        path: ApiUrls.baseUrl + userImages[index],
                      );
                    }),
              ),
            ),
            Positioned(
                top: DimensionConstants.d359.h,
                left: DimensionConstants.d196.w,
                child: SmoothPageIndicator(
                  controller: controller,
                  count: userImages.length,
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
                //top: DimensionConstants.d400.h,
                child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: draggableSheet(),
            ))
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
        height: DimensionConstants.d29.h,
        width: DimensionConstants.d116.w,
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

  // draggable sheet
  Widget draggableSheet() {
    return DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (BuildContext context, scrollController) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: ColorConstant.textcolor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    DimensionConstants.d30,
                  ),
                  topRight: Radius.circular(
                    DimensionConstants.d30,
                  ),
                )),
            child: ScrollConfiguration(
              behavior: NoGlowScrollBehavior(),
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 1,
                  controller: scrollController,
                  itemBuilder: ((context, index) {
                    return Container(
                      padding: EdgeInsets.only(
                        top: DimensionConstants.d31.h,
                        left: DimensionConstants.d20.w,
                        right: DimensionConstants.d20.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(userName + userAge.toString()).bold(
                              ColorConstant.black,
                              TextAlign.center,
                              DimensionConstants.d24.sp),
                          SizedBox(
                            height: DimensionConstants.d9.h,
                          ),
                          Text(userEmail).regularText(ColorConstant.black,
                              TextAlign.start, DimensionConstants.d14.sp),
                          SizedBox(
                            height: DimensionConstants.d30.h,
                          ),
                          // zodiac Sign
                          const Text(StringConstants.horoscope).bold(
                              ColorConstant.black,
                              TextAlign.center,
                              DimensionConstants.d16.sp),
                          SizedBox(
                            height: DimensionConstants.d9.h,
                          ),
                          Text(userEmail).regularText(ColorConstant.black,
                              TextAlign.start, DimensionConstants.d14.sp),

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
                           Text(userCurrentLocation!)
                              .regularText(ColorConstant.black,
                                  TextAlign.center, DimensionConstants.d16.sp),
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
                          Text(userBirthdate).regularText(ColorConstant.black,
                              TextAlign.center, DimensionConstants.d16.sp),

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

                          Text(userAbout).regularText(
                            ColorConstant.black,
                            TextAlign.start,
                            DimensionConstants.d14.sp,
                          ),

                          SizedBox(
                            height: DimensionConstants.d30.h,
                          ),
                          // Here to

                          const Text(StringConstants.hereto).bold(
                              ColorConstant.black,
                              TextAlign.center,
                              DimensionConstants.d16.sp),
                          SizedBox(
                            height: DimensionConstants.d9.h,
                          ),

                          Text(hereTo).regularText(
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
                            height: DimensionConstants.d20.h,
                          ),

                          GridView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: conatinerChildTextValue.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: DimensionConstants.d7.w,
                                mainAxisSpacing: DimensionConstants.d10.h,
                                childAspectRatio: DimensionConstants.d4,
                              ),
                              itemBuilder: (context, index) {
                                return conatinerChildTextValue.isNotEmpty
                                    ? gradientcontainer(
                                        containerchildText:
                                            conatinerChildTextValue[index])
                                    : const SizedBox();
                              })
                        ],
                      ),
                    );
                  })),
            ),
          );
        });
  }

  // getting user details
  Future<void> hitUserById() async {
    SharedPreferences getSavedValues = await SharedPreferences.getInstance();
    try {
      final modal = await Api.userById(
          jwtToken: getSavedValues.getString(SharedpreferenceKeys.jwtToken));

      if (modal.success == true) {
        DateTime currentDate = DateTime.now();
        DateTime userDob = DateTime.parse(modal.data![0].birthDate);
        int currentAge = currentDate.year - userDob.year;
        userBirthdate = DateFormat('dd-MM-yyyy')
            .format(DateTime.parse(modal.data![0].birthDate));
        userName = modal.data![0].firstName + modal.data![0].lastName;
        userAge = currentAge;
        userEmail = modal.data![0].email;
        userAbout = modal.data![0].about;
        hereTo = modal.data![0].filter[0].hereTo;
        for (int i = 0; i < modal.data![0].userInterst.length; i++) {
          conatinerChildTextValue
              .add(modal.data![0].userInterst[i].intrestName);
        }
        for (int i = 0; i < modal.data![0].images[0].image.length; i++) {
          userImages.add(modal.data![0].images[0].image[i]);
        }
        // longitude
        longitude = modal.data![0].location[0].longitude;
        // latitude
        latitude = modal.data![0].location[0].latitude;
        // horoscope value
        // userhoroscope = modal.data![0].zodiac;

        log(userName);
        log(userBirthdate);
        log(userAbout);
      }
    } on DioException catch (e) {
      if (mounted) {
        CommonWidgets.showflushbar(context, e.toString());
      }
    }
  }

  // get user location
  Future<void> getAddress() async {
    try {
      List<Placemark> placeMarks =
          await placemarkFromCoordinates(latitude!, longitude!);
      Placemark place = placeMarks[0];
      setState(() {
        userCurrentLocation = "${place.locality},${place.country}";
      });
      setState(() {});

      //  else {
      //   CommonWidgets.showflushbar(
      //       context, StringConstants.confirmPasswordError);
      // }
    } catch (e) {
      log(e.toString());
    }
  }
}
