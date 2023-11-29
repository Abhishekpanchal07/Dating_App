import 'package:demoapp/constants/Color_Constants.dart';
import 'package:demoapp/constants/api_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/helper/stop_scroll.dart';
import 'package:demoapp/providers/getting_user_details.dart';
import 'package:demoapp/views/base_view.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  // @override
  // void initState() {
  //   //hitgettinguserDetailApi();
  //   super.initState();
  // }

  // void hitgettinguserDetailApi() async {
  //   await hitUserById();
  //   await getAddress();
  //   setState(() {});
  // }

  // UpdateUserInterest? modal3;
  // Future<void> getUpdatedUserInterests() async {
  //   modal3 = await Api.updateUserInterests();
  // }

  // List conatinerChildTextValue = [];
  // List<String> userImages = [];
  // String userName = "";
  // int? userAge;
  // String userEmail = "";
  // String userhoroscope = "";
  // String userBirthdate = "";
  // String userAbout = "";
  // String hereTo = "";
  // double? longitude;
  // double? latitude;
  // String userCurrentLocation = "";
   final controller = PageController();
  // GetUserDetails? modal;
  @override
  Widget build(BuildContext context) {
    return BaseView<GettingUserDetailsProvider>(
      onModelReady: (provider) {
        provider.hitgettinguserDetailApi(context);
      },
      builder: (context, provider, child) {
        return Scaffold(
          body: provider.modal == null
              ? CommonWidgets.showProgressbar()
              : SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      Positioned(
                        child: SizedBox(
                          height: DimensionConstants.d470.h,
                          width: DimensionConstants.d414.w,
                          child: PageView.builder(
                              itemCount: provider.imagePaths.length,
                              controller: controller,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return ImageView(
                                  fit: BoxFit.cover,
                                  path: ApiUrls.baseUrl + provider.imagePaths[index],
                                );
                              }),
                        ),
                      ),
                      Positioned(
                          top: DimensionConstants.d359.h,
                          left: DimensionConstants.d196.w,
                          child: SmoothPageIndicator(
                            controller: controller,
                            count: provider.imagePaths.length,
                            effect: const JumpingDotEffect(
                                activeDotColor:
                                    ColorConstant.inboxScreenGradientColor,
                                dotColor: ColorConstant.textcolor),
                          )),
                      Positioned(
                          top: DimensionConstants.d53.h,
                          right: DimensionConstants.d20.w,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                      context, RouteConstants.editProfileScreen)
                                  .then((value) {
                                if (value == true) {
                                  provider.hitUserById(context);
                                  //hitUserById();
                                  // setState(() {});
                                }
                              });
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
                        child: draggableSheet(provider),
                      ))
                    ],
                  ),
                ),
        );
      },
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
  Widget draggableSheet(GettingUserDetailsProvider provider) {
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
                          Text(provider.userName).bold(ColorConstant.black,
                              TextAlign.center, DimensionConstants.d24.sp),
                          SizedBox(
                            height: DimensionConstants.d9.h,
                          ),
                          Text(provider.userEmail).regularText(ColorConstant.black,
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
                          Text(provider.userhoroscope).regularText(ColorConstant.black,
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
                          Text(provider.userCurrentLocation).regularText(
                              ColorConstant.black,
                              TextAlign.center,
                              DimensionConstants.d16.sp),
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
                          Text(provider.userBirthdate).regularText(ColorConstant.black,
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

                          Text(provider.userAbout).regularText(
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

                          Text(provider.hereTo).regularText(
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
                              itemCount: provider.conatinerChildTextValue.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: DimensionConstants.d7.w,
                                mainAxisSpacing: DimensionConstants.d10.h,
                                childAspectRatio: DimensionConstants.d4,
                              ),
                              itemBuilder: (context, index) {
                                return provider.conatinerChildTextValue.isNotEmpty
                                    ? gradientcontainer(
                                        containerchildText:
                                            provider.conatinerChildTextValue[index])
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
  // Future<void> hitUserById() async {
  //   SharedPreferences getToken = await SharedPreferences.getInstance();
  //   try {
  //     modal = await Api.userById(
  //         jwtToken: getToken.getString(SharedpreferenceKeys.jwtToken));

  //     if (modal!.success == true) {
  //       DateTime currentDate = DateTime.now();
  //       DateTime userDob = modal!.data![0].birthDate.isNotEmpty
  //           ? DateTime.parse(modal!.data![0].birthDate)
  //           : DateTime.now();
  //       int currentAge = currentDate.year - userDob.year;
  //       userBirthdate = modal!.data![0].birthDate.isNotEmpty
  //           ? DateFormat('dd-MM-yyyy')
  //               .format(DateTime.parse(modal!.data![0].birthDate))
  //           : "";
  //       userName =
  //           ' ${modal!.data![0].firstName}${modal!.data![0].lastName},${currentAge.toString()}';
  //       // userAge = currentAge;
  //       userEmail = modal!.data![0].email;

  //       userAbout = modal!.data![0].about;
  //       hereTo = modal!.data![0].filter[0].hereTo;
  //       // user interests
  //       conatinerChildTextValue.clear();
  //       for (int i = 0; i < modal!.data![0].userInterst.length; i++) {
  //         conatinerChildTextValue
  //             .add(modal!.data![0].userInterst[i].intrestName);
  //       }
  //       userImages.clear();
  //       for (int i = 0; i < modal!.data![0].images[0].image.length; i++) {
  //         userImages.add(modal!.data![0].images[0].image[i]);
  //       }
  //       // longitude
  //       longitude = modal!.data![0].location[0].longitude;
  //       // latitude
  //       latitude = modal!.data![0].location[0].latitude;
  //       // horoscope value
  //       userhoroscope = modal!.data![0].zodiac;
  //       print(userImages);

  //       log(userName);
  //       log(userBirthdate);
  //       log(userAbout);
  //       setState(() {});
  //     }
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
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
}
