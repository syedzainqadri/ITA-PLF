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
        isDebug: true,
        consumerKey: "ck_8bea2a3583ea01e97e16eba0b2ba73228bbec6a1",
        consumerSecret: "cs_441648c8ac15c862be1df5d055a41c96ba130b87");
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
