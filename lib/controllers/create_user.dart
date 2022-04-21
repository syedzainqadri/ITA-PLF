import 'dart:convert';
import 'dart:io';

import 'package:PLF/models/product.dart';
import 'package:PLF/network/api_service.dart';
import 'package:PLF/utils/url_paths.dart';
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
        "https://clfbooks.childrensliteraturefestival.com/api/get_nonce/?controller=user&method=register"));
    final responseNonce = jsonDecode(nonce.body.toString());
    var nonceString = responseNonce["nonce"];
    var data = {
      'username': userName,
      "email": email,
      "password": password,
      "nonce": nonceString
    };
    var detail = await http.post(
        Uri.parse(
            "https://clfbooks.childrensliteraturefestival.com/wp-json/wp/v2/users"),
        body: data,
        headers: {
          "X-WP-Nonce": nonceString
        }).timeout(const Duration(seconds: 30));
    print(' api response is: ${detail.body}');

    if (detail.body != null) {
      try {
        final resposeData = jsonDecode(detail.body);

        print(" user name is : ${resposeData["data"]["name"]} ");
        isLoading(false).obs;
        successSnackbar("${resposeData["message"]}");
        return resposeData;
      } catch (e) {
        isLoading(false).obs;
        var response = json.decode(detail.toString());

        if (response["success"] == false) {
        } else {}
      }
    } else {
      errorSnackbar("something went wrong");
      isLoading(false).obs;
    }
  }
}
