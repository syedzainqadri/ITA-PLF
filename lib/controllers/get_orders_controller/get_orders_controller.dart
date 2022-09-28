import 'dart:convert';
import 'dart:io';

import 'package:PLF/models/product.dart';
import 'package:PLF/network/api_service.dart';
import 'package:PLF/utils/url_paths.dart';
import 'package:get/get.dart';

class GetOrdersController extends GetxController {
  var orderList = {}.obs;

  var isLoading = true.obs;
  var isListNull = false.obs;

  getOrders() async {
    isLoading(true).obs;

    var detail =
        await APIService().getRequest(apiName: makeOrder, isJson: false);
    print(' orders response is: ${detail}');

    if (detail != null) {
      try {
        final resposeData = jsonDecode(detail);
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
