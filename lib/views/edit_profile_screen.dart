import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/helper/dialog_helper.dart';
import 'package:demoapp/helper/stop_scroll.dart';
import 'package:demoapp/widgets/custom_dialogbox.dart';
import 'package:demoapp/widgets/dropdownlist.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool hideAge = false;
  bool hideDistance = false;
  bool hidePhNumber = false;
  String? userdob;
  List<String> imagePaths = [];
  List<String> horoscopeList = [
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

  List<String> genderCatagory = [
    StringConstants.female,
    StringConstants.male,
    StringConstants.transGenderFemale,
    StringConstants.transGenderMale,
    StringConstants.transGender
  ];

  bool onClick = false;
  bool onTap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(
            top: DimensionConstants.d43.h,
            left: DimensionConstants.d21.w,
            right: DimensionConstants.d12.w),
        child: Column(
          children: [
            // App Bar
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const ImageView(
                    path: ImageConstants.leftArrowIcon,
                  ),
                ),
                SizedBox(
                  width: DimensionConstants.d98.w,
                ),
                GradientText(
                  StringConstants.editProfile,
                  colors: const [
                    ColorConstant.inboxScreenGradientColor,
                    ColorConstant.dashboardGradientColor1
                  ],
                  style: TextStyle(
                      fontFamily: StringConstants.familyName,
                      fontWeight: FontWeight.w500,
                      fontSize: DimensionConstants.d24.sp),
                ),
                SizedBox(
                  width: DimensionConstants.d78.w,
                ),
               GestureDetector(
                onTap: () => Navigator.pop(context),
                child:  const Text(StringConstants.done).regularText(
                    ColorConstant.inboxScreenGradientColor,
                    TextAlign.center,
                    DimensionConstants.d18.sp),
               )
              ],
            ),

            SizedBox(
              height: DimensionConstants.d10.h,
            ),
            // user pictures
            Expanded(
              child: ScrollConfiguration(
                behavior: NoGlowScrollBehavior(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: DimensionConstants.d230.h,
                        width: DimensionConstants.d414.w,
                        child: ScrollConfiguration(
                          behavior: NoGlowScrollBehavior(),
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: DimensionConstants.d20.h,
                                      mainAxisExtent: DimensionConstants.d145.h,
                                      crossAxisSpacing: DimensionConstants.d11.w),
                              itemCount: imagePaths.length + 1,
                              itemBuilder: (context, index) {
                                return index == imagePaths.length
                                    ? addImageButton()
                                    : imageContainer(imagePaths[index], index);
                              }),
                        ),
                      ),
                      SizedBox(
                        height: DimensionConstants.d30.h,
                      ),
                      // user location
                      userLocation(),
                      SizedBox(
                        height: DimensionConstants.d30.h,
                      ),
                      // user birthday
                      userBirthday(userdob ?? StringConstants.dateFormat),
                      SizedBox(
                        height: DimensionConstants.d7.h,
                      ),
                      Container(
                        height: DimensionConstants.d1.h,
                        width: DimensionConstants.d374.w,
                        color: ColorConstant.editScreenTextColor,
                      ),
                      SizedBox(
                        height: DimensionConstants.d6.h,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: const Text(StringConstants.yourAgeWillBePublic)
                            .regularText(ColorConstant.editScreenTextColor,
                                TextAlign.center, DimensionConstants.d16.sp),
                      ),
                      SizedBox(
                        height: DimensionConstants.d30.h,
                      ),
                      // horoscope lists
                      CommonWidgets.gradientContainer(
                          text: horoscopeSelectedvalue ??
                              StringConstants.zodiacSign,
                          imagePath: ImageConstants.editProfileScreenDropdownIcon,
                          height: DimensionConstants.d51.h,
                          innerContainerHeight: DimensionConstants.d46.h,
                          textcolor: ColorConstant.black,
                          fontweight: FontWeight.w700,
                          paddingFromTop: DimensionConstants.d5.h,
                          paddingFromBottom: DimensionConstants.d0.h,
                          ontap: () {
                            setState(() {
                              onClick = !onClick;
                            });
                          }),
                      SizedBox(
                        height: DimensionConstants.d10.h,
                      ),
                      // dropdown List
                      onClick
                          ? ShowDropDownList(
                              listname: horoscopeList,
                              onTap: (title) {
                                setState(() {
                                  selectValue(title);
                                  onClick = !onClick;
                                });
                              },
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: DimensionConstants.d30.h,
                      ),
                      // user about
                      userAbout(),
                      SizedBox(
                        height: DimensionConstants.d31.h,
                      ),
                      // user interests
                      Align(
                        alignment: Alignment.topLeft,
                        child: const Text(StringConstants.interests).bold(
                            ColorConstant.black,
                            TextAlign.center,
                            DimensionConstants.d16.sp),
                      ),
              
                      SizedBox(
                        height: DimensionConstants.d12.h,
                      ),
                      SizedBox(
                        height: DimensionConstants.d100.h,
                        width: DimensionConstants.d373.w,
                        child: ScrollConfiguration(
                          behavior: NoGlowScrollBehavior(),
                          child: GridView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: 4,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: DimensionConstants.d3,
                                      mainAxisSpacing: DimensionConstants.d8,
                                      crossAxisSpacing: DimensionConstants.d15,
                                      crossAxisCount: 3),
                              itemBuilder: ((context, index) {
                                return userInterestsContainer(
                                    containerchildText:
                                        StringConstants.trackkingText);
                              })),
                        ),
                      ),
                      SizedBox(
                        height: DimensionConstants.d30.h,
                      ),
                      CommonWidgets.gradientContainer(
                          text:
                              selectedGenderValue ?? StringConstants.selectGender,
                          imagePath: ImageConstants.dropDownIcon,
                          ontap: () {
                            setState(() {
                              onTap = !onTap;
                            });
                          }),
                      SizedBox(
                        height: DimensionConstants.d10.h,
                      ),
                      onTap
                          ? ShowDropDownList(
                              listname: genderCatagory,
                              onTap: (title) {
                                selectGender(title);
                                onTap = !onTap;
                              },
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: DimensionConstants.d30.h,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: const Text(StringConstants.manageprofile).semiBold(
                            ColorConstant.black,
                            TextAlign.start,
                            DimensionConstants.d20.sp),
                      ),
                      SizedBox(
                        height: DimensionConstants.d30.h,
                      ),
                      // user privacy
                      userPrivacy(),
              
                      // logout and delete Account Button
                      GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return DialogHelper(
                                    titleValue:
                                        StringConstants.logoutDialogBoxText,
                                    titleColor: ColorConstant.black,
                                    titleValueFontWeight: FontWeight.w600,
                                    titleValueFontSize: DimensionConstants.d24.sp,
                                    sizedboxheight: DimensionConstants.d18.h,
                                    positiveTapContentValue:
                                        StringConstants.logoutDialogBoxText,
                                    positiveTapcontentValueColor:
                                        ColorConstant.inboxScreenGradientColor,
                                    contentValue:
                                        StringConstants.wantToLogoutText,
                                    contentValueFontSize:
                                        DimensionConstants.d15.sp,
                                    negativeTap: () {
                                      setState(() {
                                        Navigator.pop(context);
                                      });
                                    },
                                  );
                                });
                          },
                          child: button(
                              StringConstants.logout, ColorConstant.black)),
                      SizedBox(
                        height: DimensionConstants.d20.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return DialogHelper(
                                  titleValue:
                                      StringConstants.deleteAccountDialogBoxText,
                                  titleColor: ColorConstant.colorF11010,
                                  titleValueFontWeight: FontWeight.w400,
                                  titleValueFontSize: DimensionConstants.d24.sp,
                                  sizedboxheight: DimensionConstants.d18.h,
                                  positiveTapContentValue: StringConstants.delete,
                                  positiveTapcontentValueColor:
                                      ColorConstant.colorF11010,
                                  contentValue:
                                      StringConstants.wantToDeleteAccountText,
                                  contentValueFontSize: DimensionConstants.d14.sp,
                                  paddingFromTop: DimensionConstants.d8.h,
                                  negativeTap: () {
                                    setState(() {
                                      Navigator.pop(context);
                                    });
                                  },
                                );
                              });
                        },
                        child: button(StringConstants.deleteAccount,
                            ColorConstant.inboxScreenGradientColor),
                      ),
              
                      SizedBox(
                        height: DimensionConstants.d48.h,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // horoscope list function
  String? horoscopeSelectedvalue;
  void selectValue(String? title) {
    setState(() {
      horoscopeSelectedvalue = title;
    });
  }

  // for select gender
  String? selectedGenderValue;
  void selectGender(String? pickedGender) {
    setState(() {
      selectedGenderValue = pickedGender;
    });
  }

// Add images on Tap Of Add Icon
  Widget addImageButton() {
    return Container(
      height: DimensionConstants.d139.h,
      width: DimensionConstants.d111.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DimensionConstants.d15.r),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorConstant.dialogboxgradientcolor4,
                ColorConstant.dialogboxgradientcolor3,
              ])),
      child: Container(
        height: DimensionConstants.d42.h,
        width: DimensionConstants.d42.w,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: ColorConstant.buttonbgcolor,
          shape: BoxShape.circle,
        ),
        child: Center(
            child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CustomDialogBox(
                          galleryTap: () async {
                            Navigator.pop(context);
                            final ImagePicker picker = ImagePicker();
                            final XFile? photo = await picker.pickImage(
                                source: ImageSource.gallery);
                            if (photo != null) {
                              setState(() {
                                imagePaths.add(photo.path);
                              });
                            }
                          },
                          cameraTap: () async {
                            Navigator.pop(context);
                            final ImagePicker picker = ImagePicker();
                            final XFile? photo = await picker.pickImage(
                                source: ImageSource.camera);
                            if (photo != null) {
                              setState(() {
                                imagePaths.add(photo.path);
                              });
                            }
                          },
                        );
                      });
                },
                child: const ImageView(
                  path: ImageConstants.addIcon,
                ))),
      ),
    );
  }

  // Image Container
  Widget imageContainer(String imagePath, int index) {
    return Container(
      height: DimensionConstants.d130.h,
      width: DimensionConstants.d111.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DimensionConstants.d50.r)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(DimensionConstants.d14.r),
            child: ImageView(
              path: imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: DimensionConstants.d0.h,
            right: DimensionConstants.d4.w,
            child: Container(
              height: DimensionConstants.d20.h,
              width: DimensionConstants.d23.w,
              decoration: const BoxDecoration(
                  color: ColorConstant.lightpink, shape: BoxShape.circle),
              child: Center(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          imagePaths.removeAt(index);
                        });
                      },
                      child: const ImageView(
                        path: ImageConstants.crossIcon,
                      ))),
            ),
          ),
        ],
      ),
    );
  }

  // user location Container
  Widget userLocation() {
    return SizedBox(
      height: DimensionConstants.d60.h,
      width: DimensionConstants.d372.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(StringConstants.location).bold(ColorConstant.black,
                  TextAlign.center, DimensionConstants.d16.sp),
              SizedBox(
                height: DimensionConstants.d10.h,
              ),
              const Text(StringConstants.jessicaLoaction).regularText(
                  ColorConstant.editScreenTextColor,
                  TextAlign.center,
                  DimensionConstants.d16.sp),
            ],
          ),
          const ImageView(
            path: ImageConstants.editProfileScreenLocationIcon,
          )
        ],
      ),
    );
  }

  // user Birthday Container
  Widget userBirthday(String? userBirthDate) {
    return SizedBox(
      height: DimensionConstants.d60.h,
      width: DimensionConstants.d372.w,
      child: GestureDetector(
        onTap: () async {
          DateTime? datepicker = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2050));
          if (datepicker != null) {
            setState(() {
              userdob = DateFormat('dd-MM-yyyy').format(datepicker);
            });
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(StringConstants.myBirthdayIs).bold(
                    ColorConstant.black,
                    TextAlign.center,
                    DimensionConstants.d16.sp),
                SizedBox(
                  height: DimensionConstants.d10.h,
                ),
                Text(userBirthDate!).regularText(
                    ColorConstant.editScreenTextColor,
                    TextAlign.center,
                    DimensionConstants.d16.sp),
              ],
            ),
            const ImageView(
              path: ImageConstants.calenderIcon,
            )
          ],
        ),
      ),
    );
  }

  // user About
  Widget userAbout() {
    return SizedBox(
      height: DimensionConstants.d102.h,
      width: DimensionConstants.d373.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(StringConstants.about).bold(
              ColorConstant.black, TextAlign.center, DimensionConstants.d16.sp),
          SizedBox(
            height: DimensionConstants.d12.h,
          ),
          const Text(StringConstants.jessicaDescription).regularText(
              ColorConstant.editScreenTextColor,
              TextAlign.start,
              DimensionConstants.d16.sp,
              maxLines: 3)
        ],
      ),
    );
  }

  // user Interests
  Widget userInterestsContainer({String? containerchildText}) {
    return Container(
      height: DimensionConstants.d32.h,
      width: DimensionConstants.d118.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DimensionConstants.d7.r),
          color: ColorConstant.inboxScreenGradientColor),
      child: Container(
        height: DimensionConstants.d36.h,
        width: DimensionConstants.d111.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(DimensionConstants.d5.r),
            color: ColorConstant.textcolor),
        child: Text(containerchildText!).regularText(
            ColorConstant.red, TextAlign.center, DimensionConstants.d16.sp),
      ),
    );
  }

  Widget userPrivacy() {
    return SizedBox(
      height: DimensionConstants.d150.h,
      width: DimensionConstants.d373.w,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(StringConstants.hideAge).regularText(
                  ColorConstant.black,
                  TextAlign.center,
                  DimensionConstants.d16.sp),
              Transform.scale(
                scale: DimensionConstants.d1,
                child: SizedBox(
                  width: DimensionConstants.d90.w,
                  height: DimensionConstants.d30.h,
                  child: CupertinoSwitch(
                      trackColor: ColorConstant.editScreenSwitchButtonColor,
                      activeColor: ColorConstant.inboxScreenGradientColor
                          .withOpacity(0.3),
                      thumbColor: ColorConstant.inboxScreenGradientColor,
                      value: hideAge,
                      onChanged: (value) {
                        setState(() {
                          hideAge = value;
                        });
                      }),
                ),
              )
            ],
          ),
          SizedBox(
            height: DimensionConstants.d10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(StringConstants.hideDistance).regularText(
                  ColorConstant.black,
                  TextAlign.center,
                  DimensionConstants.d16.sp),
              Transform.scale(
                scale: DimensionConstants.d1,
                child: SizedBox(
                  width: DimensionConstants.d90.w,
                  height: DimensionConstants.d30.h,
                  child: CupertinoSwitch(
                      trackColor: ColorConstant.editScreenSwitchButtonColor,
                      activeColor: ColorConstant.inboxScreenGradientColor
                          .withOpacity(0.3),
                      thumbColor: ColorConstant.inboxScreenGradientColor,
                      value: hideDistance,
                      onChanged: (value) {
                        setState(() {
                          hideDistance = value;
                        });
                      }),
                ),
              )
            ],
          ),
          SizedBox(
            height: DimensionConstants.d10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(StringConstants.hidePhoneNumber).regularText(
                  ColorConstant.black,
                  TextAlign.center,
                  DimensionConstants.d16.sp),
              Transform.scale(
                scale: DimensionConstants.d1,
                child: SizedBox(
                  width: DimensionConstants.d90.w,
                  height: DimensionConstants.d30.h,
                  child: CupertinoSwitch(
                      trackColor: ColorConstant.editScreenSwitchButtonColor,
                      activeColor: ColorConstant.inboxScreenGradientColor
                          .withOpacity(0.3),
                      thumbColor: ColorConstant.inboxScreenGradientColor,
                      value: hidePhNumber,
                      onChanged: (value) {
                        setState(() {
                          hidePhNumber = value;
                        });
                      }),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget button(String? buttonTextValue, Color? buttontextcolor) {
    return Container(
      height: DimensionConstants.d50.h,
      width: DimensionConstants.d374.w,
      decoration: BoxDecoration(
        color: ColorConstant.editScreenButtonColor,
        borderRadius: BorderRadius.circular(DimensionConstants.d7.r),
      ),
      child: Center(
        child: Text(buttonTextValue!).regularText(
            buttontextcolor!, TextAlign.center, DimensionConstants.d16.sp),
      ),
    );
  } 

  
}
