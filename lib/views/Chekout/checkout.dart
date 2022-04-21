import 'package:PLF/controllers/order/create_order_controller.dart';
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
  var orderController = Get.put(CreateOrderController());
  var methods;
  getMethods() async {
    methods = await paymentMethodsController.getMethods();
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

  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var address1 = TextEditingController();
  var address2 = TextEditingController();
  var city = TextEditingController();
  var state = TextEditingController();
  var postcode = TextEditingController();
  var country = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
              // height: MediaQuery.of(context).size.height * 0.9,
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery Address"),
                      // GestureDetector(
                      //     onTap: () {
                      //       Get.to(AddAddress());
                      //     },
                      //     child: Text(
                      //       "+ Add",
                      //       style: TextStyle(
                      //         color: Colors.blue,
                      //       ),
                      //     )),
                    ],
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SizedBox(
                              //   height: 15,
                              // ),
                              // Text("Delivery Address"),
                              SizedBox(
                                height: 15,
                              ),
                              inputField(
                                  firstName,
                                  MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.height,
                                  "first name"),
                              SizedBox(
                                height: 15,
                              ),
                              inputField(
                                  lastName,
                                  MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.height,
                                  "last name"),
                              SizedBox(
                                height: 15,
                              ),
                              inputField(
                                  address1,
                                  MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.height,
                                  "Address Line 1"),
                              SizedBox(
                                height: 15,
                              ),
                              inputField(
                                  address2,
                                  MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.height,
                                  "Address Line 2"),
                              SizedBox(
                                height: 15,
                              ),
                              inputField(
                                  city,
                                  MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.height,
                                  "City"),
                              SizedBox(
                                height: 15,
                              ),
                              inputField(
                                  state,
                                  MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.height,
                                  "state"),
                              SizedBox(
                                height: 15,
                              ),
                              inputField(
                                  postcode,
                                  MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.height,
                                  "post code"),
                              SizedBox(
                                height: 15,
                              ),
                              inputField(
                                  country,
                                  MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.height,
                                  "country"),
                              SizedBox(
                                height: 15,
                              ),
                              inputField(
                                  email,
                                  MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.height,
                                  "email"),
                              SizedBox(
                                height: 15,
                              ),
                              inputField(
                                  phone,
                                  MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.height,
                                  "Phone"),
                              SizedBox(
                                height: 5,
                              ),
                              // InkWell(
                              //   onTap: () {},
                              //   child: Container(
                              //     width: MediaQuery.of(context).size.width,
                              //     padding: EdgeInsets.all(15),
                              //     margin: EdgeInsets.only(bottom: 20, right: 30, left: 30),
                              //     decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.all(Radius.circular(10)),
                              //         color: darkBlue),
                              //     child: Center(
                              //       child: Text(
                              //         "Save Location",
                              //         style: TextStyle(
                              //             color: Colors.white,
                              //             fontFamily: 'circe',
                              //             fontWeight: FontWeight.w700,
                              //             fontSize: 18),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  // Center(
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(12),
                  //     ),
                  //     width: MediaQuery.of(context).size.width / 1.2,
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(18.0),
                  //       child: Center(
                  //         child: Text("No Address Available"),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Payment Method",
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: digitalPayment,
                          onChanged: (value) {
                            setState(() {
                              digitalPayment = value;
                              cashOnDelivery = false;
                            });
                          }),
                      Text("Cash on delivery"),
                    ],
                  ),
                  // Expanded(
                  //   child: ListView.builder(
                  //       itemCount: methods.length,
                  //       itemBuilder: (context, index) {
                  //         print(" methods length is;  ${methods.length}");
                  //         print("title is; ${methods[index]["title"]}");
                  //         return Row(
                  //           children: [
                  //             Checkbox(
                  //                 value: digitalPayment,
                  //                 onChanged: (value) {
                  //                   setState(() {
                  //                     digitalPayment = value;
                  //                     cashOnDelivery = false;
                  //                   });
                  //                 }),
                  //             Text(methods[index]["title"] ?? " "),
                  //           ],
                  //         );
                  //       }),
                  // ),
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
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal",
                      ),
                      Text(
                        widget.totalPrice.toString(),
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
                        "free",
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
                        widget.totalPrice.toString(),
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
                    onTap: () {
                      if (_formKey.currentState.validate()) {
                        orderController.createOrder(
                            email: email.text,
                            address1: address1.text,
                            address2: address2.text,
                            city: city.text,
                            country: country.text,
                            district: "peshawar",
                            firstName: firstName.text,
                            lastName: lastName.text,
                            phone: phone.text,
                            postCode: postcode.text,
                            products: widget.products,
                            state: state.text,
                            total: widget.totalPrice,
                            methodId: "cod",
                            methodTitle: "Cash on delivery",
                            paymentMethodTitle: "Cash on delivery");
                      }
                    },
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

  inputField(controller, width, height, labelText) {
    return SizedBox(
      width: width > height ? height / 1.1 : width / 1.1,
      height: width > height ? width / 12 : height / 12,
      child: TextFormField(
        keyboardAppearance: Brightness.dark,
        validator: (val) {
          if (val == null || val.isEmpty) {
            return "Field Required";
          }
        },
        style: const TextStyle(
          color: Color.fromARGB(255, 20, 20, 20),
        ),
        autofocus: false,
        obscureText: false,
        decoration: InputDecoration(
          labelText: labelText,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 15, 15, 15), width: 2.0),
            borderRadius: BorderRadius.circular(15.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              style: BorderStyle.solid,
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              style: BorderStyle.solid,
              color: Color.fromARGB(255, 20, 20, 20),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 71, 70, 70),
          ),
        ),
      ),
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
