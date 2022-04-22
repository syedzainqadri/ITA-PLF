import 'dart:async';
import 'package:PLF/utils/ColorScheme.dart';
import 'package:flutter/material.dart';
import '../Auth/LoginPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: vibrantBlue,
      body: Center(
        child: Container(
            height: 400,
            child: ClipRect(child: Image.asset('asset/images/logo.png'))),
      ),
    );
  }
}
