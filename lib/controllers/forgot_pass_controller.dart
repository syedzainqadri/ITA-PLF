import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordController extends GetxController {
  var isLoading = false.obs;
  var isDataReadingCompleted = false.obs;
  Map<String, dynamic> result;

  Future<Map<String, dynamic>> getMVisitId(String username) async {
    isLoading.value = true;
    final queryParameters = {'user_login': username};
    final uri = Uri.parse(
            "https://itapublications.pakistanlearningfestival.com/api/user/retrieve_password/")
        .replace(queryParameters: queryParameters);
    var response = await http.post(uri);
    if (response.statusCode == 200) {
      isLoading.value = false;
      var responseBody = jsonDecode(response.body);
      String message = responseBody['msg'];
      return result = {'status': true, 'message': message};
    } else {
      isLoading.value = false;
      return result = {'status': false};
    }
  }
}
