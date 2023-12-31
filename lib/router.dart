import 'package:demoapp/constants/Color_Constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/providers/getting_user_details.dart';
import 'package:demoapp/views/account_recovery.dart';
import 'package:demoapp/views/add_photo.dart';
import 'package:demoapp/views/create_new_account.dart';
import 'package:demoapp/views/bottom_navigationbar.dart';
import 'package:demoapp/views/create_new_password.dart';
import 'package:demoapp/views/edit_profile_screen.dart';
import 'package:demoapp/views/enable_location.dart';
import 'package:demoapp/views/filter_option.dart';
import 'package:demoapp/views/forward_password.dart';
import 'package:demoapp/views/homepage_bottom_navigation.dart';
import 'package:demoapp/views/inbox_screen.dart';
import 'package:demoapp/views/interest_screen.dart';
import 'package:demoapp/views/find_your_best_match.dart';
import 'package:demoapp/views/login_screen.dart';
import 'package:demoapp/views/matches.dart';
import 'package:demoapp/views/message_screen.dart';
import 'package:demoapp/views/notification_screen.dart';
import 'package:demoapp/views/otp_verification.dart';
import 'package:demoapp/views/profile_details.dart';
import 'package:demoapp/views/reset_password.dart';
import 'package:demoapp/views/one_to_one_chatscreen.dart';
import 'package:demoapp/views/send_message.dart';
import 'package:demoapp/views/sign_in_option_screen.dart';
import 'package:demoapp/views/sign_in_screen.dart';
import 'package:demoapp/views/signin_with_name_screen.dart';
import 'package:demoapp/views/splash_screen.dart';
import 'package:demoapp/views/user_account_screen.dart';
import 'package:demoapp/views/user_details.dart';
import 'package:demoapp/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';

class MyRoutes {
  static Route<dynamic> ongenerateroute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.splashPage:
        return MaterialPageRoute(builder: (_) => const FirstScreen());
      case RouteConstants.findYourMatchScreen:
        return MaterialPageRoute(
            builder: (_) => const FindYourBestMatchScreen());
      case RouteConstants.signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case RouteConstants.signInOptionScreen:
        return MaterialPageRoute(builder: (_) => const SignInOptionScreen());
      case RouteConstants.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteConstants.resetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case RouteConstants.createNewAccountScreen:
        return MaterialPageRoute(builder: (_) => const CreateNewAccount());
      case RouteConstants.profileDetaisScreen:
        return MaterialPageRoute(builder: (_) => const ProfileDetails());
      case RouteConstants.interestScreen:
        final args = settings.arguments as InterestScreen;
        return MaterialPageRoute(
            builder: (_) => InterestScreen(
                  isfromeditprofileScreen: args.isfromeditprofileScreen,
                  userinterests: args.userinterests ?? [],
                ));
      case RouteConstants.addPhotoScreen:
        return MaterialPageRoute(builder: (_) => const AddPhoto());
      case RouteConstants.filterOptionScreen:
        return MaterialPageRoute(builder: (_) => const FilterOption());
      case RouteConstants.enableLocation:
        return MaterialPageRoute(builder: (_) => const EnableLocation());
      case RouteConstants.bottonNavigationScreen:
        return MaterialPageRoute(
            builder: (_) => const BottomNavigationScreen());
      case RouteConstants.sendMessageScreen:
        final args = settings.arguments as SendMessageScreen;
        return MaterialPageRoute(builder: (_) =>  SendMessageScreen( opponentId:  args.opponentId,));
      case RouteConstants.signInWithNameScreen:
        return MaterialPageRoute(builder: (_) => SignInByName());
      case RouteConstants.matchScreen:
        return MaterialPageRoute(builder: (_) => const MatchScreen());
      case RouteConstants.userDetailScreen:
        final args = settings.arguments as String?;

        return MaterialPageRoute(
            builder: (_) => UserDetail(
                  userOpponentId: args,
                ));
      case RouteConstants.showBottomSheetScreen:
        final args = settings.arguments as GettingUserDetailsProvider;
        return MaterialPageRoute(
            builder: (_) => ShowBottomSheet(
                  singleUserDetail: args,
                ));
      case RouteConstants.messageScreen:
        final args = settings.arguments as GettingUserDetailsProvider;
        return MaterialPageRoute(
            builder: (_) => MessageScreen(
                  provider: args,
                ));
      case RouteConstants.inboxScreen:
        return MaterialPageRoute(builder: (_) => const InboxScreen());
      case RouteConstants.oneToOneScreen:
        final args = settings.arguments as OneToOneChatScreen;
        return MaterialPageRoute(
            builder: (_) => OneToOneChatScreen(
                  userName: args.userName,
                  userImagePath: args.userImagePath,
                ));
      case RouteConstants.userAccountScreen:
        return MaterialPageRoute(builder: (_) => const UserAccountScreen());
      case RouteConstants.editProfileScreen:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case RouteConstants.notificationScreen:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case RouteConstants.recoverAccountScreen:
        return MaterialPageRoute(builder: (_) => const AccountRecover());
      case RouteConstants.otpVerificationScreen:
        return MaterialPageRoute(builder: (_) => const OtpVerificationScreen());
      case RouteConstants.forwardPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForwardPassword());
      case RouteConstants.createNewPasswordScreen:
        return MaterialPageRoute(
            builder: (_) => const CreateNewPasswordScreen());
      case RouteConstants.homepageScreenBottomNavigation:
        return MaterialPageRoute(
            builder: (_) => const HomePageBottomNavigationScreen());
    }
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              body: const Text("no page found").semiBold(
                  ColorConstant.headingcolor,
                  TextAlign.center,
                  DimensionConstants.d10),
            ));
  }
}
