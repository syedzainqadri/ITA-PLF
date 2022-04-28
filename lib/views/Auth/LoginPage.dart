import 'package:PLF/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:PLF/utils/ColorScheme.dart';
import 'package:PLF/views/Auth/SignupPage.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../controllers/forgot_pass_controller.dart';
import '../../utils/helpers.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);
  var loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  ForgotPasswordController forgotPassController =
      Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: vibrantAmber,
      body: Obx(() {
        return LoadingOverlay(
          opacity: 0.3,
          progressIndicator: CircularProgressIndicator(),
          isLoading: loginController.isLoading.value,
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20.0, bottom: 20),
                              child: ClipRect(
                                child: Container(
                                    height: 100,
                                    child:
                                        Image.asset('asset/images/logo.png')),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 20),
                              child: TextFormField(
                                controller: emailController,
                                // ignore: missing_return
                                validator: (val) {
                                  if (val.isEmpty || val == null) {
                                    return " field required";
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
                                controller: passwordController,
                                // ignore: missing_return
                                validator: (val) {
                                  if (val.isEmpty || val == null) {
                                    return 'field required';
                                  }
                                },
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
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(onTap: () async {
                                    String message;
                                    if (emailController.text.isNotEmpty) {
                                      await forgotPassController
                                          .getMVisitId(
                                              emailController.text.trim())
                                          .then((response) => {
                                                if (response['status'] == true)
                                                  {
                                                    message =
                                                        response['message'],
                                                    successToast(
                                                        "Hurrah", message),
                                                  }
                                                else
                                                  {
                                                    errorToast("Error",
                                                        "Failed to request Password"),
                                                  }
                                              });
                                    } else {
                                      errorToast("Error",
                                          "Please Enter Username/email First");
                                    }
                                  }, child: Obx(() {
                                    return forgotPassController.isLoading.isTrue
                                        ? CircularProgressIndicator()
                                        : Text(
                                            'Forgot Password?',
                                            style: TextStyle(
                                                color: black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal),
                                          );
                                  })),
                                ],
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
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                vibrantGreen),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.to(SignupPage());
                                      },
                                      child: Text(
                                        'Sign Up',
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
                                            MaterialStateProperty.all(white),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        // Get.to(HomeNavbar());
                                        if (_formKey.currentState.validate()) {
                                          loginController.login(
                                              userName: emailController.text,
                                              password:
                                                  passwordController.text);
                                        }
                                      },
                                      child: Text(
                                        'Sign In',
                                        style: TextStyle(
                                            color: black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
