import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PLF/ProgramDetailPage.dart';
import 'package:PLF/SplashScreen.dart';
import 'HomePage.dart';
import 'checkwebview.dart';

void main() {
  runApp(WebViewExample());
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
      },
    );
  }
}
