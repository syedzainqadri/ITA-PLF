import 'dart:convert';
import 'dart:io';

import 'package:PLF/helper/shared_preferences/shared_preferences.dart';
import 'package:PLF/models/product.dart';
import 'package:PLF/network/api_service.dart';
import 'package:PLF/utils/url_paths.dart';
import 'package:PLF/views/Startup/Onboarding.dart';
import 'package:PLF/widgets/custom_snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var productsResponse = {}.obs;

  var isLoading = false.obs;
  var isListNull = false.obs;

  createUser({userName, email, password, district, school}) async {
    isLoading(true).obs;

    var nonce = await http.get(Uri.parse(
        "https://clfbooks.childrensliteraturefestival.com/api/get_nonce/?json=get_nonce&controller=user&method=register"));
    final responseNonce = jsonDecode(nonce.body.toString());
    var nonceString = responseNonce["nonce"];
    print(" nonce is :$nonceString");
    var headers = {
      "Content-Type": "application/x-www-form-urlencoded",
      "Content-Length": "84",
      "Host": "https://clfbooks.childrensliteraturefestival.com",
      "Authorization":
          "Basic Y2tfNTQyNDFkODc1NjY2OTY1ODZlY2Q1NGIxZWQ3MmE3YzY5ZWIwN2Y4Njpjc19kN2RkMzFlZGJiMDEyNWZjMWM5ZTU0ZTk2YTY3MzFiNWQ5NmY3Nzg4"
      // "User-Agent": "",
      // "Accept": "",
      // "Accept-Encoding": "",
      // "Connection":"",
      ,
      "consumer_secret": "cs_d7dd31edbb0125fc1c9e54e96a6731b5d96f7788",
      "consumer_key": "ck_54241d87566696586ecd54b1ed72a7c69eb07f86"
    };
    var data = {
      'username': userName,
      "email": email,
      "password": password,
      // "oauth_nonce": nonceString,
      // "oauth_signature": "lh1LnRHcE2nY1Ze2Q16JQJDTLC0="
    };
    print(" sending data is: $data");
    var detail = await http
        .post(
            Uri.parse(
                "https://clfbooks.childrensliteraturefestival.com/wp-json/wc/v3/customers"),
            body: jsonEncode(data),
            // headers: {
            //   "X-WP-Nonce": nonceString
            // }
            headers: headers)
        .timeout(const Duration(seconds: 30));
    // var tokenResponse = await http
    //     .post(
    //       Uri.parse(
    //           "https://clfbooks.childrensliteraturefestival.com/wp-json/jwt-auth/v1/token?username=$userName&password=$password"),
    //     )
    //     .timeout(const Duration(seconds: 30));
    print(' register api response is: ${detail.body}');
    // print(' token api response is: ${tokenResponse.body}');

    // if (detail.body != null && !tokenResponse.body.contains("code")) {
    //   try {
    //     final registerResponseData = jsonDecode(detail.body);
    //     final tokenResponseData = jsonDecode(tokenResponse.body);
    //     if (registerResponseData["status"] == "error") {
    //       errorSnackbar(registerResponseData["error"]);
    //       isLoading(false).obs;
    //     } else {
    //       print(" user token is : ${registerResponseData["cookie"]} ");
    //
    //       MyHelper.saveTokens(
    //           loginToken: registerResponseData["cookie"].toString(),
    //           authToken: tokenResponseData["cookie"].toString());
    //       // MyHelper.saveLoginDetails(
    //       //     token: resposeData["cookie"],
    //       //     email: email,
    //       //     name: userName,
    //       //     userId: resposeData["user_id"]);
    //
    //       isLoading(false).obs;
    //       Get.offAll(OnBoardingPage());
    //     }
    //
    //     return registerResponseData;
    //   } catch (e) {
    //     isLoading(false).obs;
    //     errorSnackbar("something went wrong");
    //   }
    // } else {
    //   errorSnackbar("something went wrong");
    //   isLoading(false).obs;
    // }
  }
}
