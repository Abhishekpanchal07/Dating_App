import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/modals/matchscreen_images.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  List<MatchScreenImages> imageData = [
    MatchScreenImages(
        name: StringConstants.lelani,
        imageUrl:
            StringConstants.imageurlInboxScreen,
        age: StringConstants.age ),
    MatchScreenImages(
        name: StringConstants.lelani,
        imageUrl:
            StringConstants.imageurlInboxScreen,
        age: StringConstants.age ),
    MatchScreenImages(
        name: StringConstants.lelani,
        imageUrl:
            StringConstants.imageurlInboxScreen,
        age: StringConstants.age ),
    MatchScreenImages(
        name: StringConstants.lelani,
        imageUrl:
            StringConstants.imageurlInboxScreen,
        age: StringConstants.age ),
    MatchScreenImages(
        name: StringConstants.lelani,
        imageUrl:
            StringConstants.imageurlInboxScreen,
        age: StringConstants.age ),
    MatchScreenImages(
        name: StringConstants.lelani,
        imageUrl:
            StringConstants.imageurlInboxScreen,
        age: StringConstants.age ),
    MatchScreenImages(
        name: StringConstants.lelani,
        imageUrl:
            StringConstants.imageurlInboxScreen,
        age: StringConstants.age ),
    MatchScreenImages(
        name: StringConstants.lelani,
        imageUrl:
            StringConstants.imageurlInboxScreen,
        age: StringConstants.age ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: DimensionConstants.d43.h,
            left: DimensionConstants.d40.w,
            right: DimensionConstants.d39.w),
        child: Column(
          children: [
            Row(
              children: [
                const Text(StringConstants.mText).bold(ColorConstant.lightpink,
                    TextAlign.center, DimensionConstants.d24.sp),
                const Text(StringConstants.atchText).bold(
                    ColorConstant.textfieldgradientColor,
                    TextAlign.center,
                    DimensionConstants.d24.sp),
                const Text(StringConstants.esText).bold(
                    ColorConstant.buttongradientcolor2,
                    TextAlign.center,
                    DimensionConstants.d24.sp),
                SizedBox(
                  width: DimensionConstants.d160.w,
                ),
                const ImageView(
                  path: ImageConstants.searchIcon,
                ),
                SizedBox(
                  width: DimensionConstants.d23.w,
                ),
                const ImageView(
                  path: ImageConstants.notificationIcon,
                ),
              ],
            ),
            SizedBox(
              width: DimensionConstants.d18.h,
            ),
            SizedBox(
              height: DimensionConstants.d18.h,
              width: DimensionConstants.d374.w,
              child: Row(
                children: [
                  Container(
                    height: DimensionConstants.d1.h,
                    width: DimensionConstants.d148.w,
                    color: ColorConstant.offwhite,
                  ),
                  SizedBox(
                    width: DimensionConstants.d10.w,
                  ),
                  const Text(StringConstants.todayText).regularText(
                      ColorConstant.black,
                      TextAlign.center,
                      DimensionConstants.d12.sp),
                  SizedBox(
                    width: DimensionConstants.d10.w,
                  ),
                  Container(
                    height: DimensionConstants.d1.h,
                    width: DimensionConstants.d130.w,
                    color: ColorConstant.offwhite,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: DimensionConstants.d13.h,
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: imageData.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: DimensionConstants.d174.h,
                    childAspectRatio: DimensionConstants.d1,
                    mainAxisSpacing: DimensionConstants.d30.h,
                    crossAxisSpacing: DimensionConstants.d30.w,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteConstants.userDetailScreen);
                      },
                      child: imageContainer(
                          imageurl: imageData[index].imageUrl,
                          name: imageData[index].name,
                          age: imageData[index].age),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageContainer({String? imageurl, String? name, String? age}) {
    return Container(
      height: DimensionConstants.d174.h,
      width: DimensionConstants.d152.w,
      decoration: BoxDecoration(
        color: ColorConstant.lightpink,
        borderRadius: BorderRadius.circular(DimensionConstants.d15),
      ),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(DimensionConstants.d15),
              child: ImageView(
                height: DimensionConstants.d174.h,
                width: DimensionConstants.d152.w,
                path: imageurl,
                fit: BoxFit.cover,
              )),
          Positioned(
              top: DimensionConstants.d11.h,
              right: DimensionConstants.d7.w,
              child: const ImageView(
                path: ImageConstants.matchScreenCrossIcon,
              )),
          Positioned(
              bottom: DimensionConstants.d10.h,
              left: DimensionConstants.d18.w,
              child: Row(
                children: [
                  Text(name!).regularText(ColorConstant.textcolor,
                      TextAlign.center, DimensionConstants.d16.sp),
                  Text(age!.toString()).regularText(ColorConstant.textcolor,
                      TextAlign.center, DimensionConstants.d16.sp),
                ],
              )),
        ],
      ),
    );
  }
}
