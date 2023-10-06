import 'package:demoapp/constants/Color_Constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/views/add_photo.dart';
import 'package:demoapp/views/create_new_account.dart';
import 'package:demoapp/views/bottom_navigationbar.dart';
import 'package:demoapp/views/enable_location.dart';
import 'package:demoapp/views/filter_option.dart';
import 'package:demoapp/views/interest_screen.dart';
import 'package:demoapp/views/find_your_best_match.dart';
import 'package:demoapp/views/login_screen.dart';
import 'package:demoapp/views/profile_details.dart';
import 'package:demoapp/views/reset_password.dart';
import 'package:demoapp/views/send_message.dart';
import 'package:demoapp/views/sign_in_option_screen.dart';
import 'package:demoapp/views/sign_in_screen.dart';
import 'package:demoapp/views/splash_screen.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  static Route<dynamic> ongenerateroute(RouteSettings settings) {
    switch(settings.name){
      case RouteConstants.splashPage:
      return MaterialPageRoute(builder: (_)=> const FirstScreen() );
       case RouteConstants.findYourMatchScreen:
      return MaterialPageRoute(builder: (_)=> const FindYourBestMatchScreen());
        case RouteConstants.signInScreen:
      return MaterialPageRoute(builder: (_)=> const SignInScreen());
       case RouteConstants.signInOptionScreen:
      return MaterialPageRoute(builder: (_)=> const SignInOptionScreen());
       case RouteConstants.loginScreen:
      return MaterialPageRoute(builder: (_)=> const LoginScreen());
       case RouteConstants.resetPasswordScreen:
      return MaterialPageRoute(builder: (_)=> const ResetPasswordScreen());
      case RouteConstants.createNewAccountScreen:
      return MaterialPageRoute(builder: (_)=> const CreateNewAccount());
      case RouteConstants.profileDetaisScreen:
      return MaterialPageRoute(builder: (_)=> const ProfileDetails());
      case RouteConstants.interestScreen:
      return MaterialPageRoute(builder: (_)=>  const InterestScreen());
      case RouteConstants.addPhotoScreen:
      return MaterialPageRoute(builder: (_)=>  const AddPhoto());
      case RouteConstants.filterOptionScreen:
      return MaterialPageRoute(builder: (_)=>  const FilterOption());
      case RouteConstants.enableLocation:
      return MaterialPageRoute(builder: (_)=>  const EnableLocation());
       case RouteConstants.bottonNavigationScreen:
      return MaterialPageRoute(builder: (_)=>  const BottomNavigationScreen());
       case RouteConstants.sendMessageScreen:
      return MaterialPageRoute(builder: (_)=>  const SendMessageScreen());
    }
    return MaterialPageRoute(builder: (_) => Scaffold(body: const Text("no page found").semiBold(ColorConstant.headingcolor, TextAlign.center, DimensionConstants.d10),));
  }
}
