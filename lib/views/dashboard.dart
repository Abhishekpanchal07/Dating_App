import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: DimensionConstants.d50.h,
            left: DimensionConstants.d16.w,
            right: DimensionConstants.d20.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GradientText(StringConstants.home,
                    style: TextStyle(
                        fontFamily: StringConstants.familyName,
                        fontSize: DimensionConstants.d24.sp,
                        fontWeight: FontWeight.w600),
                    colors: const [
                      ColorConstant.dashboardGradientColor,
                      ColorConstant.dashboardGradientColor1
                    ]),
                const ImageView(
                  path: ImageConstants.bellIcon,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: DimensionConstants.d83.h,
        width: DimensionConstants.d414,
        color: ColorConstant.textcolor,
        child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            padding:
                const EdgeInsets.symmetric(horizontal: DimensionConstants.d10),
            itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 1500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        margin: EdgeInsets.only(
                          bottom:
                              index == currentIndex ? 0 : DimensionConstants.d1,
                          left: DimensionConstants.d5,
                          right: DimensionConstants.d5,
                        ),
                        width: DimensionConstants.d30.w,
                        height:
                            index == currentIndex ? DimensionConstants.d3 : 0,
                        decoration: const BoxDecoration(
                          color: ColorConstant.headingcolor,
                        ),
                      ),
                        
                     
                      // Padding(
                      //   padding:  EdgeInsets.only(top: DimensionConstants.d10.h,
                      //   bottom: DimensionConstants.d18.h),
                      //   child: SizedBox(
                      //     width: DimensionConstants.d10.w,
                      //     child: Row(
                      //       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //       children: [
                      //         BottomNavigationBar(
                      //           items: const [
                      //   BottomNavigationBarItem(icon: ImageView(path: ImageConstants.dashboardIcon,),label: ''),
                      //    BottomNavigationBarItem(icon: ImageView(path: ImageConstants.dashboardMenuIcon,),label: ''),
                      //     BottomNavigationBarItem(icon: ImageView(path: ImageConstants.chattingIcon,),label: ''),
                      //      BottomNavigationBarItem(icon: ImageView(path: ImageConstants.accountIcon,),label: ''),
                      // ]),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                         
                    ],
                  ),
                )),
      ),
    );
  }

  List images = [
    ImageView(path: ImageConstants.dashboardIcon,),
     ImageView(path: ImageConstants.dashboardMenuIcon,),
      ImageView(path: ImageConstants.chattingIcon,),
       ImageView(path: ImageConstants.accountIcon,)
  ];
}
