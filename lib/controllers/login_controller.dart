import 'dart:convert';
import 'package:PLF/views/Home/HomePage.dart';
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
              "https://clfbooks.childrensliteraturefestival.com/wp-json/login-user/login?username=$userName&password=$password"),
        )
        .timeout(const Duration(seconds: 30));
    print(" response : ${detail.body}");
    if (detail.statusCode == 200) {
      final resposeData = jsonDecode(detail.body);
      Get.offAll(HomeNavbar());
    }
    isLoading(false).obs;
    print(' register api response is: ${detail.body}');
  }
}
