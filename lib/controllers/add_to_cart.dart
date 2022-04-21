import 'dart:convert';
import 'dart:io';

import 'package:PLF/models/product.dart';
import 'package:PLF/network/api_service.dart';
import 'package:PLF/utils/url_paths.dart';
import 'package:get/get.dart';
import 'package:woocommerce/woocommerce.dart';

class AddToCart extends GetxController {
  var isLoading = false.obs;
  var isListNull = false.obs;
  String consumer_key = 'ck_54241d87566696586ecd54b1ed72a7c69eb07f86';
  String consumer_secret = 'cs_d7dd31edbb0125fc1c9e54e96a6731b5d96f7788';
  addToCart({itemId, quantity}) async {
    print("in side");
    WooCommerce woocommerce = WooCommerce(
        baseUrl: basUrl,
        consumerKey: consumer_key,
        consumerSecret: consumer_secret);
    isLoading(true).obs;

    var detail =
        await woocommerce.addToMyCart(itemId: itemId, quantity: quantity);
    print(' api response is: ${detail.price}');

    if (detail != null) {
      try {
        // final resposeData = jsonDecode(detail.name);

        // print(" product name is : ${resposeData[0]["name"]} ");
        isLoading(false).obs;
        return detail;
      } catch (e) {
        isLoading(false).obs;
        return false;
      }
    } else {
      isLoading(false).obs;
      return false;
    }
  }
}
