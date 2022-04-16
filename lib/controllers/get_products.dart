import 'dart:convert';

import 'package:get/get.dart';
import 'package:woocommerce/woocommerce.dart';

final url = 'https://clfbooks.childrensliteraturefestival.com/wp-json/wc/v3';

class BookController extends GetxController {
  var isLoading = true.obs;
  var isListNull = false.obs;
  // var categoriesList = CategoriesModel().obs;

  /// get all categories function
  getProducts() async {
    WooCommerce woocommerce = WooCommerce(
        baseUrl: url,
        // isDebug: true,
        consumerKey: "ck_54241d87566696586ecd54b1ed72a7c69eb07f86",
        consumerSecret: "cs_d7dd31edbb0125fc1c9e54e96a6731b5d96f7788");
    List<WooProduct> products = await woocommerce.getProducts();
    print("api called");
    print(products.toString());
    // final myFeaturedProducts = await woocommerce.getProducts(featured: true);
    //
    //
    // final mySpecificProduct = await getProducts(category: '22');
    isLoading(true).obs;
    // var r;
    // final data = jsonEncode(r);
    // if (r == null) {
    //   isListNull(true).obs;
    //   isLoading(false).obs;
    // } else {
    //   isLoading(false).obs;
    //   // categoriesList.value = categoriesModelFromJson(data);
    // }
  }
}
