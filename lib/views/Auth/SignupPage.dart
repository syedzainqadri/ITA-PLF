import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PLF/utils/ColorScheme.dart';
import 'package:PLF/views/Auth/LoginPage.dart';
import 'package:PLF/views/Startup/Onboarding.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool notAnITAStudent = false;

  void _onNotAnITAStudentChanged(bool newValue) => setState(() {
        notAnITAStudent = newValue;

        if (notAnITAStudent) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: lightBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRect(
              child: Container(
                  height: 200, child: Image.asset('asset/images/logo.png')),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Email",
                      fillColor: Colors.white70),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Password",
                      fillColor: Colors.white70),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Checkbox(
                      value: notAnITAStudent,
                      onChanged: _onNotAnITAStudentChanged,
                    ),
                  ),
                  Text('Not An ITA Student'),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20)),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.menu),
                      Text('Please select your District'),
                      DropdownButton<String>(
                        items: <String>[
                          'Lahore',
                          'Kasur',
                          'Shaikhupura',
                          'Lodhran'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20)),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.menu),
                      Text('Please select your School'),
                      DropdownButton<String>(
                        items: <String>[
                          'School Name 1',
                          'School Name 2',
                          'School Name 3',
                          'School Name 4'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(yellow),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Get.to(LoginPage());
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(darkBlue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Get.to(OnBoardingPage());
                        },
                        child: Text(
                          'SignUp',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ],
        ),
      ),
    );
  }
}
