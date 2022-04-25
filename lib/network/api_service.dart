import 'dart:convert';
import 'dart:io';

import 'package:PLF/utils/url_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

final Map<String, String> headers = {
  'consumer_secret': 'cs_d7dd31edbb0125fc1c9e54e96a6731b5d96f7788',
  "Content-Type": "application/json",
  "token":
      "niazm1|1651937068|PdaLr2pvfgHgk0jNguntVFeK9JhUjiKJdRmRvF7DngT|59eb5364b655ccd4d709d064b088e150bb2304d455029a99a370f3596800da9e"
};
String consumer_key = 'ck_54241d87566696586ecd54b1ed72a7c69eb07f86';
String consumer_secret = 'cs_d7dd31edbb0125fc1c9e54e96a6731b5d96f7788';

class APIService {
  static var client = http.Client();

  Future<dynamic> postRequest(
      {String apiName,
      bool isJson,
      Map<String, dynamic> mapData,
      bool isAuth}) async {
    var response = await client
        .post(
            isAuth
                ? Uri.parse(
                    "https://clfbooks.childrensliteraturefestival.com/wp-json/wp/v2/users")
                : Uri.parse(basUrl + apiName),
            body: isJson ? json.encode(mapData) : mapData,
            headers: headers)
        .timeout(const Duration(seconds: 30));
    try {
      // var connectivityResult = await (Connectivity().checkConnectivity());
      // if (connectivityResult != ConnectivityResult.mobile &&
      //     connectivityResult != ConnectivityResult.wifi) {
      //   // errorSnackbar("no internet connection, please connect to internet".tr);
      //   return null;
      // }

      print("response body; " + response.body);
      var statusCode = response.statusCode;
      switch (statusCode) {
        case HttpStatus.ok:
          var jsonString = response.body;
          debugPrint(jsonString, wrapWidth: 1024);
          return jsonString;
          break;
        case HttpStatus.gatewayTimeout:
          // errorSnackbar("No response from server, Try again".tr);
          return null;
          break;
        default:
          // errorSnackbar("Something went wrong, Try again".tr);
          return null;
          break;
      }
    } catch (e) {
      print(e);
      // errorSnackbar("Something went wrong, Try again".tr);
      return null;
    }
  }

  Future<String> getRequest({String apiName, bool isJson}) async {
    try {
      final Map<String, String> headers = {
        'consumer_key': 'ck_54241d87566696586ecd54b1ed72a7c69eb07f86',
        'consumer_secret': 'cs_d7dd31edbb0125fc1c9e54e96a6731b5d96f7788',
        'Authorization':
            'Basic Y2tfNTQyNDFkODc1NjY2OTY1ODZlY2Q1NGIxZWQ3MmE3YzY5ZWIwN2Y4Njpjc19kN2RkMzFlZGJiMDEyNWZjMWM5ZTU0ZTk2YTY3MzFiNWQ5NmY3Nzg4'
      };
      print(" calling api");
      var response = await client
          .get(
              Uri.parse(
                  "https://clfbooks.childrensliteraturefestival.com/wp-json/wc/v3/products?per_page=100&stock_status=instock&status=publish"),
              headers: headers)
          .timeout(const Duration(seconds: 30));

      // if(debugMode)print(response.body);
      print(" response body is: ${response.body}");
      var statusCode = response.statusCode;
      switch (statusCode) {
        case HttpStatus.ok:
          var jsonString = response.body;
          // if (debugMode) debugPrint(jsonString, wrapWidth: 1024);
          return jsonString;
          break;
        case HttpStatus.gatewayTimeout:
          // errorSnackbar("No response from server, Try again".tr);
          return null;
          break;
        case HttpStatus.noContent:
          // errorSnackbar("No Data Found, Try Again".tr);
          return null;
          break;
        default:
          // errorSnackbar("Something went wrong, Try again".tr);
          return null;
          break;
      }
    } catch (e) {
      print(e);
      // errorSnackbar("Something went wrong, Try again".tr);
      return null;
    }
  }
}
