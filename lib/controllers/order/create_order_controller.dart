import 'dart:convert';
import 'dart:io';

import 'package:PLF/models/product.dart';
import 'package:PLF/network/api_service.dart';
import 'package:PLF/utils/url_paths.dart';
import 'package:PLF/widgets/custom_snackbar.dart';
import 'package:get/get.dart';

class LineItem {
  final product_id;
  final quantity;

  LineItem(this.product_id, this.quantity);
}

class CreateOrderController extends GetxController {
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
      // "line_items": List.generate(
      //     products.length,
      //     (index) => {
      //           "product_id":
      //               int.parse(products[index]["product_id"].toString()),
      //           "quantity": int.parse(products[index]["quantity"].toString()),
      //         }),
      // [
      //   {
      //     "product_id": 93,
      //     "quantity": 2
      //   },
      //   {
      //     "product_id": 22,
      //     "variation_id": 23,
      //     "quantity": 1
      //   }
      // ]
      "line_items": [
        {
          "product_id": products[0]["product_id"],
          "quantity": products[0]["quantity"]
        },
      ],
      "shipping_lines": [
        {
          "method_id": "flat_rate",
          "method_title": "Flat Rate",
          "total": total.toString()
        }
      ]
    };

    print(" sending data is:  ${jsonEncode(data)}");
    var detail = await APIService().postRequest(
        apiName: makeOrder + "", isJson: true, mapData: data, isAuth: false);
    print(' api response is: ${detail}');

    if (detail != null) {
      try {
        final resposeData = jsonDecode(detail);

        print(" order id is : ${resposeData["id"]} ");
        isLoading(false).obs;
        successSnackbar("${resposeData["Ordered Successfully"]}");
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
