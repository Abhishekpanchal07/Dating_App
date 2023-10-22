import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/stop_scroll.dart';
import 'package:demoapp/modals/notification_data_modal.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationData>? notificationData = [
    NotificationData(
        notificationTime: StringConstants.notificationTime,
        notificationTitle: StringConstants.notificationTitle,
        notificationContent: StringConstants.notificationContent),
    NotificationData(
        notificationTime: StringConstants.notificationTime,
        notificationTitle: StringConstants.notificationTitle,
        notificationContent: StringConstants.notificationContent),
    NotificationData(
        notificationTime: StringConstants.notificationTime,
        notificationTitle: StringConstants.notificationTitle,
        notificationContent: StringConstants.notificationContent),
    NotificationData(
        notificationTime: StringConstants.notificationTime,
        notificationTitle: StringConstants.notificationTitle,
        notificationContent: StringConstants.notificationContent),
    NotificationData(
        notificationTime: StringConstants.notificationTime,
        notificationTitle: StringConstants.notificationTitle,
        notificationContent: StringConstants.notificationContent),
    NotificationData(
        notificationTime: StringConstants.notificationTime,
        notificationTitle: StringConstants.notificationTitle,
        notificationContent: StringConstants.notificationContent),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: DimensionConstants.d43.h,
          left: DimensionConstants.d20.w,
          right: DimensionConstants.d20.w,
        ),
        height: MediaQuery.of(context).size.height,
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
                  width: DimensionConstants.d87.w,
                ),
                GradientText(
                  StringConstants.notification,
                  colors: const [
                    ColorConstant.inboxScreenGradientColor,
                    ColorConstant.dashboardGradientColor1
                  ],
                  style: TextStyle(
                      fontFamily: StringConstants.familyName,
                      fontWeight: FontWeight.w500,
                      fontSize: DimensionConstants.d24.sp),
                ),
              ],
            ),
            // notification section
            Expanded(
              child: SizedBox(
                child: ScrollConfiguration(
                  behavior: NoGlowScrollBehavior(),
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: notificationData!.length,
                      itemBuilder: (context, index) {
                        return notificationContent(
                            notificationTime:
                                notificationData![index].notificationTime,
                            notificationTitle:
                                notificationData![index].notificationTitle,
                            notificationcontent:
                                notificationData![index].notificationContent);
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget notificationContent({
    String? notificationTime,
    String? notificationTitle,
    String? notificationcontent,
  }) {
    return SizedBox(
      height: DimensionConstants.d175.h,
      width: DimensionConstants.d374.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const ImageView(
                path: ImageConstants.notificationDotIcon,
              ),
              SizedBox(
                width: DimensionConstants.d34.w,
              ),
              Padding(
                padding: EdgeInsets.only(top: DimensionConstants.d25.h),
                child: SizedBox(
                  width: DimensionConstants.d317.w,
                  height: DimensionConstants.d116.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notificationTime!).regularText(
                          ColorConstant.color6B6B6B,
                          TextAlign.center,
                          DimensionConstants.d12.sp),
                      SizedBox(
                        height: DimensionConstants.d13.h,
                      ),
                      Text(notificationTitle!).regularText(ColorConstant.black,
                          TextAlign.start, DimensionConstants.d16.sp,
                          maxLines: 2),
                      SizedBox(
                        height: DimensionConstants.d8.h,
                      ),
                      Text(notificationcontent!).regularText(
                          ColorConstant.color6B6B6B,
                          TextAlign.start,
                          DimensionConstants.d12.sp,
                          maxLines: 2),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: DimensionConstants.d31.h,
          ),
          Container(
            height: DimensionConstants.d1,
            width: DimensionConstants.d349.w,
            color: ColorConstant.colorF2EAE0,
          )
        ],
      ),
    );
  }
}
