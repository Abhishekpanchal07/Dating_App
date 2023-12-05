import 'package:demoapp/api_modals/user_listing.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/sharedperferences_constants.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/modals/homepage_data.dart';
import 'package:demoapp/providers/base_provider.dart';
import 'package:demoapp/services/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class HomePageProvider extends BaseProvider {
  UserListing? modal;
  List<HomepageDetailsOfUser> userDetails = [];
  List opponentId = [];
  int? usercurrentindex;

  // get user listing
  Future<void> hitUserListingApi(BuildContext context) async {
    try {
      modal = await Api.userlisting(
          jwtToken: SharedpreferenceKeys.prefs!
              .getString(SharedpreferenceKeys.jwtToken));

      if (modal!.success == true) {
        for (int i = 0; i < modal!.data!.length; i++) {
          if (modal!.data![i].status == 5) {
            DateTime currentDate = DateTime.now();
            DateTime userDob = DateTime.parse(modal!.data![i].birthDate);
            int currentAge = currentDate.year - userDob.year;
            opponentId.add(modal!.data![i].id);

            userDetails.add(
              HomepageDetailsOfUser(
                  name:
                      '${modal!.data![i].firstName}${modal!.data![i].lastName},${currentAge.toString()}',
                  horoscopeValue: modal!.data![i].zodiac,
                  userImage: modal!.data![i].image[0].image,
                  opponentid: opponentId
                  //location: modal.data![i].userLocation
                  ),
            );
          }
        }
         SharedpreferenceKeys.prefs!.setBool(SharedpreferenceKeys.islogin, true);
        notifyListeners();
      }
    } on DioException catch (e) {
      if (context.mounted) {
        CommonWidgets.showflushbar(context, e.toString());
      }
    }
  }

  // swipe left Api
  Future<void> swipeLeft(BuildContext context, {String? useropponentid}) async {
    try {
      final model = await Api.swipeleft(
        tokenValue: SharedpreferenceKeys.prefs!
            .getString(SharedpreferenceKeys.jwtToken),
        opponentId: useropponentid,
      );
      if (model.success == true) {
        if (context.mounted) {
          CommonWidgets.showflushbar(context, model.message!);
        }
      }
    } on DioException catch (e) {
      if (context.mounted) {
        CommonWidgets.showflushbar(context, e.toString());
      }
    }
  }

  // swipe Right
  Future<void> swipeRight(BuildContext context,
      {String? useropponentid}) async {
    try {
      final model = await Api.swipeRight(
        tokenValue: SharedpreferenceKeys.prefs!
            .getString(SharedpreferenceKeys.jwtToken),
        opponentId: useropponentid,
      );
      if (model.success == true) {
        if (model.data!.matchRequestStatus == 1) {
           if (context.mounted) {
            Navigator.pushNamed(context, RouteConstants.sendMessageScreen);
         
        }
          
        }

        if (context.mounted) {
          CommonWidgets.showflushbar(context, model.message);
        }
      }
    } on DioException catch (e) {
      if (context.mounted) {
        CommonWidgets.showflushbar(context, e.toString());
      }
    }
  }
}
