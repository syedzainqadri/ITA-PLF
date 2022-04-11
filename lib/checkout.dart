import 'package:PLF/book_widget.dart';
import 'package:flutter/material.dart';
import 'package:PLF/utils/ColorScheme.dart';
import 'package:get/get.dart';

import 'add_checkout_address.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  bool cashOnDelivery = true, digitalPayment = false, isActive = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue,
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
      body: Padding(
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
            Text("Preference Time"),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                preferrenceContainer("Today", Colors.white, darkBlue, true),
                SizedBox(
                  width: 15,
                ),
                preferrenceContainer("Tomorrow", Colors.white, darkBlue, false),
                SizedBox(
                  width: 15,
                ),
                preferrenceContainer(
                    "Next Date", Colors.white, darkBlue, false),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                preferrenceContainer(
                    "05:00 PM - 08:00 PM", Colors.white, darkBlue, true),
                SizedBox(
                  width: 15,
                ),
                preferrenceContainer(
                    "02:00 PM - 05:00 PM", Colors.white, darkBlue, false),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Payment Method",
            ),
            Row(
              children: [
                Checkbox(
                    value: cashOnDelivery,
                    onChanged: (value) {
                      setState(() {
                        cashOnDelivery = value;
                        digitalPayment = false;
                      });
                    }),
                Text("Cash On Delivery"),
              ],
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
                Text("Digital Payment"),
              ],
            ),
            Expanded(
              child: TextField(
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
              height: 5,
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
            SizedBox(
              height: 5,
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
            Text(
              "- - - - - - - - - - - - - - - - - - - - - - - - - - - -",
              style: TextStyle(fontSize: 25),
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
