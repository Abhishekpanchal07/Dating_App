import 'dart:io';

import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/sharedperferences_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/helper/stop_scroll.dart';
import 'package:demoapp/services/api.dart';
import 'package:demoapp/widgets/dropdownlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterOption extends StatefulWidget {
  const FilterOption({super.key});

  @override
  State<FilterOption> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<FilterOption> {
  double currentValue = 0;
  bool onClick = false;
  bool newFriends = false;
  bool ageRange = false;
  bool language = false;
  bool location = false;

  List<String> genderCatagory = [
    StringConstants.female,
    StringConstants.male,
    StringConstants.transGenderFemale,
    StringConstants.transGenderMale,
    StringConstants.transGender
  ];

  List<String> selectLanguage = [
    StringConstants.hindi,
    StringConstants.french,
    StringConstants.spanish,
    StringConstants.german,
    StringConstants.italian
  ];
  List<String> showFriendshipCatagory = [
    StringConstants.friendship,
    StringConstants.relationship,
    StringConstants.chatting,
  ];
  List<String> ageRangeValue = [
    StringConstants.rangeOfAges,
    StringConstants.rangeOfAge1,
    StringConstants.rangeOfAge2,
    StringConstants.rangeOfAge3,
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
  Future<void> picUpdatedSuccessfully() async {
    SharedPreferences getSavedvalue = await SharedPreferences.getInstance();
    if (mounted) {
      CommonWidgets.showflushbar(
          context,
          getSavedvalue
              .getString(SharedpreferenceKeys.picUpdatedSuccessfully)
              .toString());
    }
    setState(() {
      getSavedvalue.getString(
                  SharedpreferenceKeys.picUpdatedSuccessfully) ==
              null
          ? isvalue = true
          : isvalue = false;
    });
  }

  @override
  void initState() {
   isvalue ? picUpdatedSuccessfully() : userloginSuccessfully();
    super.initState();
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
                  //     GestureDetector(
                  //       onTap: () {
                  //         Navigator.pushNamed(
                  //             context, RouteConstants.enableLocation);
                  //       },
                  //       child: const Text(StringConstants.skipText).mediumText(
                  //           ColorConstant.pink,
                  //           TextAlign.end,
                  //           DimensionConstants.d16.sp),
                  //     )
                  //   ],
                  // ),
                  const Text(StringConstants.filterOption).mediumText(
                      ColorConstant.headingcolor,
                      TextAlign.center,
                      DimensionConstants.d36.sp),
                  SizedBox(
                    height: DimensionConstants.d5.h,
                  ),
                  const Text(StringConstants.filterOptionScreenText)
                      .regularText(ColorConstant.headingcolor, TextAlign.center,
                          DimensionConstants.d16.sp),
                  const Text(StringConstants.filterOptionScreenText1)
                      .regularText(ColorConstant.headingcolor, TextAlign.center,
                          DimensionConstants.d16.sp),
                  SizedBox(
                    height: DimensionConstants.d34.h,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: const Text(StringConstants.hereto).regularText(
                        ColorConstant.headingcolor,
                        TextAlign.center,
                        DimensionConstants.d16.sp),
                  ),
                  SizedBox(
                    height: DimensionConstants.d10.h,
                  ),
                  CommonWidgets.gradientContainer(
                      text:
                          selectedFriendshipInterest ?? StringConstants.hereto,
                      imagePath: ImageConstants.dropDownIconFilterScreen,
                      ontap: () {
                        setState(() {
                          newFriends = !newFriends;
                        });
                      }),
                  SizedBox(
                    height: DimensionConstants.d8.h,
                  ),
                  newFriends
                      ? ShowDropDownList(
                          listname: showFriendshipCatagory,
                          onTap: (String title) {
                            setInterest(title);
                            newFriends = !newFriends;
                          },
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: DimensionConstants.d30.h,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: const Text(StringConstants.wantToMeet).regularText(
                        ColorConstant.headingcolor,
                        TextAlign.center,
                        DimensionConstants.d16.sp),
                  ),
                  SizedBox(
                    height: DimensionConstants.d10.h,
                  ),
                  CommonWidgets.gradientContainer(
                      text: genderValue ?? StringConstants.wantToMeet,
                      imagePath: ImageConstants.dropDownIconFilterScreen,
                      ontap: () {
                        setState(() {
                          onClick = !onClick;
                        });
                      }),
                  SizedBox(
                    height: DimensionConstants.d8.h,
                  ),
                  onClick
                      ? ShowDropDownList(
                          listname: genderCatagory,
                          onTap: (String title) {
                            setData(title);
                            onClick = !onClick;
                          },
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: DimensionConstants.d30.h,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: const Text(StringConstants.ageRange).regularText(
                        ColorConstant.headingcolor,
                        TextAlign.center,
                        DimensionConstants.d16.sp),
                  ),
                  SizedBox(
                    height: DimensionConstants.d10.h,
                  ),
                  CommonWidgets.gradientContainer(
                      text: selectedAge ?? StringConstants.ageRange,
                      imagePath: ImageConstants.dropDownIconFilterScreen,
                      ontap: () {
                        setState(() {
                          ageRange = !ageRange;
                        });
                      }),
                  SizedBox(
                    height: DimensionConstants.d8.h,
                  ),
                  ageRange
                      ? ShowDropDownList(
                          listname: ageRangeValue,
                          onTap: (String title) {
                            setAge(title);
                            ageRange = !ageRange;
                          },
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: DimensionConstants.d30.h,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: const Text(StringConstants.preferrLanguage)
                        .regularText(ColorConstant.headingcolor,
                            TextAlign.center, DimensionConstants.d16.sp),
                  ),
                  SizedBox(
                    height: DimensionConstants.d10.h,
                  ),
                  CommonWidgets.gradientContainer(
                      text: selectedLanguage ?? StringConstants.preferrLanguage,
                      imagePath: ImageConstants.dropDownIconFilterScreen,
                      ontap: () {
                        setState(() {
                          language = !language;
                        });
                      }),
                  SizedBox(
                    height: DimensionConstants.d8.h,
                  ),
                  language
                      ? ShowDropDownList(
                          listname: selectLanguage,
                          onTap: (String title) {
                            setLanguage(title);
                            language = !language;
                          },
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: DimensionConstants.d30.h,
                  ),
                  // Align(
                  //   alignment: Alignment.topLeft,
                  //   child: const Text(StringConstants.location).regularText(
                  //       ColorConstant.headingcolor,
                  //       TextAlign.center,
                  //       DimensionConstants.d16.sp),
                  // ),
                  // SizedBox(
                  //   height: DimensionConstants.d10.h,
                  // ),
                  // CommonWidgets.gradientContainer(
                  //     text: StringConstants.cityLocation,
                  //     imagePath: ImageConstants.dropDownIconFilterScreen,
                  //     ontap: () {
                  //       setState(() {
                  //         onClick = !onClick;
                  //       });
                  //     }),
                  // SizedBox(
                  //   height: DimensionConstants.d30.h,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text(StringConstants.distanceRange).regularText(
                  //         ColorConstant.headingcolor,
                  //         TextAlign.center,
                  //         DimensionConstants.d16.sp),
                  //     const Text(StringConstants.distance).regularText(
                  //         ColorConstant.darkpink,
                  //         TextAlign.center,
                  //         DimensionConstants.d16.sp),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: DimensionConstants.d30.h,
                  // ),
                  // SfSliderTheme(
                  //     data: SfSliderThemeData(
                  //         thumbStrokeColor: ColorConstant.lightred,
                  //         thumbColor: ColorConstant.textcolor,
                  //         thumbStrokeWidth: DimensionConstants.d2),
                  //     child: SfSlider(
                  //         inactiveColor: ColorConstant.headingcolor,
                  //         activeColor: ColorConstant.lightred,
                  //         value: currentValue,
                  //         onChanged: (value) {
                  //           setState(() {
                  //             currentValue = value;
                  //           });
                  //         })),
                  // SizedBox(
                  //   height: DimensionConstants.d30.h,
                  // ),
                  GestureDetector(
                      onTap: () {
                        if (mounted) {
                          filterScreenValidation(
                            context,
                            genderValue: genderValue,
                            selectedLanguage: selectedLanguage,
                            selectedAge: selectedAge,
                            selectedFriendshipInterest:
                                selectedFriendshipInterest,
                          );
                        }
                      },
                      child: CommonWidgets.commonButton(
                          StringConstants.continueText)),
                  SizedBox(
                    height: DimensionConstants.d52.h,
                  ),
                ]),
              ),
            )));
  }

  String? genderValue;
  void setData(String name) {
    setState(() {
      genderValue = name;
    });
  }

  String? selectedLanguage;
  void setLanguage(String name) {
    setState(() {
      selectedLanguage = name;
    });
  }

  String? selectedAge;
  void setAge(String age) {
    setState(() {
      selectedAge = age;
    });
  }

  String? selectedFriendshipInterest;
  void setInterest(String interestValue) {
    setState(() {
      selectedFriendshipInterest = interestValue;
    });
  }

// hit Add filter Api
  Future<void> hitAddUserFilters(
      {String? wantToMeet,
      String? hereTo,
      String? ageRange,
      String? language}) async {
    SharedPreferences getToken = await SharedPreferences.getInstance();
    try {
      final modal = await Api.addUserFilters(
        hereTo: hereTo,
        wantToMeet: wantToMeet,
        ageRange: ageRange,
        language: language,
        tokenValue:   getToken.getString(SharedpreferenceKeys.jwtToken),
       
      );
       // set message value
      SharedPreferences setMessageValue = await SharedPreferences.getInstance();
      setMessageValue.setString(
          SharedpreferenceKeys.filterUpdatedSuccessfully, modal.message);
      if (modal.success == true) {
        if (mounted) {
         
          Navigator.pushNamed(context, RouteConstants.enableLocation);
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

  // validation function
  void filterScreenValidation(
    BuildContext context, {
    String? genderValue,
    String? selectedLanguage,
    String? selectedAge,
    String? selectedFriendshipInterest,
  }) {
    if (selectedFriendshipInterest == null) {
      CommonWidgets.showflushbar(
          context, StringConstants.filterScreenErrorMessage);
    } else if (genderValue == null) {
      CommonWidgets.showflushbar(
          context, StringConstants.filterScreenErrorMessage1);
    } else if (selectedAge == null) {
      CommonWidgets.showflushbar(
          context, StringConstants.filterScreenErrorMessage2);
    } else if (selectedLanguage == null) {
      CommonWidgets.showflushbar(
          context, StringConstants.filterScreenErrorMessage3);
    } else {
      hitAddUserFilters(
          hereTo: selectedFriendshipInterest,
          wantToMeet: genderValue,
          ageRange: selectedAge,
          language: selectedLanguage);
    }
  }
}
