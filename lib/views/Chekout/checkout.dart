import 'package:PLF/controllers/paymenth_methods/payment_methods_controller.dart';
import 'package:PLF/views/Books/widgets/book_widget.dart';
import 'package:flutter/material.dart';
import 'package:PLF/utils/ColorScheme.dart';
import 'package:get/get.dart';

import 'add_checkout_address.dart';

class CheckOut extends StatefulWidget {
  final totalPrice;
  final List<Map> products;
  const CheckOut({Key key, this.totalPrice, this.products}) : super(key: key);
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  bool cashOnDelivery = true, digitalPayment = false, isActive = true;
  var paymentMethodsController = Get.put(PaymentMethodController());
  var methods;
  getMethods() async {
    methods = await paymentMethodsController.getMethods();
    ;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    methods = null;
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getMethods();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.navigate_before,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Checkout",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Obx(() {
        if (paymentMethodsController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (paymentMethodsController.isListNull.value) {
          return Center(
            child: Text("No Payment Method Found"),
          );
        } else {
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery Address"),
                      GestureDetector(
                          onTap: () {
                            Get.to(AddAddress());
                          },
                          child: Text(
                            "+ Add",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Center(
                          child: Text("No Address Available"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Payment Method",
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: methods.length,
                        itemBuilder: (context, index) {
                          print(" methods length is;  ${methods.length}");
                          print("title is; ${methods[index]["title"]}");
                          return Row(
                            children: [
                              Checkbox(
                                  value: digitalPayment,
                                  onChanged: (value) {
                                    setState(() {
                                      digitalPayment = value;
                                      cashOnDelivery = false;
                                    });
                                  }),
                              Text(methods[index]["title"] ?? " "),
                            ],
                          );
                        }),
                  ),
                  TextField(
                    style: TextStyle(fontSize: 18, fontFamily: 'circe'),
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.black87,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            )),
                        hintText: "Additional note"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal",
                      ),
                      Text(
                        "11,478 RS",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Fee",
                      ),
                      Text(
                        "Not Available",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Ammount",
                      ),
                      Text(
                        "11,478 RS",
                      ),
                    ],
                  ),
                  Center(
                    child: Text(
                      "- - - - - - - - - - - - - - - - - - - - - - - - - - - -",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(bottom: 20, right: 30, left: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: darkBlue),
                      child: Center(
                        child: Text(
                          "Place Order",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'circe',
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  preferrenceContainer(text, textColor, containerColor, active) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isActive = true;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: active ? containerColor : Color.fromARGB(255, 206, 206, 206),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18.0, 12.0, 18.0, 12.0),
          child: Text(text,
              style: TextStyle(
                color: active ? textColor : Color.fromARGB(199, 15, 15, 15),
              )),
        ),
      ),
    );
  }
}
