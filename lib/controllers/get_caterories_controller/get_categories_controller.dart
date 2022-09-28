import 'dart:convert';
import 'dart:io';

import 'package:PLF/models/product.dart';
import 'package:PLF/network/api_service.dart';
import 'package:PLF/utils/url_paths.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  var categoriesList = {}.obs;

  var isLoading = true.obs;
  var isListNull = false.obs;

  getCategoriesList() async {
    isLoading(true).obs;
    isListNull(false).obs;
    var detail = await APIService().getRequest(apiName: basUrl + getCategories, isJson: false);
    print(' api response is: ${detail}');

    if (detail != null) {
      try {
        final resposeData = jsonDecode(detail);
        print('api responce now: $resposeData');

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
