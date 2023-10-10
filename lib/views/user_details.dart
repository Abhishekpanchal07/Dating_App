import 'package:demoapp/constants/Image_Constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/widgets/bottom_sheet.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height:MediaQuery.of(context).size.height,
        child: Stack(
          children:  [
            const ImageView(path: ImageConstants.userDetailScreenGirlImage,),
            SizedBox(
              height: DimensionConstants.d43.h,
            ),
            Positioned(
              top: DimensionConstants.d52.h,
              left: DimensionConstants.d20.w,
              child: const ImageView(path: ImageConstants.backwardIcon,)),
               Positioned(
              top: DimensionConstants.d300.h,
             // child: const ShowBottomSheet(),
               child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child:const ShowBottomSheet() ,
                 ),
               //const ShowBottomSheet(),
               ),
             
          ],
        ),
      ),
    );
  }
 
}