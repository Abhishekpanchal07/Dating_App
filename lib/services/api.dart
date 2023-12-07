import 'dart:convert';
import 'dart:io';
import 'package:demoapp/api_modals/delete_account.dart';
import 'package:demoapp/api_modals/get_detail_matched_user.dart';
import 'package:demoapp/api_modals/get_user_details.dart';
import 'package:demoapp/api_modals/swipe_left.dart';
import 'package:demoapp/api_modals/swipe_right.dart';
import 'package:demoapp/api_modals/update_user_interests.dart';
import 'package:demoapp/api_modals/update_user_profile.dart';
import 'package:demoapp/api_modals/update_user_single_image.dart';
import 'package:demoapp/api_modals/user_add_filters.dart';
import 'package:demoapp/api_modals/user_add_images.dart';
import 'package:demoapp/api_modals/user_create_new_password.dart';
import 'package:demoapp/api_modals/user_details.dart';
import 'package:demoapp/api_modals/user_forget_password.dart';
import 'package:demoapp/api_modals/user_interest.dart';
import 'package:demoapp/api_modals/user_listing.dart';
import 'package:demoapp/api_modals/user_login.dart';
import 'package:demoapp/api_modals/user_resend_otp.dart';
import 'package:demoapp/api_modals/user_signup.dart';
import 'package:demoapp/api_modals/user_verify_otp.dart';
import 'package:demoapp/constants/api_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/api_modals/user_location.dart';
import 'package:dio/dio.dart';

import '../api_modals/update_user_location.dart';
import '../api_modals/user_matchlist.dart';

class Api {
  static Dio dio = Dio();
  // signup
  static Future<UserSignup> signUp(
      {String? email, String? password, String? deviceToken}) async {
    var map = {
      "email": email,
      "password": password,
      "deviceToken": deviceToken
    };
    try {
      Response response = await dio.post(ApiUrls.signUpApiUrl, data: map);
      return UserSignup.fromJson(jsonDecode(response.toString()));
    } on DioException {
      throw const SocketException(StringConstants.socketExceptionErrorMessage);
    }
  }

  // login
  static Future<UserLogIn> login({String? email, String? password}) async {
    var map = {
      "email": email,
      "password": password,
    };
    try {
      Response response = await dio.post(ApiUrls.loginApiUrl, data: map);
      return UserLogIn.fromJson(jsonDecode(response.toString()));
    } on DioException {
      throw const SocketException(StringConstants.socketExceptionErrorMessage);
    }
  }

  // upload  user details
  static Future<UserDetail> uploadUserDetails(
      {String? firstName,
      String? lastName,
      String? zodiacValue,
      String? userImagepath,
      String? tokenValue,
      String? userAbout,
      String? userDOB,
      String? userGender}) async {
    var formData = FormData.fromMap({
      "firstName": firstName,
      "lastName": lastName,
      "about": userAbout,
      "birthDate": userDOB,
      "zodiac": zodiacValue,
      "profileImage": await MultipartFile.fromFile(userImagepath!),
      "gender": userGender
    });
    dio.options.headers["authorization"] = tokenValue;
    try {
      Response response =
          await dio.put(ApiUrls.userDetailApiUrl, data: formData);
      return UserDetail.fromJson(jsonDecode(response.toString()));
    } on DioException {
      throw const SocketException(StringConstants.socketExceptionErrorMessage);
    }
  }

  // Add user Interests
  static Future<UserInterest> addUserInterest(
      {List? userInterest, String? tokenValue}) async {
    var map = {"likes": userInterest};
    dio.options.headers["authorization"] = tokenValue;
    try {
      Response response = await dio.post(ApiUrls.useInterestApiUrl, data: map);
      return UserInterest.fromJson(jsonDecode(response.toString()));
    } on DioException {
      throw const SocketException(StringConstants.socketExceptionErrorMessage);
    }
  }

  // Add user images
  static Future<AddPhotos> addUserImages(
      {List? imagepath, String? tokenValue, String? userId}) async {
    List? userSelectedImageList = [];
    for (int i = 0; i < imagepath!.length; i++) {
      userSelectedImageList.add(await MultipartFile.fromFile(imagepath[i]));
    }
    var formData = FormData.fromMap({
      "image": userSelectedImageList,
      "userId": userId,
    });
    dio.options.headers["authorization"] = tokenValue;
    try {
      Response response =
          await dio.post(ApiUrls.addUserImagesApiUrl, data: formData);
      return AddPhotos.fromJson(jsonDecode(response.toString()));
    } on DioException {
      throw const SocketException(StringConstants.socketExceptionErrorMessage);
    }
  }

  // Add user filters
  static Future<AddFilters> addUserFilters(
      {String? wantToMeet,
      String? hereTo,
      String? ageRange,
      String? language,
      String? tokenValue}) async {
    var map = {
      "hereTo": hereTo,
      "wantToMeet": wantToMeet,
      "ageRange": ageRange,
      "language": language
    };
    dio.options.headers["authorization"] = tokenValue;
    try {
      Response response =
          await dio.post(ApiUrls.addUserFiltersApiUrl, data: map);
      return AddFilters.fromJson(jsonDecode(response.toString()));
    } on DioException {
      throw const SocketException(StringConstants.socketExceptionErrorMessage);
    }
  }

// user location
  static Future<GetUserLocation> userLocation(
      {String? longitude, String? latitude, String? tokenValue}) async {
    var map = {"longitude": longitude, "latitude": latitude};
    dio.options.headers["authorization"] = tokenValue;
    try {
      Response response = await dio.post(ApiUrls.userLocationApiUrl, data: map);
      return GetUserLocation.fromJson(jsonDecode(response.toString()));
    } on DioException {
      throw const SocketException(StringConstants.socketExceptionErrorMessage);
    }
  }

  // forget password
  static Future<ForgetPassword> forgetPassword(
      {String? email, String? tokenValue}) async {
    dio.options.headers["authorization"] = tokenValue;
    var map = {"email": email};
    try {
      Response response =
          await dio.post(ApiUrls.userforgetPasswordApiUrl, data: map);
      return ForgetPassword.fromJson(jsonDecode(response.toString()));
    } on DioException {
      throw const SocketException(StringConstants.socketExceptionErrorMessage);
    }
  }

  // verify OTP
  static Future<VerifyOTP> verifyOTP(
      {String? email, String? tokenValue, int? otp}) async {
    dio.options.headers["authorization"] = tokenValue;
    var map = {"email": email, "forgotOTP": otp};
    try {
      Response response = await dio.post(ApiUrls.verifyotpApiUrl, data: map);
      return VerifyOTP.fromJson(jsonDecode(response.toString()));
    } on DioException {
      throw const SocketException(StringConstants.socketExceptionErrorMessage);
    }
  }

  // resend otp
  static Future<ResendOTP> resendOTP({
    String? email,
    String? tokenValue,
  }) async {
    dio.options.headers["authorization"] = tokenValue;
    var map = {
      "email": email,
    };
    try {
      Response response = await dio.post(ApiUrls.resendotpApiUrl, data: map);
      return ResendOTP.fromJson(jsonDecode(response.toString()));
    } on DioException {
      throw const SocketException(StringConstants.socketExceptionErrorMessage);
    }
  }

  // user Create New Password
  static Future<CreateNewPassword> createNewPassword({
    String? email,
    String? password,
    String? tokenValue,
  }) async {
    var map = {
      "email": email,
      "password": password,
    };
    dio.options.headers["authorization"] = tokenValue;
    try {
      Response response = await dio.put(ApiUrls.createNewpassApiUrl, data: map);
      return CreateNewPassword.fromJson(jsonDecode(response.toString()));
    } on DioException {
      throw const SocketException(StringConstants.socketExceptionErrorMessage);
    }
  }

  // get users for like and dislike
  static Future<UserListing> userlisting({String? jwtToken}) async {
    dio.options.headers["Authorization"] = jwtToken;
    try {
      Response response = await dio.get(ApiUrls.userListingApiUrl);
      return UserListing.fromJson(jsonDecode(response.toString()));
    } on DioException {
      throw const SocketException(StringConstants.socketExceptionErrorMessage);
    }
  }

  // getting  user details
  static Future<GetUserDetails> userById({String? jwtToken}) async {
    dio.options.headers["Authorization"] = jwtToken;
    try {
      Response response = await dio.get(ApiUrls.getUserdetailsApiUrl);
      return GetUserDetails.fromJson(jsonDecode(response.toString()));
    } on DioException {
      throw const SocketException(StringConstants.socketExceptionErrorMessage);
    }
  }

  // update user profile

  static Future<UpdateUserProfile> updateUserDetails({
    String? userBirthDate,
    String? genderValue,
    String? tokenValue,
    String? zodiac,
    String? hereto,
    String? wantTomeet,
    String? agerange,
    String? language,
    String? about,
    List? userimages,
  }) async {
    var map = {
      "image": userimages,
      "birthDate": userBirthDate,
      "gender": genderValue,
      "zodiac": zodiac,
      "hereTo": hereto,
      "wantToMeet": wantTomeet,
      "ageRange": agerange,
      "language": language,
      "about": about,
      "status": 5
    };
    dio.options.headers["authorization"] = tokenValue;
    try {
      Response response =
          await dio.put(ApiUrls.updateUserProfileApiUrl, data: map);
      return UpdateUserProfile.fromJson(jsonDecode(response.toString()));
    } on DioException {
      throw const SocketException(StringConstants.socketExceptionErrorMessage);
    }
  }

  // update user images
  static Future<UpdateUserSingleImage> updateUserImages(
      {String? userimages}) async {
    var map = FormData.fromMap({
      "image": await MultipartFile.fromFile(userimages.toString()),
    });

    try {
      Response response =
          await dio.post(ApiUrls.updateUserImageApiUrl, data: map);
      return UpdateUserSingleImage.fromJson(jsonDecode(response.toString()));
    } on DioException {
      throw const SocketException(StringConstants.socketExceptionErrorMessage);
    }
  }

  // update user interests
  static Future<UpdateUserInterest> updateUserInterests(
      {List? userinterests}) async {
    var map = {
      "likes": userinterests,
    };

    try {
      Response response =
          await dio.put(ApiUrls.updateUserInterestsApiUrl, data: map);
      return UpdateUserInterest.fromJson(jsonDecode(response.toString()));
    } on DioException {
      throw const SocketException(StringConstants.socketExceptionErrorMessage);
    }
  }

  // update user location
  static Future<UpdateUserLocation> updateUserLocation(
      {double? longitude, double? latitude, String? tokenValue}) async {
    var map = {"longitude": longitude, "latitude": latitude};
    dio.options.headers["authorization"] = tokenValue;
    try {
      Response response =
          await dio.put(ApiUrls.updateUserLocationApiUrl, data: map);
      return UpdateUserLocation.fromJson(jsonDecode(response.toString()));
    } on DioException {
      throw const SocketException(StringConstants.socketExceptionErrorMessage);
    }
  }

  // Swipe left
  static Future<SwipeLeft> swipeleft(
      {String? opponentId, String? tokenValue}) async {
    var map = {"opponentId": opponentId};
    dio.options.headers["authorization"] = tokenValue;
    try {
      Response response = await dio.post(ApiUrls.swipeLeftApiUrl, data: map);
      return SwipeLeft.fromJson(jsonDecode(response.toString()));
    } on DioException {
      throw const SocketException(StringConstants.socketExceptionErrorMessage);
    }
  }

  // swipe Right
  static Future<SwipeRight> swipeRight(
      {String? opponentId, String? tokenValue}) async {
    var map = {"opponentId": opponentId};
    dio.options.headers["authorization"] = tokenValue;
    try {
      Response response = await dio.post(ApiUrls.swipeRightApiUrl, data: map);
      return SwipeRight.fromJson(jsonDecode(response.toString()));
    } on DioException {
      throw const SocketException(StringConstants.socketExceptionErrorMessage);
    }
  }

  // user Match list
  static Future<UserMatchList> userMatchList({String? tokenValue}) async {
    dio.options.headers["authorization"] = tokenValue;
    try {
      Response response = await dio.post(
        ApiUrls.userMatchListApiUrl,
      );
      return UserMatchList.fromJson(jsonDecode(response.toString()));
    } on DioException {
      throw const SocketException(StringConstants.socketExceptionErrorMessage);
    }
  }

  // get details of matched user
  static Future<GetSingleMatchedUserDetail> getDetailMatchedUser(
      {String? tokenValue, String? userId}) async {
    dio.options.headers["authorization"] = tokenValue;
    try {
      Response response = await dio.get(
        ApiUrls.getDetailsSingleMatchedApiUrl + userId!,
      );
      return GetSingleMatchedUserDetail.fromJson(
          jsonDecode(response.toString()));
    } on DioException {
      throw const SocketException(StringConstants.socketExceptionErrorMessage);
    }
  }

  // Delete Account
  static Future<DeleteAccount> deleteAccount({String? tokenvalue}) async {
    dio.options.headers["authorization"] = tokenvalue;
    try {
      Response response = await dio.delete(ApiUrls.deleteAccountApiUrl);
      return DeleteAccount.fromJson(jsonDecode(response.toString()));
    } on DioException {
      throw const SocketException(StringConstants.socketExceptionErrorMessage);
    }
  }
}
