import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/constants/sharedperferences_constants.dart';
import 'package:demoapp/locator.dart';
import 'package:demoapp/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedpreferenceKeys.prefs = await SharedPreferences.getInstance();
  setLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: MyRoutes.ongenerateroute,
          // home: FindYourBestMatchScreen(),
          initialRoute: SharedpreferenceKeys.prefs!
                      .getString(SharedpreferenceKeys.jwtToken) ==
                  null
              ? RouteConstants.splashPage
              : RouteConstants.bottonNavigationScreen,
        );
      },
    );
  }
}
