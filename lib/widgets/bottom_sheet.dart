import 'package:demoapp/constants/Color_Constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/stop_scroll.dart';
import 'package:demoapp/providers/getting_user_details.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowBottomSheet extends StatefulWidget {
  final GettingUserDetailsProvider singleUserDetail;
  const ShowBottomSheet({Key? key, required this.singleUserDetail})
      : super(key: key);

  @override
  State<ShowBottomSheet> createState() => _ShowBottomSheetState();
}

class _ShowBottomSheetState extends State<ShowBottomSheet> {
  bool readMore = false;
  @override
  Widget build(BuildContext context,) {
    return DraggableScrollableSheet(
     
        initialChildSize: 0.5,
        minChildSize: 0.5,
        maxChildSize: 0.8,
        builder: (BuildContext context,  scrollController) {
          
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
                  itemCount: DimensionConstants.d1.toInt(),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Text(widget.singleUserDetail.matchedUserName).bold(
                                      ColorConstant.black,
                                      TextAlign.center,
                                      DimensionConstants.d24.sp),
                                      SizedBox(
                            height: DimensionConstants.d10.h,
                          ),
                                   Text(widget.singleUserDetail.matchedUserHororscope).regularText(
                                      ColorConstant.black,
                                      TextAlign.start,
                                      DimensionConstants.d14.sp),
                                ],
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(context, RouteConstants.messageScreen,arguments: widget.singleUserDetail),
                                child: const ImageView(
                                  path: ImageConstants.sendMessaageButton,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: DimensionConstants.d20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(StringConstants.location).bold(
                                      ColorConstant.black,
                                      TextAlign.center,
                                      DimensionConstants.d16.sp),
                                  SizedBox(
                                    height: DimensionConstants.d5.h,
                                  ),
                                   Text(widget.singleUserDetail.userCurrentLocation)
                                      .regularText(
                                          ColorConstant.black,
                                          TextAlign.center,
                                          DimensionConstants.d16.sp),
                                ],
                              ),
                              Container(
                                height: DimensionConstants.d34.h,
                                width: DimensionConstants.d61.w,
                                decoration: BoxDecoration(
                                  color: ColorConstant.dashboardGradientColor1
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(
                                      DimensionConstants.d7),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.all(DimensionConstants.d5),
                                  child: Row(
                                    children: [
                                      const ImageView(
                                        path: ImageConstants
                                            .locationIconUserDetailScreen,
                                      ),
                                      const Text(StringConstants.onekm)
                                          .regularText(
                                              ColorConstant.red,
                                              TextAlign.center,
                                              DimensionConstants.d12.sp)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: DimensionConstants.d20.h,
                          ),
                          const Text(StringConstants.about).bold(
                              ColorConstant.black,
                              TextAlign.center,
                              DimensionConstants.d16.sp),
                          SizedBox(
                            height: DimensionConstants.d5.h,
                          ),
                          
                             Text(widget.singleUserDetail.matchedUserAbout).regularText(ColorConstant.black, TextAlign.start, DimensionConstants.d14.sp,maxLines:readMore? 6 : 2 ),
                            GestureDetector(
                              onTap: (){
                              setState(() {
                                readMore = !readMore;
                              });
                              },
                              child:  const Text(StringConstants.readMore).bold(
                                ColorConstant.red,
                                TextAlign.center,
                                DimensionConstants.d14.sp),
                                ),
                          SizedBox(
                            height: DimensionConstants.d20.h,
                          ),
                          const Text(StringConstants.interests).bold(
                              ColorConstant.black,
                              TextAlign.center,
                              DimensionConstants.d16.sp),
                                SizedBox(
                            height: DimensionConstants.d10.h,
                          ),
                         
                          GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                              itemCount: widget.singleUserDetail.matchedUserInterest.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: DimensionConstants.d7.w,
                                mainAxisSpacing: DimensionConstants.d10.h,
                                childAspectRatio: DimensionConstants.d4,
                              ),
                              itemBuilder: (context, index) {
                                return widget
                                        .singleUserDetail.matchedUserInterest.isNotEmpty
                                    ? gradientcontainer(
                                        containerchildText: widget
                                            .singleUserDetail.matchedUserInterest[index])
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

  Widget gradientcontainer({String? containerchildText}) {
    return Container(
      height: DimensionConstants.d32.h,
      width: DimensionConstants.d112.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DimensionConstants.d5),
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorConstant.red,
              ColorConstant.dialogboxgradientcolor3,
            ]),
      ),
      child: Container(
        height: DimensionConstants.d29.h,
        width: DimensionConstants.d118.w,
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
}
