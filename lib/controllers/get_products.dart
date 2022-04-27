import 'dart:convert';
import 'dart:io';

import 'package:PLF/models/product.dart';
import 'package:PLF/network/api_service.dart';
import 'package:PLF/utils/url_paths.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  var productsList = {}.obs;

  var isLoading = true.obs;
  var isListNull = false.obs;

  var apiUrl = getProducts.obs;
  updateApiUrl(val) {
    apiUrl(val).obs;
  }

  getProduct() async {
    isLoading(true).obs;
    //
    print(" api url is: ${apiUrl.value}");
    var detail = await APIService().getRequest(
        apiName:
            "https://clfbooks.childrensliteraturefestival.com/wp-json/wc/v3/${apiUrl.value}",
        isJson: false);
    print(' api response is: ${detail.runtimeType}');

    if (detail != null) {
      try {
        final resposeData = jsonDecode(detail);
        print(" product name is : ${resposeData[0]["name"]} ");
        isLoading(false).obs;
        return resposeData;
      } catch (e) {
        isListNull(true).obs;
        isLoading(false).obs;
      }
    } else {
      isListNull(true).obs;
      isLoading(false).obs;
    }
  }
}
