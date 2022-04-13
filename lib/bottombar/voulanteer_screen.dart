

import 'package:flutter/material.dart';

class VolunteerScreen extends StatefulWidget {
  const VolunteerScreen({Key key}) : super(key: key);

  @override
  State<VolunteerScreen> createState() => _VolunteerScreenState();
}

class _VolunteerScreenState extends State<VolunteerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Volunteer"),),
    );
  }
}
