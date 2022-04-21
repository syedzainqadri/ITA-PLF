import 'dart:convert';
import 'dart:io';

import 'package:PLF/models/product.dart';
import 'package:PLF/network/api_service.dart';
import 'package:PLF/utils/url_paths.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  var productsResponse = {}.obs;

  var isLoading = true.obs;
  var isListNull = false.obs;

  getProduct() async {
    isLoading(true).obs;

    var detail =
        await APIService().getRequest(apiName: getProducts, isJson: false);
    print(' api response is: ${detail.runtimeType}');
    // if(debugMode)print(detail);
    if (detail != null) {
      try {
        final resposeData = jsonDecode(detail);
        // print("json data is: $resposeData");
        // productsResponse.value = resposeData;
        print(" product name is : ${resposeData[0]["name"]} ");
        isLoading(false).obs;

        return resposeData;
        if (productsResponse.value[0]["name"] == null) {
          print(" data is null "
              "");
          //successSnackbarReplace(0,registerResp.value.error.toString());
          isListNull(true).obs;
        }
        isLoading(false).obs;
      } catch (e) {
        isLoading(false).obs;
        isListNull(true).obs;
        var response = json.decode(detail.toString());
        // if(response["data"]==[]){
        //   isListNull(true).obs;
        // }
        if (response["success"] == false) {
          // errorSnackbar(response["error"]);
        } else {
          // errorSnackbar("Something went wrong, Try again".tr);
        }
      }
    } else {
      isLoading(false).obs;
      isListNull(true).obs;
//        errorSnackbar("Something went wrong, try again");
    }
  }
}