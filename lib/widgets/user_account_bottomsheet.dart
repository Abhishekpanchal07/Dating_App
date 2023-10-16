import 'package:demoapp/constants/Color_Constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAccountBottomSheet extends StatefulWidget {
 final List? conatinerChildTextValue;
  const UserAccountBottomSheet({Key ? key,required this.conatinerChildTextValue}) : super(key: key);

  @override
  State<UserAccountBottomSheet> createState() => _UserAccountBottomSheetState();
}

class _UserAccountBottomSheetState extends State<UserAccountBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.8,
        maxChildSize: 1.0,
        builder: (BuildContext context, ScrollController scrollcontroller) {
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
            child:  Container(
              padding: EdgeInsets.only(
                top: DimensionConstants.d30.h,
                left: DimensionConstants.d25.w,
                right: DimensionConstants.d20.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(StringConstants.jesicaParker).bold(
                      ColorConstant.black,
                      TextAlign.center,
                      DimensionConstants.d24.sp),
                      SizedBox(
                        height: DimensionConstants.d9.h,
                      ),
                  const Text(StringConstants.aries).regularText(
                      ColorConstant.black,
                      TextAlign.start,
                      DimensionConstants.d14.sp),
                  SizedBox(
                    height: DimensionConstants.d30.h,
                  ),
                  // zodiac Sign 
                  const Text(StringConstants.zodiacSign).bold(
                          ColorConstant.black,
                          TextAlign.center,
                          DimensionConstants.d16.sp),
                          SizedBox(
                        height: DimensionConstants.d9.h,
                      ),
                  const Text(StringConstants.aries).regularText(
                      ColorConstant.black,
                      TextAlign.start,
                      DimensionConstants.d14.sp),
              
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
                  const Text(StringConstants.jessicaLoaction)
                      .regularText(
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
                  const Text(StringConstants.birthdayDate)
                      .regularText(
                          ColorConstant.black,
                          TextAlign.center,
                          DimensionConstants.d16.sp),
                 
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
                  
                    const Text(StringConstants.jessicaDescription,).regularText(ColorConstant.black, TextAlign.start, DimensionConstants.d14.sp, ),
                   
                  SizedBox(
                    height: DimensionConstants.d30.h,
                  ),
                  const Text(StringConstants.interests).bold(
                      ColorConstant.black,
                      TextAlign.center,
                      DimensionConstants.d16.sp),
                  SizedBox(
                    height: DimensionConstants.d10.h,
                  ),
                  SizedBox(
                    height: DimensionConstants.d200.h,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                        itemCount: widget.conatinerChildTextValue!.length,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: DimensionConstants.d7.w,
                          mainAxisSpacing: DimensionConstants.d10.h,
                          childAspectRatio: DimensionConstants.d4,
                        ),
                        itemBuilder: (context, index) {
                          return widget
                                  .conatinerChildTextValue!.isNotEmpty
                              ? gradientcontainer(
                                  containerchildText: widget
                                      .conatinerChildTextValue![index])
                              : gradientcontainer(
                                  containerchildText: StringConstants.gallery);
                        }),
                  )
                ],
              ),
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
        color: ColorConstant.inboxScreenGradientColor
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
