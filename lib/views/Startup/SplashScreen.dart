import 'dart:async';
import 'package:PLF/helper/shared_preferences/shared_preferences.dart';
import 'package:PLF/utils/ColorScheme.dart';
import 'package:PLF/views/Home/Widgets/home_navbar.dart';
import 'package:PLF/views/Startup/Onboarding.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Auth/LoginPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var token;
  getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = preferences.getString("user_id");
  }

  @override
  void initState() {
    super.initState();
    getToken();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>
                token != null ? HomeNavbar() : OnBoardingPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: vibrantBlue,
      body: Center(
        child: Container(
            height: 200,
            child: ClipRect(
                child: Image.asset(
              'asset/images/logo.png',
              height: 200,
            ))),
      ),
    );
  }
}
