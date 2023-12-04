import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/search_user.dart';
import 'package:demoapp/helper/stop_scroll.dart';
import 'package:demoapp/modals/inbox_screen_user_details_list.dart';
import 'package:demoapp/views/one_to_one_chatscreen.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  List<dynamic> userDetail = [
    UserImageAndName(
        imagePathOfInboxScreen: StringConstants.imageurlInboxScreen,
        name: StringConstants.lelani,
        userMessage: StringConstants.hello),
    UserImageAndName(
        imagePathOfInboxScreen: StringConstants.imageurlInboxScreen,
        name: StringConstants.mona,
        userMessage: StringConstants.hello),
    UserImageAndName(
        imagePathOfInboxScreen: StringConstants.imageurlInboxScreen,
        name: StringConstants.lily,
        userMessage: StringConstants.hello),
    UserImageAndName(
        imagePathOfInboxScreen: StringConstants.imageurlInboxScreen,
        name: StringConstants.reshma,
        userMessage: StringConstants.hello),
    UserImageAndName(
        imagePathOfInboxScreen: StringConstants.imageurlInboxScreen,
        name: StringConstants.kiran,
        userMessage: StringConstants.hello),
    UserImageAndName(
        imagePathOfInboxScreen: StringConstants.imageurlInboxScreen,
        name: StringConstants.pooja,
        userMessage: StringConstants.hello),
    UserImageAndName(
        imagePathOfInboxScreen: StringConstants.imageurlInboxScreen,
        name: StringConstants.shreya,
        userMessage: StringConstants.hello),
    UserImageAndName(
        imagePathOfInboxScreen: StringConstants.imageurlInboxScreen,
        name: StringConstants.kajal,
        userMessage: StringConstants.hello),
    UserImageAndName(
        imagePathOfInboxScreen: StringConstants.imageurlInboxScreen,
        name: StringConstants.roma,
        userMessage: StringConstants.hello),
    UserImageAndName(
        imagePathOfInboxScreen: StringConstants.imageurlInboxScreen,
        name: StringConstants.lily,
        userMessage: StringConstants.hello),
    UserImageAndName(
        imagePathOfInboxScreen: StringConstants.imageurlInboxScreen,
        name: StringConstants.pooja,
        userMessage: StringConstants.hello),
    UserImageAndName(
        imagePathOfInboxScreen: StringConstants.imageurlInboxScreen,
        name: StringConstants.reshma,
        userMessage: StringConstants.hello),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: DimensionConstants.d43.h,
          left: DimensionConstants.d20.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search And  Notification Icon
            Padding(
              padding: EdgeInsets.only(right: DimensionConstants.d23.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      showSearch(
                          context: context, delegate: SearchUser(userDetail));
                    },
                    child: const ImageView(
                      path: ImageConstants.searchIcon,
                    ),
                  ),
                  SizedBox(
                    width: DimensionConstants.d20.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouteConstants.notificationScreen);
                    },
                    child: const ImageView(
                      path: ImageConstants.notificationIconInboxScreen,
                    ),
                  ),
                ],
              ),
            ),
            // user Stories
            SizedBox(
              height: DimensionConstants.d102.h,
             // width: DimensionConstants.d394.w,
              child: ScrollConfiguration(
                behavior: NoGlowScrollBehavior(),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      storyContainer(),
                      ListView.builder(
                        shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: userDetail.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: DimensionConstants.d12),
                              child: userPicContainer(
                                  userDetail[index].imagePathOfInboxScreen,
                                  userDetail[index].name),
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: DimensionConstants.d11.h,
            ),
            const Text(StringConstants.message).regularText(
                ColorConstant.dashboardGradientColor1,
                TextAlign.start,
                DimensionConstants.d24.sp),
            // user chats
            Expanded(
              child: ScrollConfiguration(
                behavior: NoGlowScrollBehavior(),
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: userDetail.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: DimensionConstants.d10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteConstants.oneToOneScreen,
                                arguments: OneToOneChatScreen(
                                    userName: userDetail[index].name,
                                    userImagePath: userDetail[index]
                                        .imagePathOfInboxScreen));
                          },
                          child: userchatCard(
                              imagepath:
                                  userDetail[index].imagePathOfInboxScreen,
                              username: userDetail[index].name,
                              userMessage: userDetail[index].userMessage),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget storyContainer() {
    return Column(
      children: [
        Container(
          height: DimensionConstants.d78.h,
          width: DimensionConstants.d57.w,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: AlignmentDirectional.topStart,
                  end: Alignment.bottomRight,
                  colors: [
                    ColorConstant.inboxScreenGradientColor,
                    ColorConstant.dashboardGradientColor1
                  ])),
          child: const Center(
              child: ImageView(
            path: ImageConstants.addIconInboxScreen,
            fit: BoxFit.cover,
          )),
        ),
        const Text(StringConstants.story).semiBold(
            ColorConstant.black, TextAlign.center, DimensionConstants.d14.sp)
      ],
    );
  }

  Widget userPicContainer(
    String? imagePath,
    String? userName,
  ) {
    return Column(
      children: [
        Container(
            height: DimensionConstants.d80.h,
            width: DimensionConstants.d60.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
             // color: ColorConstant.black
            ),
            child:
             Center(
               child: ImageView(
                circleCrop: true,
                radius: DimensionConstants.d31.r,
                path: imagePath,
                fit: BoxFit.cover,
                 height: DimensionConstants.d66.h,
                   width: DimensionConstants.d58.w,
                   ),
             )
              ),
            
        Text(userName!).semiBold(
            ColorConstant.black, TextAlign.center, DimensionConstants.d14.sp)
      ],
    );
  }

  static Widget userchatCard(
      {String? imagepath, String? username, String? userMessage}) {
    return Row(
      children: [
        Container(
          height: DimensionConstants.d57.h,
          width: DimensionConstants.d57.w,
          decoration: const BoxDecoration(shape: BoxShape.circle,),
          child: Center(
            child: ImageView(
              height: DimensionConstants.d57.h,
              width: DimensionConstants.d50.w,
              radius: DimensionConstants.d27.r,
              circleCrop: true,
              fit: BoxFit.cover,
              path: imagepath,
            ),
          ),
        ),
        SizedBox(
          width: DimensionConstants.d15.w,
        ),
        Expanded(
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username!).regularText(ColorConstant.black,
                        TextAlign.center, DimensionConstants.d19.sp),
                    Text(userMessage!).regularText(
                        ColorConstant.black.withOpacity(0.4),
                        TextAlign.center,
                        DimensionConstants.d19.sp),
                  ],
                ),
                Container(
                    height: DimensionConstants.d24.h,
                    width: DimensionConstants.d24.w,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              ColorConstant.dashboardGradientColor1,
                              ColorConstant.inboxScreenGradientColor
                            ])),
                    child: Center(
                      child: const Text("1").regularText(ColorConstant.textcolor,
                          TextAlign.center, DimensionConstants.d13.sp),
                    ))
              ],
            ),
          ),
        ),

        // Container(
        //     height: DimensionConstants.d24.h,
        //     width: DimensionConstants.d24.w,
        //     decoration: const BoxDecoration(
        //         shape: BoxShape.circle,
        //         gradient: LinearGradient(
        //             begin: Alignment.topCenter,
        //             end: Alignment.bottomCenter,
        //             colors: [
        //               ColorConstant.dashboardGradientColor1,
        //               ColorConstant.inboxScreenGradientColor
        //             ])),
        //     child: Center(
        //       child: const Text("1").regularText(ColorConstant.textcolor,
        //           TextAlign.center, DimensionConstants.d13.sp),
        //     ))
      ],
    );
  }
}
