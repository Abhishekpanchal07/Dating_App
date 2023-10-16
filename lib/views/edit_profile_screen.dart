import 'package:demoapp/constants/Image_Constants.dart';
import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: DimensionConstants.d43.h,
            left: DimensionConstants.d21.w,
            right: DimensionConstants.d12.w),
        child: Column(
          children: [
            // App Bar
            Row(
              children: [
                const ImageView(
                  path: ImageConstants.leftArrowIcon,
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
                const Text(StringConstants.done).regularText(
                    ColorConstant.inboxScreenGradientColor,
                    TextAlign.center,
                    DimensionConstants.d18.sp)
              ],
            ),

            SizedBox(
              height: DimensionConstants.d60.h,
            ),
            // user pictures
            SizedBox(
              height: DimensionConstants.d400.h,
              width: DimensionConstants.d414.w,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: DimensionConstants.d20.h,
                      crossAxisSpacing: DimensionConstants.d20.w),
                  itemBuilder: (context, index) {
                    return const SizedBox();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
