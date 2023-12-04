import 'package:demoapp/constants/Image_Constants.dart';
import 'package:demoapp/constants/api_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/helper/stop_scroll.dart';
import 'package:demoapp/providers/getting_user_details.dart';
import 'package:demoapp/views/base_view.dart';
import 'package:demoapp/widgets/bottom_sheet.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserDetail extends StatefulWidget {
  final String? userOpponentId;

  const UserDetail({
    Key? key, required this.userOpponentId,
  }) : super(key: key);

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    return BaseView<GettingUserDetailsProvider>(
      onModelReady: (provider) async {
        await provider.matchedSingleUserDetail(context,opponentId: widget.userOpponentId);
      },
      builder: (context, provider, child) => Scaffold(
        body: provider.modal6 == null
            ? CommonWidgets.showProgressbar()
            : SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    ImageView(
                      path: ApiUrls.baseUrl + provider.matchedUserprofilepicurl,
                    ),
                    SizedBox(
                      height: DimensionConstants.d43.h,
                    ),
                    Positioned(
                        top: DimensionConstants.d52.h,
                        left: DimensionConstants.d20.w,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const ImageView(
                            path: ImageConstants.backwardIcon,
                          ),
                        )),
                    Positioned(
                      //top: DimensionConstants.d300.h,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ScrollConfiguration(
                          behavior: NoGlowScrollBehavior(),
                          child:  ShowBottomSheet(singleUserDetail: provider,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
