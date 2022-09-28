import 'dart:convert';
import 'dart:io';

import 'package:PLF/models/product.dart';
import 'package:PLF/network/api_service.dart';
import 'package:PLF/utils/url_paths.dart';
import 'package:get/get.dart';

class PaymentMethodController extends GetxController {
  var paymentMethodsRespo = {}.obs;

  var isLoading = true.obs;
  var isListNull = false.obs;

  getMethods() async {
    isLoading(true).obs;

    var detail = await APIService().getRequest(apiName: getAllMethods, isJson: false);
    print(' api response is: ${detail}');
    // if(debugMode)print(detail);
    if (detail != null) {
      try {
        final resposeData = jsonDecode(detail);
        print("json data is: $resposeData");
        // productsResponse.value = resposeData;
        isLoading(false).obs;

        return resposeData;
      } catch (e) {
        isLoading(false).obs;
        isListNull(true).obs;
        var response = json.decode(detail.toString());

        if (response["success"] == false) {
        } else {}
      }
    } else {
      isLoading(false).obs;
      isListNull(true).obs;
//        errorSnackbar("Something went wrong, try again");
    }
  }
}
