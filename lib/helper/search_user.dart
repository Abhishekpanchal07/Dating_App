import 'package:demoapp/constants/Dimension_Constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchUser extends SearchDelegate<String> {
  List users;
  SearchUser(this.users);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      GestureDetector(
          child: const ImageView(
        path: ImageConstants.crossIcon,
      ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
      child:  ImageView(
        path: ImageConstants.leftArrowIcon,
        height: DimensionConstants.d20.h,
        width: DimensionConstants.d20.w,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
     return ListView.builder(
      itemCount: users.length,
      itemBuilder: ((context, index) {
      return users[index];
    }));
    // final suggestion = users.where((name) {
    //   return name.toLowerCase().contains(query.toLowerCase());
    // });
    // return ListView.builder(
    //     itemCount: suggestion.length,
    //     itemBuilder: (context, index) {
    //       return CommonWidgets.userchatCard();
    //     });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: ((context, index) {
      return users[index];
    }));
    // final suggestion = users.where((name) {
    //   return name.toLowerCase().contains(query.toLowerCase());
    // });
    // return ListView.builder(
    //   itemCount: suggestion.length,
    //   itemBuilder: (context, index) {
    //   return CommonWidgets.userchatCard();
    // });
  }
}
