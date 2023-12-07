import 'package:demoapp/constants/color_constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/string_constants.dart';
import 'package:demoapp/extension/all_extension.dart';
import 'package:demoapp/helper/common_widget.dart';
import 'package:demoapp/providers/login_and_create_new_account.dart';
import 'package:demoapp/views/base_view.dart';
import 'package:demoapp/widgets/image_picker._type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // bool isobsecure = false;
  // bool ischeckbox = false;
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   setState(() {
  //     isobsecure = !isobsecure;
  //     ischeckbox = !ischeckbox;
  //   });
  //   //getValues();
  // }

  // String? passupadated;

  // void getValues() async {
  //   SharedPreferences getsavedValues = await SharedPreferences.getInstance();
  //   passupadated = getsavedValues
  //       .getString(SharedpreferenceKeys.passwordUpdatedSuccessfully);
  //   if (mounted) {
  //     CommonWidgets.showflushbar(context, passupadated ?? "");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BaseView<LoginAndcreateNewAccountProvider>(
        builder: (context, provider, child) => Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(
                  top: DimensionConstants.d43.h,
                  left: DimensionConstants.d20.w,
                  right: DimensionConstants.d20.w),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                    ColorConstant.bggradientcolor1,
                    ColorConstant.bggradientcolor2
                  ])),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const ImageView(
                          path: ImageConstants.leftArrowIcon,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: DimensionConstants.d88.h,
                    ),
                    Image.asset(
                      ImageConstants.signInScreenImage,
                      width: DimensionConstants.d193.w,
                      height: DimensionConstants.d87.h,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: const Text(StringConstants.loginScreenWelcomeText)
                          .regularText(ColorConstant.headingcolor,
                              TextAlign.center, DimensionConstants.d24.sp),
                    ),
                    SizedBox(
                      height: DimensionConstants.d8.h,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: const Text(StringConstants.loginScreenSignInText)
                          .regularText(ColorConstant.grey, TextAlign.center,
                              DimensionConstants.d16.sp),
                    ),
                    SizedBox(
                      height: DimensionConstants.d23.h,
                    ),
                    CommonWidgets.gradientTextField(
                      context,
                      controllerName: emailController,
                      textFieldHintText: StringConstants.emailText,
                    ),
                    SizedBox(
                      height: DimensionConstants.d21.h,
                    ),
                    aminatedTextField(provider),
                    SizedBox(
                      height: DimensionConstants.d25.h,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(DimensionConstants.d10),
                          child: GestureDetector(
                              onTap: () {
                                provider.changeremembermeboolValue();
                                // setState(() {
                                //   ischeckbox = !ischeckbox;
                                // });
                              },
                              child: provider.rememberMe
                                  ? CommonWidgets.getsvgpicture(
                                      ImageConstants.markedCheckbox)
                                  : CommonWidgets.getsvgpicture(
                                      ImageConstants.checkBox)),
                        ),
                        SizedBox(
                          width: DimensionConstants.d5.w,
                        ),
                        const Text(StringConstants.loginScreenRememberMe)
                            .regularText(ColorConstant.pink, TextAlign.center,
                                DimensionConstants.d16.sp)
                      ],
                    ),
                    SizedBox(
                      height: DimensionConstants.d25.h,
                    ),
                    GestureDetector(
                        onTap: () {
                          loginScreenVerification(
                              emailController: emailController,
                              passwordController: passwordController,
                              provider: provider);
                        },
                        child: CommonWidgets.commonButton(
                            StringConstants.signInText)),
                    SizedBox(
                      height: DimensionConstants.d30.h,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, RouteConstants.resetPasswordScreen),
                      child: const Text(StringConstants.forgetPasswordText)
                          .regularText(ColorConstant.pink, TextAlign.center,
                              DimensionConstants.d14.sp),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget aminatedTextField(LoginAndcreateNewAccountProvider provider) {
    return Container(
      width: DimensionConstants.d374.w,
      height: DimensionConstants.d60.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DimensionConstants.d10.w),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                ColorConstant.buttongradientcolor1,
                ColorConstant.bottongradientcolor2,
              ])),
      child: Container(
        width: DimensionConstants.d370.w,
        height: DimensionConstants.d55.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DimensionConstants.d9.w),
          color: ColorConstant.buttonbgcolor,
        ),
        child: TextFormField(
          style: const TextStyle(
              color: ColorConstant.headingcolor,
              fontFamily: StringConstants.familyName),
          controller: passwordController,
          obscureText: provider.changeVisibility,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: StringConstants.passwordText,
              hintStyle: TextStyle(
                  fontFamily: StringConstants.familyName,
                  fontSize: DimensionConstants.d16.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorConstant.grey),
              contentPadding: EdgeInsets.symmetric(
                horizontal: DimensionConstants.d15.w,
                vertical: DimensionConstants.d14.h,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                     provider.changeboolValue();
                    // setState(() {
                    //   isobsecure = !isobsecure;
                    // });
                  },
                  icon: provider.changeVisibility
                      ? Padding(
                          padding: const EdgeInsets.all(DimensionConstants.d5),
                          child: Padding(
                            padding:
                                const EdgeInsets.all(DimensionConstants.d0),
                            child: SvgPicture.asset(
                                ImageConstants.passwordHideIcon),
                          ),
                        )
                      : SvgPicture.asset(ImageConstants.showPasswordIcon))),
        ),
      ),
    );
  }

  void loginScreenVerification(
      {TextEditingController? emailController,
      TextEditingController? passwordController,
      LoginAndcreateNewAccountProvider? provider}) {
    if (emailController!.text.isEmpty) {
      CommonWidgets.showflushbar(context, StringConstants.unFillEmailText);
    } else if (!RegExp(StringConstants.emailVerificationText)
        .hasMatch(emailController.text)) {
      CommonWidgets.showflushbar(context, StringConstants.emailErrorText);
    } else if (passwordController!.text.isEmpty) {
      CommonWidgets.showflushbar(context, StringConstants.unFillPasswordText);
    } else if (passwordController.text.length < 8) {
      CommonWidgets.showflushbar(
          context, StringConstants.passwordLengthErrorText);
    } else if (!RegExp(StringConstants.passwordVerificationText)
        .hasMatch(passwordController.text)) {
      CommonWidgets.showflushbar(context, StringConstants.passwordErrorText);
    } else {
      provider!
          .hitLoginApi(context, emailController.text, passwordController.text);
    }
  }

  // hit login Api
  // Future<void> hitLoginApi(String? email, String? password) async {
  //   try {
  //     final model = await Api.login(email: email, password: password);
  //     SharedPreferences getToken = await SharedPreferences.getInstance();
  //     //  store message login successfully
  //     getToken.setString(SharedpreferenceKeys.loginSuccessfully, model.message);
  //     // JWT Token Value
  //     getToken.setString(
  //         SharedpreferenceKeys.jwtToken, model.jwtToken.toString());

  //     if (model.success == true) {
  //        SharedpreferenceKeys.prefs!.setString(
  //           SharedpreferenceKeys.loginStatus,
  //           model.data!.status.toString());
  //       if (mounted) {
  //         CommonWidgets.showflushbar(context, model.message.toString());
  //         if (model.data!.status == 0) {
  //           Navigator.pushNamed(context, RouteConstants.profileDetaisScreen);
  //         } else if (model.data!.status == 1) {
  //           Navigator.pushNamed(context, RouteConstants.interestScreen ,arguments: const InterestScreen(userinterests: [],isfromeditprofileScreen: false,));
  //         } else if (model.data!.status == 2) {
  //           Navigator.pushNamed(context, RouteConstants.addPhotoScreen);
  //         } else if (model.data!.status == 3) {
  //           Navigator.pushNamed(context, RouteConstants.filterOptionScreen);
  //         } else if (model.data!.status == 4) {
  //           Navigator.pushNamed(context, RouteConstants.enableLocation);
  //         } else if (model.data!.status == 5) {
  //           Navigator.pushNamed(context, RouteConstants.bottonNavigationScreen);
  //         }
  //       }
  //     } else {
  //       if (mounted) {
  //         CommonWidgets.showflushbar(context, model.message.toString());
  //       }
  //     }
  //   }  catch (e) {
  //     if (mounted) {
  //       CommonWidgets.showflushbar(context, e.toString());
  //     }
  //   }
  // }
}
