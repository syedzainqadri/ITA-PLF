import 'package:PLF/book_widget.dart';
import 'package:flutter/material.dart';
import 'package:PLF/ColorScheme.dart';
import 'package:get/get.dart';

class AddAddress extends StatefulWidget {
  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  
  bool cashOnDelivery = true, digitalPayment = false;
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
          "Add New Address",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                    image: AssetImage("asset/images/map.png"))),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Label As"),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    preferrenceContainer("Home", Colors.white, darkBlue, true),
                    SizedBox(width: 15),
                    preferrenceContainer(
                        "Workplace", Colors.white, darkBlue, false),
                    SizedBox(width: 15),
                    preferrenceContainer(
                        "Other", Colors.white, darkBlue, false),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Delivery Address"),
                SizedBox(
                  height: 15,
                ),
                inputField(MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height, "Address Line"),
                SizedBox(
                  height: 15,
                ),
                inputField(MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height, "Contact Person Name"),
                SizedBox(
                  height: 15,
                ),
                inputField(
                    MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height,
                    "Contact Person Phone No"),
                SizedBox(
                  height: 20,
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
                        "Save Location",
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
    );
  }

  inputField(width, height, labelText) {
    return SizedBox(
      width: width > height ? height / 1.1 : width / 1.1,
      height: width > height ? width / 12 : height / 12,
      child: TextField(
        keyboardAppearance: Brightness.dark,
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
        setState(() {});
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
