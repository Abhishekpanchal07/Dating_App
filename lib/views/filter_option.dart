import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/widgets/dropdownlist.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

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
    StringConstants.rangeOfAge1,
    StringConstants.rangeOfAge2,
    StringConstants.rangeOfAge3,
  ];

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
            child: SingleChildScrollView(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: ImageView(
                        path: ImageConstants.leftArrowIcon,
                        height: DimensionConstants.d24.h,
                        width: DimensionConstants.d24.w,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteConstants.enableLocation);
                      },
                      child: const Text(StringConstants.skipText).mediumText(
                          ColorConstant.pink,
                          TextAlign.end,
                          DimensionConstants.d16.sp),
                    )
                  ],
                ),
                const Text(StringConstants.filterOption).mediumText(
                    ColorConstant.headingcolor,
                    TextAlign.center,
                    DimensionConstants.d36.sp),
                SizedBox(
                  height: DimensionConstants.d5.h,
                ),
                const Text(StringConstants.filterOptionScreenText).regularText(
                    ColorConstant.headingcolor,
                    TextAlign.center,
                    DimensionConstants.d16.sp),
                const Text(StringConstants.filterOptionScreenText1).regularText(
                    ColorConstant.headingcolor,
                    TextAlign.center,
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
                    text: selectedFriendshipInterest ??
                        StringConstants.makeNewFriends,
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
                    text: genderValue ?? StringConstants.female,
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
                    text: selectedAge ?? StringConstants.rangeOfAge,
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
                      .regularText(ColorConstant.headingcolor, TextAlign.center,
                          DimensionConstants.d16.sp),
                ),
                SizedBox(
                  height: DimensionConstants.d10.h,
                ),
                CommonWidgets.gradientContainer(
                    text: selectedLanguage ?? StringConstants.english,
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
                Align(
                  alignment: Alignment.topLeft,
                  child: const Text(StringConstants.location).regularText(
                      ColorConstant.headingcolor,
                      TextAlign.center,
                      DimensionConstants.d16.sp),
                ),
                SizedBox(
                  height: DimensionConstants.d10.h,
                ),
                CommonWidgets.gradientContainer(
                    text: StringConstants.cityLocation,
                    imagePath: ImageConstants.dropDownIconFilterScreen,
                    ontap: () {
                      setState(() {
                        onClick = !onClick;
                      });
                    }),
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
                  height: DimensionConstants.d30.h,
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
                  height: DimensionConstants.d30.h,
                ),
                GestureDetector(
                    onTap: () {
                      CommonWidgets.filterScreenValidation(context,
                          genderValue: genderValue,
                          selectedLanguage: selectedLanguage,
                          selectedAge: selectedAge,
                          selectedFriendshipInterest:
                              selectedFriendshipInterest);
                    },
                    child: CommonWidgets.commonButton(
                        StringConstants.continueText)),
                SizedBox(
                  height: DimensionConstants.d52.h,
                ),
              ]),
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
}
