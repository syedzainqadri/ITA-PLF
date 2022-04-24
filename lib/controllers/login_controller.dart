import 'dart:convert';
import 'dart:io';

import 'package:PLF/helper/shared_preferences/shared_preferences.dart';
import 'package:PLF/models/product.dart';
import 'package:PLF/network/api_service.dart';
import 'package:PLF/utils/url_paths.dart';
import 'package:PLF/views/Home/Widgets/home_navbar.dart';
import 'package:PLF/views/Startup/Onboarding.dart';
import 'package:PLF/widgets/custom_snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var isListNull = false.obs;

  login({email, password}) async {
    isLoading(true).obs;

    var data = {
      "user_login": email,
      "user_password": password,
    };
    var detail = await http
        .post(
          Uri.parse(
              "https://clfbooks.childrensliteraturefestival.com/api/user/login/?user_login=$email&user_password=$password"),
        )
        .timeout(const Duration(seconds: 30));

    var tokenResponse = await http
        .post(
          Uri.parse(
              "https://clfbooks.childrensliteraturefestival.com/wp-json/jwt-auth/v1/token?username=$email&password=$password"),
        )
        .timeout(const Duration(seconds: 30));
    print(' login api response is: ${detail.body}');
    print(' token api response is: ${tokenResponse.body}');

    if (detail.body != null && !tokenResponse.body.contains("code")) {
      try {
        final loginResponseData = jsonDecode(detail.body);
        final tokenResponseData = jsonDecode(tokenResponse.body);
        if (loginResponseData["status"] == "error") {
          errorSnackbar(loginResponseData["error"]);
          isLoading(false).obs;
        } else {
          print(" user token is : ${loginResponseData["cookie"]} ");
          MyHelper.saveTokens(
              loginToken: loginResponseData["cookie"].toString(),
              authToken: tokenResponseData["cookie"].toString());

          isLoading(false).obs;
          Get.offAll(HomeNavbar());
        }

        return loginResponseData;
      } catch (e) {
        isLoading(false).obs;
        errorSnackbar("something went wrong");
      }
    } else {
      isLoading(false).obs;
      errorSnackbar("something went wrong");
    }
  }
}
