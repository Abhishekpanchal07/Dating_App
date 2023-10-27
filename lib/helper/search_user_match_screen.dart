import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/helper/stop_scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchUserMatchScreeen extends SearchDelegate {
  List users;
  SearchUserMatchScreeen(this.users);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(
            Icons.clear,
            color: ColorConstant.black,
            size: DimensionConstants.d25,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: const Icon(
          Icons.arrow_back,
          color: ColorConstant.black,
          size: DimensionConstants.d25,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List matchedItem = users
        .where((element) =>
            element.name.toLowerCase().startsWith(query.toLowerCase()))
        .toList();

    return ScrollConfiguration(
      behavior: NoGlowScrollBehavior(),
      child: Container(
        padding: EdgeInsets.only(top: DimensionConstants.d20.h,left: DimensionConstants.d20.w,right: DimensionConstants.d20.w),
        child: GridView.builder(
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: DimensionConstants.d174.h,
                        childAspectRatio: DimensionConstants.d1,
                        mainAxisSpacing: DimensionConstants.d20.h,
                        crossAxisSpacing: DimensionConstants.d5.w,
                      ),
            itemCount: query.isEmpty ? users.length : matchedItem.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: DimensionConstants.d7.h,horizontal: DimensionConstants.d20.w),
                child: query.isEmpty
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteConstants.userDetailScreen,
                              
                                      );
                        },
                        child: CommonWidgets.imageContainer(
                          imageurl: users[index].imageUrl,
                          name: users[index].name,
                          age: users[index].age,
                        )
                      )
                    : GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteConstants.userDetailScreen,
                              
                                      );
                        },
                        child: CommonWidgets.imageContainer(
                          imageurl: matchedItem[index].imageUrl,
                          name: matchedItem[index].name,
                          age: matchedItem[index].age,
                      ),)
              );
            })),
      ),
    );
  }
}
