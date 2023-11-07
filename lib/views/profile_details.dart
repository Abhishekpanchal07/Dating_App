import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/helper/stop_scroll.dart';
import 'package:demoapp/widgets/dropdownlist.dart';
import 'package:demoapp/widgets/custom_dialogbox.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final aboutController = TextEditingController();
  final dobController = TextEditingController();
  String _image = "";
  bool onclick = false;
  bool ontap = false;
  String selectedValue = StringConstants.horoscope;
  String selectGender = StringConstants.selectGender;
  List<String> gendersName = [
    StringConstants.female,
    StringConstants.male,
    StringConstants.transGenderFemale,
    StringConstants.transGenderMale,
    StringConstants.transGender
  ];
  List<String> rashiName = [
    StringConstants.aries,
    StringConstants.taurus,
    StringConstants.gemini,
    StringConstants.cancer,
    StringConstants.leo,
    StringConstants.vigro,
    StringConstants.libra,
    StringConstants.scarpio,
    StringConstants.sagittarius,
    StringConstants.capricorn,
    StringConstants.aquarius,
    StringConstants.pisces
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(
            top: DimensionConstants.d90.h,
            left: DimensionConstants.d20.w,
            right: DimensionConstants.d20.w,
          ),
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
                  //         Navigator.pushNamed(
                  //             context, RouteConstants.createNewPasswordScreen);
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
                  //             context, RouteConstants.interestScreen);
                  //       },
                  //       child: const Text(StringConstants.skipText).mediumText(
                  //           ColorConstant.pink,
                  //           TextAlign.end,
                  //           DimensionConstants.d16.sp),
                  //     )
                  //   ],
                  // ),
                  const Text(StringConstants.profileDetails).mediumText(
                      ColorConstant.headingcolor,
                      TextAlign.center,
                      DimensionConstants.d36.sp),
                  SizedBox(
                    height: DimensionConstants.d10.h,
                  ),
                  const Text(StringConstants.followingDetails).regularText(
                      ColorConstant.headingcolor,
                      TextAlign.center,
                      DimensionConstants.d16.sp),
                  SizedBox(
                    height: DimensionConstants.d34.h,
                  ),
                  Stack(
                    children: [
                      ImageView(
                          path: _image.isNotEmpty
                              ? _image
                              : ImageConstants.personIcon,
                          radius: DimensionConstants.d60.r,
                          height: _image.isNotEmpty
                              ? DimensionConstants.d116.h
                              : DimensionConstants.d46.h,
                          width: DimensionConstants.d116.h,
                          fit: BoxFit.cover,
                          circleCrop: true,
                          color: ColorConstant.bggradientcolor1),
                      Positioned(
                        top: DimensionConstants.d75.h,
                        left: DimensionConstants.d79.w,
                        bottom: DimensionConstants.d2.h,
                        right: DimensionConstants.d2.w,
                        child: Container(
                          height: DimensionConstants.d39.h,
                          width: DimensionConstants.d39.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(colors: [
                                ColorConstant.buttongradientcolor1,
                                ColorConstant.buttongradientcolor2,
                              ])),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return CustomDialogBox(
                                        galleryTap: () async {
                                          Navigator.pop(context);
                                          final ImagePicker picker =
                                              ImagePicker();
                                          final XFile? photo =
                                              await picker.pickImage(
                                                  source: ImageSource.gallery);
                                          if (photo != null) {
                                            setState(() {
                                              _image = photo.path;
                                            });
                                          }
                                        },
                                        cameraTap: () async {
                                          Navigator.pop(context);
                                          final ImagePicker picker =
                                              ImagePicker();
                                          final XFile? photo =
                                              await picker.pickImage(
                                                  source: ImageSource.camera);
                                          if (photo != null) {
                                            setState(() {
                                              _image = photo.path;
                                            });
                                          }
                                        },
                                      );
                                    });
                              },
                              child: ImageView(
                                  path: ImageConstants.cameraIcon,
                                  height: DimensionConstants.d19.h,
                                  width: DimensionConstants.d20.w),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: DimensionConstants.d30.h,
                  ),
                  textFieldTitle(StringConstants.firstNamw),
                  SizedBox(
                    height: DimensionConstants.d10.h,
                  ),
                  CommonWidgets.gradientTextField(context,
                      controllerName: firstNameController,
                      textFieldHintText: StringConstants.mathew),
                  SizedBox(
                    height: DimensionConstants.d30.h,
                  ),
                  textFieldTitle(StringConstants.lastName),
                  SizedBox(
                    height: DimensionConstants.d10.h,
                  ),
                  CommonWidgets.gradientTextField(context,
                      controllerName: lastNameController,
                      textFieldHintText: StringConstants.lastName),
                  SizedBox(
                    height: DimensionConstants.d30.h,
                  ),
                  textFieldTitle(StringConstants.about),
                  SizedBox(
                    height: DimensionConstants.d10.h,
                  ),
                  CommonWidgets.gradientTextField(context,
                      controllerName: aboutController,
                      textFieldHintText: StringConstants.about),
                  SizedBox(
                    height: DimensionConstants.d30.h,
                  ),
                  textFieldTitle(StringConstants.birthday),
                  SizedBox(
                    height: DimensionConstants.d10.h,
                  ),
                  CommonWidgets.gradientTextField(
                    context,
                    controllerName: dobController,
                    textFieldHintText: StringConstants.birthday,
                    value: true,
                    onTap: () async {
                      DateTime? datepicker = await showDatePicker(
                          context: context,
                          builder: (context, child) {
                            return Theme(
                                data: Theme.of(context).copyWith(
                                    colorScheme: const ColorScheme.light(
                                  primary: ColorConstant.lightred,
                                )),
                                child: child!);
                          },
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1980),
                          lastDate: DateTime(2100));

                      if (datepicker != null) {
                        setState(() {
                          checkUserIs18(datepicker,dobController);
                          // dobController.text =
                          //     DateFormat('dd-MM-yyyy').format(datepicker);
                              
                        });
                      }
                      
                    },
                    suffixicon: const Padding(
                        padding: EdgeInsets.all(DimensionConstants.d13),
                        child: ImageView(
                          path: ImageConstants.calenderIcon,
                        )),
                  ),
                  SizedBox(
                    height: DimensionConstants.d30.h,
                  ),
                  textFieldTitle(StringConstants.horoscope),
                  SizedBox(
                    height: DimensionConstants.d10.h,
                  ),
                  CommonWidgets.gradientContainer(
                      text: horoscope ?? StringConstants.horoscope,
                      imagePath: ImageConstants.dropDownIcon,
                      ontap: () {
                        setState(() {
                          onclick = !onclick;
                        });
                      }),
                  SizedBox(
                    height: DimensionConstants.d8.h,
                  ),
                  onclick
                      ? ShowDropDownList(
                          listname: rashiName,
                          onTap: (String title) {
                            setData(title);
                            onclick = !onclick;
                          })
                      : const SizedBox(),
                  SizedBox(
                    height: DimensionConstants.d30.h,
                  ),
                  textFieldTitle(StringConstants.selectGender),
                  SizedBox(
                    height: DimensionConstants.d10.h,
                  ),
                  CommonWidgets.gradientContainer(
                      text: genderName ?? StringConstants.gender,
                      imagePath: ImageConstants.dropDownIcon,
                      ontap: () {
                        setState(() {
                          ontap = !ontap;
                        });
                      }),
                  SizedBox(
                    height: DimensionConstants.d8.h,
                  ),
                  ontap
                      ? ShowDropDownList(
                          listname: gendersName,
                          onTap: (String genderValue) {
                            setGender(genderValue);
                            ontap = !ontap;
                          },
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: DimensionConstants.d47.h,
                  ),
                  GestureDetector(
                      onTap: () {
                        CommonWidgets.profileScreenValidation(context,
                            imagePath: _image,
                            firstNameController: firstNameController,
                            lastNameController: lastNameController,
                            aboutNameController: aboutController,
                            dobNameController: dobController,
                            horoscopeValue: horoscope,
                            genderValue: genderName);
                      },
                      child: CommonWidgets.commonButton(
                          StringConstants.continueText)),
                  SizedBox(
                    height: DimensionConstants.d56.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

// for horoscope selection
  String? horoscope;
  void setData(String name) {
    setState(() {
      horoscope = name;
    });
  }

  // for genderselection
  String? genderName;
  void setGender(String name) {
    setState(() {
      genderName = name;
    });
  }

  Widget textFieldTitle(String? titlevalue) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(titlevalue!).regularText(ColorConstant.headingcolor,
          TextAlign.center, DimensionConstants.d14.sp),
    );
  }

  void checkUserIs18(DateTime? dobvalue,TextEditingController? dob) {
    DateTime todaydate = DateTime.now();
    int age = todaydate.year - dobvalue!.year;
    if (age < 18) {
      CommonWidgets.showflushbar(context, StringConstants.dobErorrMessage);
    }
    else{
      dob!.text= DateFormat('dd-MM-yyyy').format(dobvalue);
    }
  }
}
