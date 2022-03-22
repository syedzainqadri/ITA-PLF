import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PLF/ProgramDetailPage.dart';
import 'package:PLF/SplashScreen.dart';
import 'HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/HomePage': (context) => HomePage(),
        '/DetailPage': (context) => ProgramDetailPage(),
      },
    );
  }
}
