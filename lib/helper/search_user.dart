import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/helper/stop_scroll.dart';
import 'package:demoapp/views/one_to_one_chatscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchUser extends SearchDelegate {
  List users;
  SearchUser(this.users);
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
      child: ListView.builder(
          itemCount: query.isEmpty ? users.length : matchedItem.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: DimensionConstants.d10.h),
              child: query.isEmpty
                  ? GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteConstants.oneToOneScreen,
                            arguments: OneToOneChatScreen(
                                userName: users[index].name,
                                userImagePath:
                                    users[index].imagePathOfInboxScreen));
                      },
                      child: CommonWidgets.userchatCard(
                          imagepath: users[index].imagePathOfInboxScreen,
                          username: users[index].name,
                          userMessage: users[index].userMessage),
                    )
                  : GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteConstants.oneToOneScreen,
                            arguments: OneToOneChatScreen(
                                userName: matchedItem[index].name,
                                userImagePath:
                                    matchedItem[index].imagePathOfInboxScreen));
                      },
                      child: CommonWidgets.userchatCard(
                          imagepath: matchedItem[index].imagePathOfInboxScreen,
                          username: matchedItem[index].name,
                          userMessage: matchedItem[index].userMessage),
                    ),
            );
          })),
    );
  }
}
