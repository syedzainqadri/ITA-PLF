import 'dart:convert';
import 'package:PLF/helper/shared_preferences/shared_preferences.dart';
import 'package:PLF/views/Home/Widgets/home_navbar.dart';
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
      "Content-Type": "application/json",
      "Authorization":
          "Basic Y2tfNTQyNDFkODc1NjY2OTY1ODZlY2Q1NGIxZWQ3MmE3YzY5ZWIwN2Y4Njpjc19kN2RkMzFlZGJiMDEyNWZjMWM5ZTU0ZTk2YTY3MzFiNWQ5NmY3Nzg4",
      "consumer_secret": "cs_d7dd31edbb0125fc1c9e54e96a6731b5d96f7788",
      "consumer_key": "ck_54241d87566696586ecd54b1ed72a7c69eb07f86"
    };
    print('sending headers: $headers');
    var data = {
      'username': userName,
      "email": email,
      "password": password,
    };
    print(" sending data is: $data");

    try {
      var detail = await http
          .post(
              Uri.parse(
                  "https://clfbooks.childrensliteraturefestival.com/wp-json/wc/v3/customers"),
              body: jsonEncode(data),
              headers: headers)
          .timeout(const Duration(seconds: 30));

      final resposeData = jsonDecode(detail.body);
      print("register response is: ${resposeData}");
      MyHelper.saveLoginDetails(
          email: email, name: userName, userId: resposeData["id"]);
      isLoading(false).obs;
      Get.offAll(HomeNavbar());

      print(' register api response is: ${detail.body}');
    } catch (e) {
      print(" $e");
      isLoading(false);
    }
  }
}
