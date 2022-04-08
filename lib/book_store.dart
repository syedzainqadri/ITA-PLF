import 'package:PLF/book_details.dart';
import 'package:PLF/book_widget.dart';
import 'package:PLF/checkout.dart';
import 'package:flutter/material.dart';
import 'package:PLF/ColorScheme.dart';
import 'package:get/get.dart';

import 'cart.dart';

class BookStore extends StatefulWidget {
  @override
  _BookStoreState createState() => _BookStoreState();
}

class _BookStoreState extends State<BookStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Get.to(Cart());
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("asset/images/bookGuy.png"))),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Container()),
                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                        Expanded(
                          child: TextField(
                            style: TextStyle(fontSize: 18, fontFamily: 'circe'),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search for Books"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(30),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    child: GridView.count(
                      primary: false,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: <Widget>[
                       bookWidget("book1.png","Book 1", lightBlue,darkBlue,context),
                       bookWidget("book2.png","Book 2", lightBlue,darkBlue,context),
                       bookWidget("book3.png","Book 3", lightBlue,darkBlue,context),
                       bookWidget("book4.png","Book 4", lightBlue,darkBlue,context),
                       bookWidget("book5.png","Book 5", lightBlue,darkBlue,context),
                       bookWidget("book6.png","Book 6", lightBlue,darkBlue,context),
                       bookWidget("book7.png","Book 7", lightBlue,darkBlue,context),
                       bookWidget("book3.png","Book 8", lightBlue,darkBlue,context),
                       bookWidget("book2.png","Book 9", lightBlue,darkBlue,context),
                       bookWidget("book1.png","Book 10", lightBlue,darkBlue,context),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
