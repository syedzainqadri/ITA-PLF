import 'dart:convert';
import 'package:PLF/helper/shared_preferences/shared_preferences.dart';
import 'package:PLF/widgets/custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../views/Home/Widgets/home_navbar.dart';

class LoginController extends GetxController {
  var productsResponse = {}.obs;

  var isLoading = false.obs;
  var isListNull = false.obs;

  login({
    userName,
    password,
  }) async {
    isLoading(true).obs;
    var detail = await http
        .get(
          Uri.parse(
              "https://itapublications.pakistanlearningfestival.com/wp-json/login-user/login?username=$userName&password=$password"),
        )
        .timeout(const Duration(seconds: 30));

    print(" response : ${detail.statusCode}");
    if (detail.statusCode == 500) {
      isLoading(false).obs;
      errorSnackbar("invalid username or password");
    } else {
      final resposeData = jsonDecode(detail.body.toString());
      MyHelper.saveLoginDetails(
          email: resposeData["data"]["user_email"],
          name: resposeData["data"]["user_login"],
          userId: resposeData["data"]["ID"]);

      isLoading(false).obs;

      print(' register api response is: $resposeData');
      print(" user name is: ${resposeData["data"]["user_login"]}");
      Get.offAll(HomeNavbar());
    }
  }
}
