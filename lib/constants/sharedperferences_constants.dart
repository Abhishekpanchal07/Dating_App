import 'package:shared_preferences/shared_preferences.dart';

class SharedpreferenceKeys {
  static const jwtToken = "JWTTOKEN";
  static const userId = "USERID";
  static const forgetPasswordEmailId = "emailid";
  static const verificationSuccessfully = "verification Successfully";
  static const createAccountSuccessfully = "createAccount Successfully";
  static const loginSuccessfully = "login Successfully";
  static const passwordUpdatedSuccessfully = "password Updated Successfully";
  static const profileUpdatedSuccessfully = "profile Updated Successfully";
  static const interestUpdatedSuccessfully = "interest Updated Successfully";
  static const picUpdatedSuccessfully = "pic Updated Successfully";
  static const filterUpdatedSuccessfully = "filter Updated Successfully";
  static const enablelocationSuccessfully = "enable location Successfully";
  static const logtitudeValue = "longitude";
   static const latitudeValue = "lontitude";
   static SharedPreferences? prefs;
   static const userUpdatedInterestlist = "user Updated Interest list";
}
