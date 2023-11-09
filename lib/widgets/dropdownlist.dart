import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/stop_scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowDropDownList extends StatelessWidget {
  final List<String>? listname;
  final Function(String title)? onTap;

  const ShowDropDownList({Key? key, this.listname, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       // height: DimensionConstants.d250.h,
        width: DimensionConstants.d374.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorConstant.buttongradientcolor1,
              ColorConstant.bottongradientcolor2
            ]),
          borderRadius: BorderRadius.circular(DimensionConstants.d20.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: DimensionConstants.d25.w,
              vertical: DimensionConstants.d13.h),
          child: Align(
            alignment: Alignment.topLeft,
            child: ScrollConfiguration(
              behavior: NoGlowScrollBehavior(),
              child: ListView.builder(
                shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: listname!.length,
                  itemExtent: DimensionConstants.d35,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        onTap!(listname![index]);
                      },
                      child: Text(listname![index]).regularText(
                      
                        ColorConstant.textcolor,
                        TextAlign.start,
                        DimensionConstants.d16.sp,
                        //backgroundColor:  ColorConstant.textcolor
                        )
                    );
                  }),
            ),
          ),
        ));
  }
}
