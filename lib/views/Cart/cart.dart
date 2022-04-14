import 'package:PLF/utils/ColorScheme.dart';
import 'package:PLF/views/Chekout/checkout.dart';
import 'package:PLF/views/Home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CartPage(),
    );
  }
}

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Get.to(HomePage());
            },
            icon: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Cart",
                style: TextStyle(
                  color: Color.fromARGB(255, 53, 53, 53),
                ),
              ),
              Text(
                "3 Items",
                style: TextStyle(
                  color: Color.fromARGB(255, 53, 53, 53),
                ),
              ),
            ],
          )),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            itemsCard(
              "book1",
              Colors.white,
              "Book 1",
              "11,34",
              2,
              darkBlue,
            ),
            itemsCard(
              "book4",
              Colors.white,
              "Book 2",
              "9,34",
              5,
              darkBlue,
            ),
            itemsCard(
              "book3",
              Colors.white,
              "Book Name",
              "11,34",
              1,
              darkBlue,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       inputField(MediaQuery.of(context).size.width,
            //           MediaQuery.of(context).size.height, "Promo Code", false),
            //       InkWell(
            //         onTap: () {},
            //         child: Container(

            //             width: MediaQuery.of(context).size.width / 6,
            //             height: 55,
            //           decoration: BoxDecoration(
            //             color: darkBlue,
            //             borderRadius: BorderRadius.only(
            //                 topRight: Radius.circular(20),
            //                 bottomRight: Radius.circular(20)),
            //           ),
            //           child: Container(
            //             child: Center(
            //               child: Text(
            //                 "Apply",
            //                 style: TextStyle(
            //                     color: Colors.white,
            //                     fontFamily: 'circe',
            //                     fontWeight: FontWeight.w700,
            //                     fontSize: 14),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Item Price",
                      ),
                      Text(
                        "11,478 RS",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discount",
                      ),
                      Text(
                        "0.00",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "- - - - - - - - - - - - - - - - - - - - - - - - - - - -",
                    style: TextStyle(fontSize: 25),
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
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(CheckOut());
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
                          "Continue to Checkout",
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
          ],
        ),
      ),
    );
  }

  itemsCard(img, cardColor, itemName, itemPrice, totalItems, darkColor) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 6,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Card(
          elevation: 2.0,
          color: cardColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(18.0),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("asset/books/${img}.jpg"))),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            itemName,
                          ),
                          Text(
                            itemPrice + " RS",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  color: darkColor,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (totalItems != 0) {
                                      totalItems--;
                                    }
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                totalItems.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: darkColor,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: darkColor,
                                ),
                                onPressed: () {
                                  setState(() {
                                    totalItems++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  inputField(width, height, labelText, obscureText) {
    return SizedBox(
      width: width > height ? height / 1.3 : width / 1.3,
      height: 55,
      child: TextField(
        keyboardAppearance: Brightness.dark,
        style: const TextStyle(
          color: Color.fromARGB(255, 27, 26, 26),
        ),
        autofocus: false,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 27, 26, 26), width: 1.0),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 27, 26, 26), width: 1.0),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 27, 26, 26), width: 0.8),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          ),
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 82, 79, 79),
          ),
        ),
      ),
    );
  }
}
