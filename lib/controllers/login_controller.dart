// import 'dart:convert';
// import 'dart:io';
//
// import 'package:PLF/helper/shared_preferences/shared_preferences.dart';
// import 'package:PLF/models/product.dart';
// import 'package:PLF/network/api_service.dart';
// import 'package:PLF/utils/url_paths.dart';
// import 'package:PLF/views/Home/Widgets/home_navbar.dart';
// import 'package:PLF/views/Startup/Onboarding.dart';
// import 'package:PLF/widgets/custom_snackbar.dart';
// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';
//
// class LoginController extends GetxController {
//   var isLoading = false.obs;
//   var isListNull = false.obs;
//
//   login({email, password}) async {
//     isLoading(true).obs;
//
//     var data = {
//       "user_login": email,
//       "user_password": password,
//     };
//     var detail = await http
//         .post(
//           Uri.parse(
//               "https://clfbooks.childrensliteraturefestival.com/api/user/login/?user_login=$email&user_password=$password"),
//         )
//         .timeout(const Duration(seconds: 30));
//
//     var tokenResponse = await http
//         .post(
//           Uri.parse(
//               "https://clfbooks.childrensliteraturefestival.com/wp-json/jwt-auth/v1/token?username=$email&password=$password"),
//         )
//         .timeout(const Duration(seconds: 30));
//     print(' login api response is: ${detail.body}');
//     print(' token api response is: ${tokenResponse.body}');
//
//     if (detail.body != null && !tokenResponse.body.contains("code")) {
//       try {
//         final loginResponseData = jsonDecode(detail.body);
//         final tokenResponseData = jsonDecode(tokenResponse.body);
//         if (loginResponseData["status"] == "error") {
//           errorSnackbar(loginResponseData["error"]);
//           isLoading(false).obs;
//         } else {
//           print(" user token is : ${loginResponseData["cookie"]} ");
//           MyHelper.saveTokens(
//               loginToken: loginResponseData["cookie"].toString(),
//               authToken: tokenResponseData["cookie"].toString());
//
//           isLoading(false).obs;
//           Get.offAll(HomeNavbar());
//         }
//
//         return loginResponseData;
//       } catch (e) {
//         isLoading(false).obs;
//         errorSnackbar("something went wrong");
//       }
//     } else {
//       isLoading(false).obs;
//       errorSnackbar("something went wrong");
//     }
//   }
// }

import 'dart:convert';

import 'package:PLF/helper/shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  var productsResponse = {}.obs;

  var isLoading = false.obs;
  var isListNull = false.obs;

  login({
    userName,
    password,
  }) async {
    isLoading(true).obs;

    // var nonce = await http.get(Uri.parse(
    //     "https://clfbooks.childrensliteraturefestival.com/api/get_nonce/?json=get_nonce&controller=user&method=register"));
    // final responseNonce = jsonDecode(nonce.body.toString());
    // var nonceString = responseNonce["nonce"];
    // print(" nonce is :$nonceString");
    // var headers = {
    //   "Content-Type": "application/json",
    //   "Authorization":
    //   "Basic Y2tfNTQyNDFkODc1NjY2OTY1ODZlY2Q1NGIxZWQ3MmE3YzY5ZWIwN2Y4Njpjc19kN2RkMzFlZGJiMDEyNWZjMWM5ZTU0ZTk2YTY3MzFiNWQ5NmY3Nzg4",
    //   "consumer_secret": "cs_d7dd31edbb0125fc1c9e54e96a6731b5d96f7788",
    //   "consumer_key": "ck_54241d87566696586ecd54b1ed72a7c69eb07f86"
    // // };
    // print('sending headers: $headers');
    var data = {
      'username': userName,
      "password": password,
    };
    print(" sending data is: $data");
    var detail = await http
        .post(
          Uri.parse("https://clfbooks.childrensliteraturefestival.com/login"),
          body: jsonEncode(data),
          // headers: headers
        )
        .timeout(const Duration(seconds: 30));
    print(" response : ${detail.body}");
    if (detail.statusCode == 200) {
      final resposeData = jsonDecode(detail.body);
      // MyHelper.saveLoginDetails(
      //     email: email,
      //     name: userName,
      //     userId: resposeData["id"]);
    }
    isLoading(false).obs;
    print(' register api response is: ${detail.body}');
  }
}
