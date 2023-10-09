import 'package:demoapp/constants/route_constants.dart';
import 'package:demoapp/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() {
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
        return const MaterialApp(
          
          debugShowCheckedModeBanner: false,
          onGenerateRoute: MyRoutes.ongenerateroute,
          // home: FindYourBestMatchScreen(),
          initialRoute: RouteConstants.userDetailScreen,
        );
      },
    );
  }
}
