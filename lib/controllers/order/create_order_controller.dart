import 'dart:convert';
import 'dart:io';

import 'package:PLF/controllers/add_to_cart/add_to_cart.dart';
import 'package:PLF/models/product.dart';
import 'package:PLF/network/api_service.dart';
import 'package:PLF/utils/url_paths.dart';
import 'package:PLF/views/Home/Widgets/home_navbar.dart';
import 'package:PLF/views/order_success_screen/order_success_screen.dart';
import 'package:http/http.dart' as http;
import 'package:PLF/widgets/custom_snackbar.dart';
import 'package:get/get.dart';

class LineItem {
  final product_id;
  final quantity;

  LineItem(this.product_id, this.quantity);
}

class CreateOrderController extends GetxController {
  var cartController = Get.put(CartController());
  var productsResponse = {}.obs;

  var isLoading = false.obs;
  var isListNull = false.obs;

  createOrder({
    firstName,
    lastName,
    address1,
    address2,
    city,
    state,
    postCode,
    country,
    email,
    phone,
    district,
    total,
    methodTitle,
    methodId,
    paymentMethodTitle,
    products,
  }) async {
    isLoading(true).obs;
    print("id: ${products[0]["product_id"]}");
    var data = {
      "payment_method": methodId,
      "payment_method_title": paymentMethodTitle,
      "set_paid": true,
      "billing": {
        "first_name": firstName,
        "last_name": lastName,
        "address_1": address1,
        "address_2": address2,
        "city": city,
        "state": state,
        "postcode": postCode,
        "country": country,
        "email": "niazm1225@gmail.com",
        "phone": phone
      },
      "shipping": {
        "first_name": firstName,
        "last_name": lastName,
        "address_1": address1,
        "address_2": address2,
        "city": city,
        "state": state,
        "postcode": postCode,
        "country": country,
      },
      "line_items": List.generate(
          products.length,
          (index) => {
                "product_id":
                    int.parse(products[index]["product_id"].toString()),
                "quantity": int.parse(products[index]["quantity"].toString()),
              }),
      "shipping_lines": [
        {"method_id": "flat_rate", "method_title": "Flat Rate", "total": "250"}
      ]
    };

    print(" sending data is:  ${jsonEncode(data)}");
    var nonce = await http.get(Uri.parse(
        "https://itapublications.pakistanlearningfestival.com/api/get_nonce/?json=get_nonce&controller=user&method=register"));
    final responseNonce = jsonDecode(nonce.body.toString());
    var nonceString = responseNonce["nonce"];
    print(" nonce is :$nonceString");
    var headers = {
      "Content-Type": "application/json",
      "Authorization":
          "Basic Y2tfNTQyNDFkODc1NjY2OTY1ODZlY2Q1NGIxZWQ3MmE3YzY5ZWIwN2Y4Njpjc19kN2RkMzFlZGJiMDEyNWZjMWM5ZTU0ZTk2YTY3MzFiNWQ5NmY3Nzg4",
      "consumer_secret": "cs_d7dd31edbb0125fc1c9e54e96a6731b5d96f7788",
      "consumer_key": "ck_54241d87566696586ecd54b1ed72a7c69eb07f86",
      "host": "itapublications.pakistanlearningfestival.com"
      // "nonce": nonceString
    };
    var detail = await http
        .post(
            Uri.parse(
                "https://itapublications.pakistanlearningfestival.com/wp-json/wc/v3/orders"),
            body: jsonEncode(data),
            headers: headers)
        .timeout(const Duration(seconds: 30));
    print(' api response is: ${detail.body}');

    if (detail != null) {
      try {
        final resposeData = jsonDecode(detail.body);

        print(" order id is : ${resposeData["id"]} ");
        isLoading(false).obs;
        successSnackbar("Ordered placed Successfully");
        cartController.clearData();
        Get.to(SuccessScreen());

        return resposeData;
      } catch (e) {
        isLoading(false).obs;
        var response = json.decode(detail.toString());

        if (response["success"] == false) {
        } else {}
      }
    } else {
      errorSnackbar("something went wrong");
      isLoading(false).obs;
    }
  }
}
