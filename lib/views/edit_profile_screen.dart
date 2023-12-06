import 'package:demoapp/api_modals/update_user_interests.dart';
import 'package:demoapp/api_modals/update_user_location.dart';
import 'package:demoapp/constants/api_constants.dart';
import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/sharedperferences_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/helper/dialog_helper.dart';
import 'package:demoapp/helper/stop_scroll.dart';
import 'package:demoapp/providers/getting_user_details.dart';
import 'package:demoapp/views/base_view.dart';
import 'package:demoapp/views/interest_screen.dart';
import 'package:demoapp/widgets/custom_dialogbox.dart';
import 'package:demoapp/widgets/dropdownlist.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool hideAge = false;
  bool seeMore = false;
  bool hideDistance = false;
  bool hidePhNumber = false;

  // final userDOBController = TextEditingController();
  // final userDOB = TextEditingController();
  // final useraboutController = TextEditingController();
  // int countApiHittime = 0;
  // bool isnavigateInterestScreeen = false;
  // Position? exactLoaction;

  // String? userdob;
  // String? currentLocation;
  // String? userUpdatedDOB;
  // String userabout = '';
  // String? updateduserabout;
  // double? longitude;
  // double? latitude;
  // String userCurrentLocation = "";
  // String userbirthdate = "";
  // String userhoroscope = "";
  // String userGender = "";
  // String? hereTo;
  // String? wantToMeet;
  // String? prefferedAge;
  // String? prefferedlanguage;
  String? uploadimagepath;
  // List<String> userInterest = [];
  // //int? dob;
  // List<String> imagePaths = [];
  // List<String> userUpdatedImages = [];
  // List<String> imagepathsofuseraddedpics = [];
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

  bool onClick = false;
  bool onTap = false;
  bool ontap = false;
  bool newFriends = false;
  bool ageRange = false;
  bool language = false;
  UpdateUserInterest? modal3;
  UpdateUserLocation? modal4;

  // Future<void> updateUserInterest() async {
  //   modal3 = await Api.updateUserInterests(
  //       userinterests: widget.updateduserInterest);

  //   hitUserById();
  // }

  // @override
  // void initState() {
  //   userInterest.add(StringConstants.add);
  //   gettingdetails();
  //   super.initState();
  // }

  // GetUserDetails? modal;
  // UpdateUserSingleImage? modal2;
  // String? jwttoken;

  // Future<void> updateuserpic({String? imageurl}) async {
  //   modal2 = await Api.updateUserImages(userimages: imageurl);
  //   // imagePaths.clear();
  //   // imagePaths.add(modal2!.image);

  //   gettingdetails();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BaseView<GettingUserDetailsProvider>(
        onModelReady: (provider) {
          provider.userInterest.add(StringConstants.add);
          provider.hitgettinguserDetailApi(context);
        },
        builder: (context, provider, child) {
          return Scaffold(
            body: provider.modal == null
                ? CommonWidgets.showProgressbar()
                : Container(
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.only(
                        top: DimensionConstants.d43.h,
                        left: DimensionConstants.d21.w,
                        right: DimensionConstants.d12.w),
                    child: ScrollConfiguration(
                      behavior: NoGlowScrollBehavior(),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // App Bar
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await provider.hituserUpdateProfileApi(
                                        context,
                                        horoscopeSelectedvalue:
                                            horoscopeSelectedvalue,
                                        selectedFriendshipInterest:
                                            selectedFriendshipInterest,
                                        selectedAge: selectedAge,
                                        selectedGenderValue:
                                            selectedGenderValue,
                                        selectedLanguage: selectedLanguage,
                                        genderValue: genderValue);

                                    if (mounted) {
                                      Navigator.pop(context, true);
                                    }
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
                                  onTap: () async {
                                    await provider.hituserUpdateProfileApi(
                                        context,
                                        horoscopeSelectedvalue:
                                            horoscopeSelectedvalue,
                                        selectedFriendshipInterest:
                                            selectedFriendshipInterest,
                                        selectedAge: selectedAge,
                                        selectedGenderValue:
                                            selectedGenderValue,
                                        selectedLanguage: selectedLanguage,
                                        genderValue: genderValue);

                                    if (mounted) {
                                      Navigator.pop(context, true);
                                    }
                                  },
                                  child: const Text(StringConstants.done)
                                      .regularText(
                                          ColorConstant
                                              .inboxScreenGradientColor,
                                          TextAlign.center,
                                          DimensionConstants.d18.sp),
                                )
                              ],
                            ),

                            SizedBox(
                              height: DimensionConstants.d10.h,
                            ),
                            // user pictures
                            ScrollConfiguration(
                              behavior: NoGlowScrollBehavior(),
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisSpacing:
                                              DimensionConstants.d20.h,
                                          mainAxisExtent:
                                              DimensionConstants.d145.h,
                                          crossAxisSpacing:
                                              DimensionConstants.d11.w),
                                  itemCount: provider.imagePaths.length + 1,
                                  itemBuilder: (context, index) {
                                    return index == provider.imagePaths.length
                                        ? addImageButton(provider)
                                        : imageContainer(
                                            ApiUrls.baseUrl +
                                                provider.imagePaths[index],
                                            index,
                                            provider);
                                  }),
                            ),
                            SizedBox(
                              height: DimensionConstants.d30.h,
                            ),
                            // user location
                            userLocation(provider),
                            SizedBox(
                              height: DimensionConstants.d30.h,
                            ),
                            // user birthday
                            userBirthday(provider),
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

                            SizedBox(
                              height: DimensionConstants.d30.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(StringConstants.zodiacSign).bold(
                                    ColorConstant.black,
                                    TextAlign.center,
                                    DimensionConstants.d16.sp),
                                SizedBox(
                                  height: DimensionConstants.d12.h,
                                ),
                                // horoscope lists
                                CommonWidgets.gradientContainer(
                                    text: horoscopeSelectedvalue ??
                                        provider.userhoroscope,
                                    imagePath: ImageConstants
                                        .editProfileScreenDropdownIcon,
                                    height: DimensionConstants.d70.h,
                                    innerContainerHeight:
                                        DimensionConstants.d65.h,
                                    textcolor: ColorConstant.headingcolor,
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
                              ],
                            ),
                            SizedBox(
                              height: DimensionConstants.d30.h,
                            ),
                            // user about
                            userAbout(provider),
                            SizedBox(
                              height: DimensionConstants.d10.h,
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
                            ScrollConfiguration(
                              behavior: NoGlowScrollBehavior(),
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemCount: provider.userInterest.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio:
                                              DimensionConstants.d3,
                                          mainAxisSpacing:
                                              DimensionConstants.d8,
                                          crossAxisSpacing:
                                              DimensionConstants.d15,
                                          crossAxisCount: 3),
                                  itemBuilder: ((context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        if (provider.userInterest.length ==
                                            index + 1) {
                                          Navigator.pushNamed(context,
                                              RouteConstants.interestScreen,
                                              arguments: InterestScreen(
                                                isfromeditprofileScreen: true,
                                                userinterests:
                                                    provider.userInterest,
                                              )).then((value) {
                                            if (value == true) {
                                              provider.hitgettinguserDetailApi(
                                                  context);
                                            }
                                          });
                                        }
                                      },
                                      child: userInterestsContainer(
                                          containerchildText:
                                              provider.userInterest[index]),
                                    );
                                  })),
                            ),
                            SizedBox(
                              height: DimensionConstants.d30.h,
                            ),
                            // select gender
                            Align(
                              alignment: Alignment.topLeft,
                              child: const Text(StringConstants.selectGender)
                                  .bold(ColorConstant.black, TextAlign.center,
                                      DimensionConstants.d16.sp),
                            ),

                            SizedBox(
                              height: DimensionConstants.d12.h,
                            ),
                            CommonWidgets.gradientContainer(
                                text:
                                    selectedGenderValue ?? provider.userGender,
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

                            // here to
                            SizedBox(
                              height: DimensionConstants.d20.h,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: const Text(StringConstants.hereto)
                                  .regularText(
                                      ColorConstant.headingcolor,
                                      TextAlign.center,
                                      DimensionConstants.d16.sp),
                            ),
                            SizedBox(
                              height: DimensionConstants.d10.h,
                            ),
                            // here to textfield
                            CommonWidgets.gradientContainer(
                                text: selectedFriendshipInterest ??
                                    provider.hereTo,
                                imagePath:
                                    ImageConstants.dropDownIconFilterScreen,
                                ontap: () {
                                  setState(() {
                                    newFriends = !newFriends;
                                  });
                                }),
                            SizedBox(
                              height: DimensionConstants.d8.h,
                            ),
                            // here to dropdownlist
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
                            // want to meet text
                            Align(
                              alignment: Alignment.topLeft,
                              child: const Text(StringConstants.wantToMeet)
                                  .regularText(
                                      ColorConstant.headingcolor,
                                      TextAlign.center,
                                      DimensionConstants.d16.sp),
                            ),
                            SizedBox(
                              height: DimensionConstants.d10.h,
                            ),
                            // want to meet textfield
                            CommonWidgets.gradientContainer(
                                text: genderValue ??
                                    provider.wantToMeet.toString(),
                                imagePath:
                                    ImageConstants.dropDownIconFilterScreen,
                                ontap: () {
                                  setState(() {
                                    ontap = !ontap;
                                  });
                                }),
                            SizedBox(
                              height: DimensionConstants.d8.h,
                            ),
                            // want to meet dropdownlist

                            ontap
                                ? ShowDropDownList(
                                    listname: genderCatagory,
                                    onTap: (String title) {
                                      setData(title);
                                      ontap = !ontap;
                                    },
                                  )
                                : const SizedBox(),
                            SizedBox(
                              height: DimensionConstants.d30.h,
                            ),
                            // preffered Age Range text
                            Align(
                              alignment: Alignment.topLeft,
                              child: const Text(StringConstants.ageRange)
                                  .regularText(
                                      ColorConstant.headingcolor,
                                      TextAlign.center,
                                      DimensionConstants.d16.sp),
                            ),
                            SizedBox(
                              height: DimensionConstants.d10.h,
                            ),
                            // preffered Age Range textfield
                            CommonWidgets.gradientContainer(
                                text: selectedAge ??
                                    provider.prefferedAge.toString(),
                                imagePath:
                                    ImageConstants.dropDownIconFilterScreen,
                                ontap: () {
                                  setState(() {
                                    ageRange = !ageRange;
                                  });
                                }),
                            SizedBox(
                              height: DimensionConstants.d8.h,
                            ),
                            // preffered Age Range dropdownlist
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
                            // preffered Language text
                            Align(
                              alignment: Alignment.topLeft,
                              child: const Text(StringConstants.preferrLanguage)
                                  .regularText(
                                      ColorConstant.headingcolor,
                                      TextAlign.center,
                                      DimensionConstants.d16.sp),
                            ),
                            SizedBox(
                              height: DimensionConstants.d10.h,
                            ),
                            // preffered Language textfield
                            CommonWidgets.gradientContainer(
                                text: selectedLanguage ??
                                    provider.prefferedlanguage.toString(),
                                imagePath:
                                    ImageConstants.dropDownIconFilterScreen,
                                ontap: () {
                                  setState(() {
                                    language = !language;
                                  });
                                }),
                            SizedBox(
                              height: DimensionConstants.d8.h,
                            ),
                            // preffered Language dropdownlist
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

                            // Manage your profile text
                            Align(
                              alignment: Alignment.topLeft,
                              child: const Text(StringConstants.manageprofile)
                                  .semiBold(
                                      ColorConstant.black,
                                      TextAlign.start,
                                      DimensionConstants.d20.sp),
                            ),
                            SizedBox(
                              height: DimensionConstants.d20.h,
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
                                          titleValue: StringConstants
                                              .logoutDialogBoxText,
                                          titleColor: ColorConstant.black,
                                          titleValueFontWeight: FontWeight.w600,
                                          titleValueFontSize:
                                              DimensionConstants.d24.sp,
                                          sizedboxheight:
                                              DimensionConstants.d18.h,
                                          positiveTapContentValue:
                                              StringConstants
                                                  .logoutDialogBoxText,
                                          positiveTapcontentValueColor:
                                              ColorConstant
                                                  .inboxScreenGradientColor,
                                          contentValue:
                                              StringConstants.wantToLogoutText,
                                          contentValueFontSize:
                                              DimensionConstants.d15.sp,
                                          // paddingFromTop: DimensionConstants.d5.h ,
                                          negativeTap: () {
                                            setState(() {
                                              Navigator.pop(context);
                                            });
                                          },
                                          positiveTap: () {
                                            
                                              SharedpreferenceKeys.prefs!
                                                  .clear();
                                              SharedpreferenceKeys.prefs!
                                                  .setBool(
                                                      SharedpreferenceKeys
                                                          .islogin,
                                                      false);
                                              Navigator.pushNamedAndRemoveUntil(
                                                  context,
                                                  RouteConstants.loginScreen,
                                                  (route) => false);
                                            
                                          },
                                        );
                                      });
                                },
                                child: button(StringConstants.logout,
                                    ColorConstant.black)),
                            SizedBox(
                              height: DimensionConstants.d25.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return DialogHelper(
                                        titleValue: StringConstants
                                            .deleteAccountDialogBoxText,
                                        titleColor: ColorConstant.colorF11010,
                                        titleValueFontWeight: FontWeight.w400,
                                        titleValueFontSize:
                                            DimensionConstants.d24.sp,
                                        sizedboxheight:
                                            DimensionConstants.d18.h,
                                        positiveTapContentValue:
                                            StringConstants.delete,
                                        positiveTapcontentValueColor:
                                            ColorConstant.colorF11010,
                                        contentValue: StringConstants
                                            .wantToDeleteAccountText,
                                        contentValueFontSize:
                                            DimensionConstants.d14.sp,
                                        paddingFromTop: DimensionConstants.d8.h,
                                        negativeTap: () {
                                          setState(() {
                                            Navigator.pop(context);
                                          });
                                        },
                                        positiveTap: () {
                                          provider.deleteAccount(context);
                                        },
                                      );
                                    });
                              },
                              child: button(StringConstants.deleteAccount,
                                  ColorConstant.inboxScreenGradientColor),
                            ),

                            SizedBox(
                              height: DimensionConstants.d48.h,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        },
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

  String? genderValue;
  void setData(String name) {
    setState(() {
      genderValue = name;
    });
  }

// Add images on Tap Of Add Icon
  Widget addImageButton(GettingUserDetailsProvider provider) {
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
                                uploadimagepath = photo.path;
                              });
                              if (mounted) {
                                provider.updateuserpic(context,
                                    imageurl: uploadimagepath);
                              }
                            }
                          },
                          cameraTap: () async {
                            Navigator.pop(context);
                            final ImagePicker picker = ImagePicker();
                            final XFile? photo = await picker.pickImage(
                                source: ImageSource.camera);
                            if (photo != null) {
                              setState(() {
                                uploadimagepath = photo.path;

                                // imagePaths.add(photo.path);
                              });
                              if (mounted) {
                                provider.updateuserpic(context,
                                    imageurl: uploadimagepath);
                              }
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
  Widget imageContainer(
      String imagePath, int index, GettingUserDetailsProvider provider) {
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
              height: DimensionConstants.d150.h,
              width: DimensionConstants.d111.w,
            ),
          ),
          Positioned(
            bottom: DimensionConstants.d0.h,
            right: DimensionConstants.d0.w,
            child: Container(
              height: DimensionConstants.d40.h,
              width: DimensionConstants.d25.w,
              decoration: const BoxDecoration(
                  color: ColorConstant.lightpink, shape: BoxShape.circle),
              child: Center(
                  child: GestureDetector(
                      onTap: () {
                        provider.imagePaths.removeAt(index);
                        provider.hituserUpdateProfileApi(context);
                      },
                      child: ImageView(
                        path: ImageConstants.crossIcon,
                        height: DimensionConstants.d20.h,
                        width: DimensionConstants.d20.w,
                      ))),
            ),
          ),
        ],
      ),
    );
  }

  // user location Container
  Widget userLocation(GettingUserDetailsProvider provider) {
    return GestureDetector(
      onTap: () {
        provider.hitupdateuserlocationApi(context);
      },
      child: SizedBox(
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
                Text(provider.userCurrentLocation).regularText(
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
      ),
    );
  }

  // user Birthday Container
  Widget userBirthday(GettingUserDetailsProvider provider) {
    return SizedBox(
      height: DimensionConstants.d61.h,
      width: DimensionConstants.d414.w,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(StringConstants.birthday).bold(ColorConstant.black,
                    TextAlign.center, DimensionConstants.d16.sp),
                SizedBox(
                  height: DimensionConstants.d10.h,
                ),
                SizedBox(
                  height: DimensionConstants.d27.h,
                  width: DimensionConstants.d380.w,
                  child: Center(
                    child: TextField(
                      showCursor: false,
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
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050));
                        if (datepicker != null) {
                          if (mounted) {
                            provider.checkUserIs18(datepicker,
                                provider.userDOBController, context);
                          }
                        }
                      },
                      style: TextStyle(
                          color: ColorConstant.editScreenTextColor,
                          fontSize: DimensionConstants.d16.sp,
                          fontFamily: StringConstants.familyName,
                          fontWeight: FontWeight.w400),
                      controller: provider.userDOBController,
                      decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: DimensionConstants.d0.h,
                                bottom: DimensionConstants.d6),
                            child: const ImageView(
                              path: ImageConstants.calenderIcon,
                            ),
                          ),
                          hintText: provider.userBirthdate,
                          hintStyle: TextStyle(
                              color: ColorConstant.editScreenTextColor,
                              fontSize: DimensionConstants.d16.sp,
                              fontFamily: StringConstants.familyName,
                              fontWeight: FontWeight.w400),
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // user About
  Widget userAbout(GettingUserDetailsProvider provider) {
    return SizedBox(
      // height: DimensionConstants.d102.h,
      width: DimensionConstants.d373.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(StringConstants.about).bold(ColorConstant.black,
                  TextAlign.center, DimensionConstants.d16.sp),
              const Text(StringConstants.wordLimit).semiBold(
                ColorConstant.editScreenTextColor,
                TextAlign.center,
                DimensionConstants.d12.sp,
              ),
            ],
          ),
          // SizedBox(
          //   height: DimensionConstants.d12.h,
          // ),
          IntrinsicHeight(
            child: TextField(
              maxLines: null,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: ColorConstant.editScreenTextColor,
                fontSize: DimensionConstants.d16.sp,
                fontFamily: StringConstants.familyName,
                fontWeight: FontWeight.w400,
              ),
              controller: provider.useraboutController,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  hintText: provider.userAbout,
                  hintStyle: TextStyle(
                      color: ColorConstant.editScreenTextColor,
                      fontSize: DimensionConstants.d16.sp,
                      fontFamily: StringConstants.familyName,
                      fontWeight: FontWeight.w400),
                  border: InputBorder.none),
            ),
          ),
          // Text(userabout).regularText(ColorConstant.editScreenTextColor,
          //     TextAlign.start, DimensionConstants.d16.sp,
          //     maxLines: 3)
        ],
      ),
    );
  }

  // user Interests
  Widget userInterestsContainer({String? containerchildText}) {
    return Container(
      height: DimensionConstants.d38.h,
      width: DimensionConstants.d118.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DimensionConstants.d7.r),
          color: ColorConstant.inboxScreenGradientColor),
      child: Container(
        height: DimensionConstants.d37.h,
        width: DimensionConstants.d112.w,
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
      height: DimensionConstants.d120.h,
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

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     const Text(StringConstants.hidePhoneNumber).regularText(
          //         ColorConstant.black,
          //         TextAlign.center,
          //         DimensionConstants.d16.sp),
          //     Transform.scale(
          //       scale: DimensionConstants.d1,
          //       child: SizedBox(
          //         width: DimensionConstants.d90.w,
          //         height: DimensionConstants.d30.h,
          //         child: CupertinoSwitch(
          //             trackColor: ColorConstant.editScreenSwitchButtonColor,
          //             activeColor: ColorConstant.inboxScreenGradientColor
          //                 .withOpacity(0.3),
          //             thumbColor: ColorConstant.inboxScreenGradientColor,
          //             value: hidePhNumber,
          //             onChanged: (value) {
          //               setState(() {
          //                 hidePhNumber = value;
          //               });
          //             }),
          //       ),
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget button(String? buttonTextValue, Color? buttontextcolor) {
    return Card(
      elevation: DimensionConstants.d3,
      child: Container(
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
      ),
    );
  }

  // getting user details
  // Future<void> hitUserById() async {
  //   SharedPreferences getToken = await SharedPreferences.getInstance();
  //   try {
  //     modal = await Api.userById(
  //         jwtToken: getToken.getString(SharedpreferenceKeys.jwtToken));

  //     if (modal!.success == true) {
  //       // user bitrthdate
  //       userdob = modal!.data![0].birthDate.isNotEmpty
  //           ? DateFormat('dd-MM-yyyy')
  //               .format(DateTime.parse(modal!.data![0].birthDate))
  //           : "";
  //       // user About
  //       userabout = modal!.data![0].about;
  //       // user interests
  //       modal2 == null ? addInterestWithoutClearList() : addInterest();

  //       // uploaded user images

  //       imagePaths.clear();
  //       modal2 != null ? addUserImages() : addUserImagesWithoutclear();

  //       // for (int i = 0; i < modal!.data![0].images[0].image.length; i++) {
  //       //   imagePaths.add(modal!.data![0].images[0].image[i]);
  //       // }

  //       // longitude
  //       longitude = modal == null
  //           ? modal4!.data!.longitude
  //           : modal!.data![0].location[0].longitude;
  //       // latitude
  //       latitude = modal == null
  //           ? modal4!.data!.longitude
  //           : modal!.data![0].location[0].latitude;
  //       // horoscope value
  //       userhoroscope = modal!.data![0].zodiac;
  //       // user gender Value
  //       userGender = modal!.data![0].gender;
  //       // here to
  //       hereTo = modal!.data![0].filter[0].hereTo;
  //       // want to meet
  //       wantToMeet = modal!.data![0].filter[0].wantToMeet;
  //       // preffered age
  //       prefferedAge = modal!.data![0].filter[0].ageRange;
  //       // preffered language
  //       prefferedlanguage = modal!.data![0].filter[0].language;
  //     }
  //     setState(() {});
  //   } on DioException catch (e) {
  //     if (mounted) {
  //       CommonWidgets.showflushbar(context, e.toString());
  //     }
  //   }
  // }

  // // get user location
  // Future<void> getAddress() async {
  //   try {
  //     List<Placemark> placeMarks =
  //         await placemarkFromCoordinates(latitude!, longitude!);
  //     Placemark place = placeMarks[0];
  //     setState(() {
  //       userCurrentLocation = "${place.locality},${place.country}";
  //     });
  //     setState(() {});

  //     //  else {
  //     //   CommonWidgets.showflushbar(
  //     //       context, StringConstants.confirmPasswordError);
  //     // }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  // // get user location and details
  // void gettingdetails() async {
  //   await hitUserById();
  //   await getAddress();
  //   setState(() {});
  // }

  // void checkUserIs18(DateTime? dobvalue, TextEditingController? dob) {
  //   DateTime todaydate = DateTime.now();
  //   int age = todaydate.year - dobvalue!.year;
  //   if (age < 18) {
  //     CommonWidgets.showflushbar(context, StringConstants.dobErorrMessage);
  //   } else {
  //     dob!.text = DateFormat('dd-MM-yyyy').format(dobvalue);
  //   }
  // }

  // // hit user update profile Api
  // Future<void> hituserUpdateProfileApi() async {
  //   SharedPreferences getToken = await SharedPreferences.getInstance();
  //   try {
  //     final modal = await Api.updateUserDetails(
  //         userimages: imagePaths,
  //         tokenValue: getToken.getString(SharedpreferenceKeys.jwtToken),
  //         userBirthDate:
  //             userDOBController.text.isEmpty ? userdob : userDOBController.text,
  //         about: useraboutController.text.isEmpty
  //             ? userabout
  //             : useraboutController.text,
  //         zodiac: horoscopeSelectedvalue ?? userhoroscope,
  //         hereto: selectedFriendshipInterest ?? hereTo,
  //         wantTomeet: selectedGenderValue ?? wantToMeet,
  //         agerange: selectedAge ?? prefferedAge,
  //         language: selectedLanguage ?? prefferedlanguage,
  //         genderValue: genderValue ?? userGender);
  //     if (modal.success == true) {
  //       if (mounted) {
  //         // hitUserById();
  //       }
  //     }
  //   } on DioException catch (e) {
  //     if (mounted) {
  //       CommonWidgets.showflushbar(context, e.toString());
  //     }
  //   }
  // }

  // void addUserImages() {
  //   imagePaths.add(modal2!.image);
  //   for (int i = 0; i < modal!.data![0].images[0].image.length; i++) {
  //     imagePaths.add(modal!.data![0].images[0].image[i]);
  //   }
  // }

  // void addUserImagesWithoutclear() {
  //   for (int i = 0; i < modal!.data![0].images[0].image.length; i++) {
  //     imagePaths.add(modal!.data![0].images[0].image[i]);
  //   }
  // }

  // void addInterest() {
  //   userInterest.clear();
  //   userInterest.add(StringConstants.add);

  //   for (int i = 0; i < modal!.data![0].userInterst.length; i++) {
  //     userInterest.insert(i, modal!.data![0].userInterst[i].intrestName);
  //   }
  // }

  // void addInterestWithoutClearList() {
  //   userInterest.clear();
  //   userInterest.add(StringConstants.add);
  //   for (int i = 0; i < modal!.data![0].userInterst.length; i++) {
  //     userInterest.insert(i, modal!.data![0].userInterst[i].intrestName);
  //   }
  // }

  // // get user exact location
  // getCurrentLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     if (mounted) {
  //       CommonWidgets.showflushbar(context, StringConstants.disableLocation);
  //     }
  //   }

  //   permission = (await Geolocator.checkPermission());
  //   if (permission == LocationPermission.denied) {
  //     permission = (await Geolocator.requestPermission());
  //     if (permission == LocationPermission.denied) {
  //       if (mounted) {
  //         CommonWidgets.showflushbar(context, StringConstants.deniedLocation);
  //       }
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     if (mounted) {
  //       CommonWidgets.showflushbar(
  //           context, StringConstants.permanentlyDeniedLocation);
  //     }
  //   }

  //   exactLoaction = await Geolocator.getCurrentPosition();
  //   setState(() {});
  // }

  // Future<void> updateUserLocation() async {
  //   await getCurrentLocation();
  //   modal4 = await Api.updateUserLocation(
  //       longitude: exactLoaction!.longitude,
  //       latitude: exactLoaction!.latitude.toDouble(),
  //       tokenValue: SharedpreferenceKeys.prefs!
  //           .getString(SharedpreferenceKeys.jwtToken));
  // }

  // // Future<void> getAddressOfuser() async {
  // //   try {
  // //     if (modal4!.success == true) {
  // //       List<Placemark> placeMarks = await placemarkFromCoordinates(
  // //           modal4!.data!.longitude, modal4!.data!.latitude.toDouble());
  // //       Placemark place = placeMarks[0];
  // //       setState(() {
  // //         currentLocation = "${place.locality},${place.country}";
  // //       });
  // //       setState(() {});
  // //     }
  // //     //  else {
  // //     //   CommonWidgets.showflushbar(
  // //     //       context, StringConstants.confirmPasswordError);
  // //     // }
  // //   } catch (e) {
  // //     log(e.toString());
  // //   }
  // // }

  // Future<void> hitupdateuserlocationApi() async {
  //   await updateUserLocation();
  //   await getAddress();
  //   hitUserById();
  //   setState(() {});
  // }
}
