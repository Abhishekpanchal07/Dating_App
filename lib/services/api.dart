import 'dart:convert';
import 'dart:io';
import 'package:demoapp/api_modals/user_add_filters.dart';
import 'package:demoapp/api_modals/user_add_images.dart';
import 'package:demoapp/api_modals/user_details.dart';
import 'package:demoapp/api_modals/user_interest.dart';
import 'package:demoapp/api_modals/user_login.dart';
import 'package:demoapp/api_modals/user_signup.dart';
import 'package:demoapp/constants/api_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:dio/dio.dart';

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
  static Future<UserDetails> uploadUserDetails(
      {String? firstName,
      String? lastName,
      String? zodiacValue,
      String? userImagepath,
      String? tokenValue,
      String? userAbout,
      String? userDOB}) async {
    var formData = FormData.fromMap({
      "firstName": firstName,
      "lastName": lastName,
      "about": userAbout,
      "birthDate": userDOB,
      "zodiacValue": zodiacValue,
      "profileImage": await MultipartFile.fromFile(userImagepath!)
    });
    dio.options.headers["authorization"] = tokenValue;
    try {
      Response response =
          await dio.put(ApiUrls.userDetailApiUrl, data: formData);
      return UserDetails.fromJson(jsonDecode(response.toString()));
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
      {String? wantToMeet, String? hereTo,String? ageRange,String? language , String? tokenValue}) async {
    var map = {"hereTo":hereTo,
    "wantToMeet": wantToMeet,
    "ageRange": ageRange,
    "language":language};
    dio.options.headers["authorization"] = tokenValue;
    try {
      Response response = await dio.post(ApiUrls.addUserFiltersApiUrl, data: map);
      return AddFilters.fromJson(jsonDecode(response.toString()));
    } on DioException {
      throw const SocketException(StringConstants.socketExceptionErrorMessage);
    }
  }

}
