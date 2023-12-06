import 'dart:developer';
import 'package:demoapp/api_modals/delete_account.dart';
import 'package:demoapp/api_modals/get_detail_matched_user.dart';
import 'package:demoapp/api_modals/update_user_interests.dart';
import 'package:demoapp/api_modals/update_user_location.dart';
import 'package:demoapp/api_modals/update_user_single_image.dart';
import 'package:demoapp/api_modals/user_matchlist.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/sharedperferences_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/modals/matchscreen_images.dart';
import 'package:demoapp/providers/base_provider.dart';
import 'package:demoapp/services/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import '../api_modals/get_user_details.dart';

class GettingUserDetailsProvider extends BaseProvider {
  // variable for Storing Api Responses
  String userName = "";
  String matchedUserName = "";
  String matchedUserAbout = "";
  String matchedUserLocation = "";
  String matchedUserHororscope = "";
  String matchedUserimageUrl = "";
  String matchedUserid = "";
  String imageurlUserDetailsScreen = "";
  String matchedUserprofilepicurl = "";
  String matchedUserFirstName = "";
  String matchedUseropponentid = "";
  int? opponentDistance;
  int? userAge;
  int? matchedUserAge;
  String userEmail = "";
  String userhoroscope = "";
  String userBirthdate = "";
  String userAbout = "";
  String hereTo = "";
  double? longitude;
  double? modal4longitude;
  double? opponentUserLongitude;
  num? opponentUserLatitude;
  num? latitude;
  num? modal4latitude;
  String userCurrentLocation = "";
  String? userdob;
  String userabout = '';
  String? wantToMeet;
  String? prefferedAge;
  String? prefferedlanguage;
  String userGender = "";
  Position? exactLoaction;
  int? userCurrentIndex;
  // Lists for Storing Api Responses
  List<String> userInterest = [];
  List<String> matchedUserInterest = [];
  List<String> imagePaths = [];
  List<MatchScreenImages> matchedUserData = [];
  // List<String> userImages = [];
  List conatinerChildTextValue = [];
  // objects for getting  Api Responses
  GetUserDetails? modal;
  UpdateUserSingleImage? modal2;
  UpdateUserInterest? modal3;
  UpdateUserLocation? modal4;
  UserMatchList? modal5;
  GetSingleMatchedUserDetail? modal6;
  DeleteAccount? modal7;
  // controllers
  final userDOBController = TextEditingController();
  final useraboutController = TextEditingController();

  // Api Operations

  // getting user details
  // Future<void> hitUserById(BuildContext context) async {
  //   try {
  //     modal = await Api.userById(
  //         jwtToken: SharedpreferenceKeys.prefs!
  //             .getString(SharedpreferenceKeys.jwtToken));

  //     if (modal!.success == true) {
  //       DateTime currentDate = DateTime.now();
  //       DateTime userDob = modal!.data![0].birthDate.isNotEmpty
  //           ? DateTime.parse(modal!.data![0].birthDate)
  //           : DateTime.now();
  //       int currentAge = currentDate.year - userDob.year;
  //       userBirthdate = modal!.data![0].birthDate.isNotEmpty
  //           ? DateFormat('dd-MM-yyyy')
  //               .format(DateTime.parse(modal!.data![0].birthDate))
  //           : "";
  //       userName =
  //           ' ${modal!.data![0].firstName}${modal!.data![0].lastName},${currentAge.toString()}';
  //       // userAge = currentAge;
  //       userEmail = modal!.data![0].email;

  //       userAbout = modal!.data![0].about;

  //       // user interests
  //       conatinerChildTextValue.clear();
  //       for (int i = 0; i < modal!.data![0].userInterst.length; i++) {
  //         conatinerChildTextValue
  //             .add(modal!.data![0].userInterst[i].intrestName);
  //       }

  //       modal2 == null ? addInterestWithoutClearList() : addInterest();

  //       // // user images
  //       // for (int i = 0; i < modal!.data![0].images[0].image.length; i++) {
  //       //   userImages.add(modal!.data![0].images[0].image[i]);
  //       // }

  //       // uploaded user images

  //       imagePaths.clear();
  //       modal2 != null ? addUserImages() : addUserImagesWithoutclear();

  //       // longitude
  //       longitude = modal!.data![0].location.isEmpty
  //           ? modal4longitude
  //           : modal!.data![0].location[0].longitude;
  //       // latitude
  //       latitude = modal!.data![0].location.isEmpty
  //           ? modal4latitude
  //           : modal!.data![0].location[0].latitude;
  //       // horoscope value
  //       userhoroscope = modal!.data![0].zodiac;
  //       // user gender Value
  //       userGender = modal!.data![0].gender;
  //       // here to
  //       hereTo = modal!.data![0].filter[0].hereTo;
  //       // want to meet
  //       wantToMeet = modal!.data![0].filter[0].wantToMeet;
  //       // preffered age
  //       prefferedAge = modal!.data![0].filter[0].ageRange;
  //       // preffered language
  //       prefferedlanguage = modal!.data![0].filter[0].language;
  //       // user dob
  //       // userBirthdate = modal!.data![0].birthDate.isNotEmpty
  //       //     ? DateFormat('dd-MM-yyyy')
  //       //         .format(DateTime.parse(modal!.data![0].birthDate))
  //       //     : "";
  //       // user About
  //       userAbout = modal!.data![0].about;

  //       notifyListeners();
  //     }
  //   } on DioException catch (e) {
  //     if (context.mounted) {
  //       CommonWidgets.showflushbar(context, e.toString());
  //     }
  //   }
  // }

  // get user location
  Future<void> getAddress() async {
    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(
          opponentUserLatitude == null
              ? latitude!.toDouble()
              : opponentUserLatitude!.toDouble(),
          opponentUserLongitude == null ? longitude! : opponentUserLongitude!);
      Placemark place = placeMarks[0];

      userCurrentLocation = "${place.locality},${place.country}";

      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> getUpdatedUserInterests() async {
    modal3 = await Api.updateUserInterests();
  }

  void hitgettinguserDetailApi(BuildContext context) async {
   // await hitUserById(context);
    await getAddress();
    notifyListeners();
  }

  // update user interests
  Future<void> updateuserpic(
    BuildContext context, {
    String? imageurl,
  }) async {
    modal2 = await Api.updateUserImages(userimages: imageurl);
    // ignore: use_build_context_synchronously
    await hituserUpdateProfileApi(context);

   // hitUserById(context);

    notifyListeners();
  }

  // check user is 18+ or not
  void checkUserIs18(
      DateTime? dobvalue, TextEditingController? dob, BuildContext context) {
    DateTime todaydate = DateTime.now();
    int age = todaydate.year - dobvalue!.year;
    if (age < 18) {
      CommonWidgets.showflushbar(context, StringConstants.dobErorrMessage);
    } else {
      dob!.text = DateFormat('dd-MM-yyyy').format(dobvalue);
    }
  }

  // hit user update profile Api
  Future<void> hituserUpdateProfileApi(BuildContext context,
      {String? horoscopeSelectedvalue,
      String? selectedFriendshipInterest,
      String? selectedGenderValue,
      String? selectedAge,
      String? selectedLanguage,
      String? genderValue}) async {
    try {
      final modal = await Api.updateUserDetails(
          userimages: imagePaths,
          tokenValue: SharedpreferenceKeys.prefs!
              .getString(SharedpreferenceKeys.jwtToken),
          userBirthDate: userDOBController.text.isEmpty
              ? userBirthdate
              : userDOBController.text,
          about: useraboutController.text.isEmpty
              ? userAbout
              : useraboutController.text,
          zodiac: horoscopeSelectedvalue ?? userhoroscope,
          hereto: selectedFriendshipInterest ?? hereTo,
          wantTomeet: selectedGenderValue ?? wantToMeet,
          agerange: selectedAge ?? prefferedAge,
          language: selectedLanguage ?? prefferedlanguage,
          genderValue: genderValue ?? userGender);
      if (modal.success == true) {}
      notifyListeners();
    } on DioException catch (e) {
      if (context.mounted) {
        CommonWidgets.showflushbar(context, e.toString());
      }
    }
  }

  void addUserImages() {
    imagePaths.add(modal2!.image);
    for (int i = 0; i < modal!.data![0].images[0].image.length; i++) {
      imagePaths.add(modal!.data![0].images[0].image[i]);
    }
  }

  void addUserImagesWithoutclear() {
    for (int i = 0; i < modal!.data![0].images[0].image.length; i++) {
      imagePaths.add(modal!.data![0].images[0].image[i]);
    }
  }

  void addInterest() {
    userInterest.clear();
    userInterest.add(StringConstants.add);

    for (int i = 0; i < modal!.data![0].userInterst.length; i++) {
      userInterest.insert(i, modal!.data![0].userInterst[i].intrestName);
    }
  }

  void addInterestWithoutClearList() {
    userInterest.clear();
    userInterest.add(StringConstants.add);
    for (int i = 0; i < modal!.data![0].userInterst.length; i++) {
      userInterest.insert(i, modal!.data![0].userInterst[i].intrestName);
    }
  }

  // get user exact location
  getCurrentLocation(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (context.mounted) {
        CommonWidgets.showflushbar(context, StringConstants.disableLocation);
      }
    }

    permission = (await Geolocator.checkPermission());
    if (permission == LocationPermission.denied) {
      permission = (await Geolocator.requestPermission());
      if (permission == LocationPermission.denied) {
        if (context.mounted) {
          CommonWidgets.showflushbar(context, StringConstants.deniedLocation);
        }
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (context.mounted) {
        CommonWidgets.showflushbar(
            context, StringConstants.permanentlyDeniedLocation);
      }
    }

    exactLoaction = await Geolocator.getCurrentPosition();
    notifyListeners();
  }

  Future<void> updateUserLocation(BuildContext context) async {
    await getCurrentLocation(context);
    modal4 = await Api.updateUserLocation(
        longitude: exactLoaction!.longitude,
        latitude: exactLoaction!.latitude.toDouble(),
        tokenValue: SharedpreferenceKeys.prefs!
            .getString(SharedpreferenceKeys.jwtToken));
    if (modal4!.success == true) {
      longitude = modal4!.data!.longitude;
      latitude = modal4!.data!.latitude;
    }
    notifyListeners();
  }

  // update user location
  Future<void> hitupdateuserlocationApi(BuildContext context) async {
    await updateUserLocation(context);

    if (context.mounted) {
      hitgettinguserDetailApi(context);
    }
    notifyListeners();
  }

  // user Match List
  Future<void> getMatchuser(BuildContext context) async {
    try {
      modal5 = await Api.userMatchList(
          tokenValue: SharedpreferenceKeys.prefs!
              .getString(SharedpreferenceKeys.jwtToken));
      if (modal5!.success == true) {
        matchedUserData.clear();
        matchedUserInterest.clear();

        for (int i = 0; i < modal5!.data!.length; i++) {
          DateTime currentyear = DateTime.now();
          DateTime userdob =
              DateTime.parse(modal5!.data![i].userDetails.birthDate);
          matchedUserAge = currentyear.year - userdob.year;
          for (int i = 0; i < modal5!.currentUserIntrests.length; i++) {
            matchedUserInterest.add(modal5!.currentUserIntrests[i].intrestName);
          }
          if (modal5!.data![i].userId != modal5!.data![i].userDetails.id) {
            matchedUseropponentid = modal5!.data![i].opponentId;
          } else {
            matchedUseropponentid = modal5!.data![i].userId;
          }

          matchedUserData.add(MatchScreenImages(
              horoscope: modal5!.data![i].userDetails.zodiac,
              about: modal5!.data![i].userDetails.about,
              name: modal5!.data![i].fullName,
              userinterests: matchedUserInterest,
              age: matchedUserAge.toString(),
              imageUrl: modal5!.data![i].userDetails.profileImage,
              matcheduserId: matchedUseropponentid));
        }

        /* matchedUserName = modal5!.data![0].fullName;
      matchedUserHororscope = modal5!.data![0].userDetails.zodiac;
      matchedUserAbout = modal5!.data![0].userDetails.about;

      matchedUserimageUrl = modal5!.data![0].userDetails.profileImage; */
      }
      notifyListeners();
    } on DioException catch (e) {
      if (context.mounted) {
        CommonWidgets.showflushbar(context, e.toString());
      }
    }
  }

  Future<void> matchedSingleUserDetail(BuildContext context,
      {String? opponentId}) async {
    try {
      modal6 = await Api.getDetailMatchedUser(
          tokenValue: SharedpreferenceKeys.prefs!
              .getString(SharedpreferenceKeys.jwtToken),
          userId: opponentId);
      if (modal6!.success == true) {
        DateTime currentyear = DateTime.now();
        DateTime userdob = DateTime.parse(modal6!.data[0].birthDate);
        matchedUserAge = currentyear.year - userdob.year;
        for (int i = 0; i < modal6!.data[0].userIntrests.length; i++) {
          matchedUserInterest.add(modal6!.data[0].userIntrests[i].intrestName);
        }
        matchedUserHororscope = modal6!.data[0].zodiac;
        matchedUserprofilepicurl = modal6!.data[0].profileImage;
        matchedUserAbout = modal6!.data[0].about;
        matchedUserName =
            "${modal6!.data[0].firstName} ${modal6!.data[0].lastName},$matchedUserAge";
        matchedUserFirstName =
            "${modal6!.data[0].firstName} ${modal6!.data[0].lastName}";
      }
      opponentUserLongitude = modal6!.data[0].userLocation[0].longitude;
      opponentUserLatitude = modal6!.data[0].userLocation[0].latitude;
      await getAddress();
      double opponentdistance = Geolocator.distanceBetween(
          double.parse(SharedpreferenceKeys.prefs!
              .getString(SharedpreferenceKeys.myLatitude)!),
          double.parse(SharedpreferenceKeys.prefs!
              .getString(SharedpreferenceKeys.myLongitude)!),
          opponentUserLatitude!.toDouble(),
          opponentUserLongitude!);
      opponentDistance = (opponentdistance * 1000).toInt();
      log(opponentDistance.toString());

      notifyListeners();
    } on DioException catch (e) {
      if (context.mounted) {
        CommonWidgets.showflushbar(context, e.toString());
      }
    }
  }

  Future<void> deleteAccount(BuildContext context) async {
    try {
      modal7 = await Api.deleteAccount(
          tokenvalue: SharedpreferenceKeys.prefs!
              .getString(SharedpreferenceKeys.jwtToken));
      if (modal7!.success == true) {
        if (context.mounted) {
          CommonWidgets.showflushbar(context, modal7!.message.toString());
          Navigator.pushReplacementNamed(context, RouteConstants.splashPage);
        }
      }
    } on DioException catch (e) {
      if (context.mounted) {
        CommonWidgets.showflushbar(context, e.toString());
      }
    }
  }
}
