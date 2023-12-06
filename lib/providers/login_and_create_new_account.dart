import 'package:demoapp/api_modals/user_login.dart';
import 'package:demoapp/api_modals/user_signup.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/sharedperferences_constants.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/providers/base_provider.dart';
import 'package:demoapp/services/api.dart';
import 'package:demoapp/views/interest_screen.dart';
import 'package:flutter/material.dart';

class LoginAndcreateNewAccountProvider extends BaseProvider {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  UserLogIn? modal;
  UserSignup? modal2;
  bool changeVisibility = false;
  bool confirmPasswordbool = false;
   bool rememberMe = false;


  Future<void> hitLoginApi(
      BuildContext context, String? email, String? password) async {
    try {
      modal = await Api.login(email: email, password: password);
      if (modal!.success == true) {
        // store JWt Token
        SharedpreferenceKeys.prefs!.setString(
            SharedpreferenceKeys.jwtToken, modal!.jwtToken.toString());
        // Store login Successfully Message
        SharedpreferenceKeys.prefs!.setString(
            SharedpreferenceKeys.loginSuccessfully, modal!.message.toString());

        SharedpreferenceKeys.prefs!.setString(
            SharedpreferenceKeys.loginStatus, modal!.data!.status.toString());
        if (context.mounted) {
          CommonWidgets.showflushbar(context, modal!.message.toString());
          if (modal!.data!.status == 0) {
            Navigator.pushNamed(context, RouteConstants.profileDetaisScreen);
          } else if (modal!.data!.status == 1) {
            Navigator.pushNamed(context, RouteConstants.interestScreen,
                arguments: const InterestScreen(
                  userinterests: [],
                  isfromeditprofileScreen: false,
                ));
          } else if (modal!.data!.status == 2) {
            Navigator.pushNamed(context, RouteConstants.addPhotoScreen);
          } else if (modal!.data!.status == 3) {
            Navigator.pushNamed(context, RouteConstants.filterOptionScreen);
          } else if (modal!.data!.status == 4) {
            Navigator.pushNamed(context, RouteConstants.enableLocation);
          } else if (modal!.data!.status == 5) {
            Navigator.pushNamed(context, RouteConstants.bottonNavigationScreen);
          }
        }
      } else {
        if (context.mounted) {
          CommonWidgets.showflushbar(context, modal!.message.toString());
        }
      }
    } catch (e) {
      if (context.mounted) {
        CommonWidgets.showflushbar(context, e.toString());
      }
    }
    notifyListeners();
  }

  void changeboolValue() {
    changeVisibility = !changeVisibility;
    notifyListeners();
  }
   void changeconfirmboolValue() {
    confirmPasswordbool = !confirmPasswordbool;
    notifyListeners();
  }
   void changeremembermeboolValue() {
    rememberMe = !rememberMe;
    notifyListeners();
  }

  // create New Account
  Future<void> hitSignupApi(
    BuildContext context,
    String? email,
    String? password,
  ) async {
    try {
      modal2 = await Api.signUp(
        email: email,
        password: password,
      );

      if (modal2!.success == true) {
        SharedpreferenceKeys.prefs!.setString(
            SharedpreferenceKeys.userId, modal2!.data!.id.toString());
        SharedpreferenceKeys.prefs!.setString(
            SharedpreferenceKeys.jwtToken, modal2!.jwtToken.toString());
        // create Account
        SharedpreferenceKeys.prefs!.setString(
            SharedpreferenceKeys.createAccountSuccessfully,
            modal2!.message.toString());
        SharedpreferenceKeys.prefs!.setString(
            SharedpreferenceKeys.loginStatus, modal2!.data!.status.toString());
        if (context.mounted) {
          Navigator.pushNamed(context, RouteConstants.profileDetaisScreen);
        }
      } else {
        if (context.mounted) {
          CommonWidgets.showflushbar(context, modal2!.message.toString());
        }
      }
    } catch (e) {
      if (context.mounted) {
        CommonWidgets.showflushbar(context, e.toString());
      }
    }
    notifyListeners();
  }
}
