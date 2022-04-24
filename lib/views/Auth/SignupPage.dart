// ignore_for_file: missing_return

import 'package:PLF/controllers/create_user.dart';
import 'package:PLF/controllers/events_controller.dart';
import 'package:PLF/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PLF/utils/ColorScheme.dart';
import 'package:PLF/views/Auth/LoginPage.dart';
import 'package:PLF/views/Startup/Onboarding.dart';
import 'package:loading_overlay/loading_overlay.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool notAnITAStudent = false;
  var registerController = Get.put(RegisterController());
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  void _onNotAnITAStudentChanged(bool newValue) => setState(() {
        notAnITAStudent = newValue;

        if (notAnITAStudent) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return LoadingOverlay(
          isLoading: registerController.isLoading.value,
          progressIndicator: Center(
            child: CircularProgressIndicator(),
          ),
          opacity: 0.3,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                color: backgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                      child: ClipRect(
                        child: Container(
                            height: 100,
                            child: Image.asset('asset/images/logo.png')),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                controller: emailController,
                                // ignore: missing_return
                                validator: (val) {
                                  if (val.isEmpty || val == null) {
                                    return " email required";
                                  }
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    filled: true,
                                    hintStyle:
                                        TextStyle(color: Colors.grey[800]),
                                    hintText: "Email",
                                    fillColor: white),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                // ignore: missing_return
                                validator: (val) {
                                  if (val.isEmpty || val == null) {
                                    return " password not valid";
                                  }
                                },
                                controller: firstNameController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    filled: true,
                                    hintStyle:
                                        TextStyle(color: Colors.grey[800]),
                                    hintText: "first name",
                                    fillColor: white),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                validator: (val) {
                                  if (val.isEmpty || val == null) {
                                    return " field not valid";
                                  }
                                },
                                controller: lastNameController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    filled: true,
                                    hintStyle:
                                        TextStyle(color: Colors.grey[800]),
                                    hintText: "last name",
                                    fillColor: white),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: TextFormField(
                                validator: (val) {
                                  if (val.isEmpty ||
                                      val == null ||
                                      val.length < 6) {
                                    return " password not valid";
                                  }
                                },
                                controller: passwordController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    filled: true,
                                    hintStyle:
                                        TextStyle(color: Colors.grey[800]),
                                    hintText: "Password",
                                    fillColor: white),
                              ),
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   children: [
                            //     Padding(
                            //       padding: const EdgeInsets.only(left: 20.0),
                            //       child: Checkbox(
                            //         value: notAnITAStudent,
                            //         onChanged: _onNotAnITAStudentChanged,
                            //       ),
                            //     ),
                            //     Text('Not An ITA Student'),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //       right: 20.0, left: 20.0),
                            //   child: Container(
                            //     decoration: BoxDecoration(
                            //         color: white,
                            //         border: Border.all(width: 0.5),
                            //         borderRadius: BorderRadius.circular(10)),
                            //     height: 60,
                            //     child: Row(
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.spaceEvenly,
                            //       children: [
                            //         Icon(Icons.menu),
                            //         Text('Please select your District'),
                            //         DropdownButton<String>(
                            //           items: <String>[
                            //             'Lahore',
                            //             'Kasur',
                            //             'Shaikhupura',
                            //             'Lodhran'
                            //           ].map((String value) {
                            //             return DropdownMenuItem<String>(
                            //               value: value,
                            //               child: Text(value),
                            //             );
                            //           }).toList(),
                            //           onChanged: (_) {},
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //       right: 20.0, left: 20.0),
                            //   child: Container(
                            //     decoration: BoxDecoration(
                            //         color: white,
                            //         border: Border.all(width: 0.5),
                            //         borderRadius: BorderRadius.circular(10)),
                            //     height: 60,
                            //     child: Row(
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.spaceEvenly,
                            //       children: [
                            //         Icon(Icons.menu),
                            //         Text('Please select your School'),
                            //         DropdownButton<String>(
                            //           items: <String>[
                            //             'School Name 1',
                            //             'School Name 2',
                            //             'School Name 3',
                            //             'School Name 4'
                            //           ].map((String value) {
                            //             return DropdownMenuItem<String>(
                            //               value: value,
                            //               child: Text(value),
                            //             );
                            //           }).toList(),
                            //           onChanged: (_) {},
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
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
                                        backgroundColor:
                                            MaterialStateProperty.all(yellow),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
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
                                        backgroundColor:
                                            MaterialStateProperty.all(darkBlue),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          var model = UserModel(
                                              email: emailController.text,
                                              firstName:
                                                  firstNameController.text,
                                              lastName: lastNameController.text,
                                              password:
                                                  passwordController.text);
                                          registerController.createUser(
                                              email: emailController.text,
                                              userName: emailController.text,
                                              password:
                                                  passwordController.text);
                                        }
                                      },
                                      child: Text(
                                        'SignUp',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
