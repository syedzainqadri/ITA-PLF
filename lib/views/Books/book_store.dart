import 'package:PLF/views/Books/widgets/book_widget.dart';
import 'package:flutter/material.dart';
import 'package:PLF/utils/ColorScheme.dart';
import 'package:get/get.dart';

import '../Cart/cart.dart';

class BookStore extends StatefulWidget {
  @override
  _BookStoreState createState() => _BookStoreState();
}

class _BookStoreState extends State<BookStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.menu,
        //     color: Colors.black,
        //     size: 30,
        //   ),
        //   onPressed: () {},
        // ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Get.to(CartScreen());
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
                    image: NetworkImage("https://childrensliteraturefestival.com/wp-content/uploads/2022/02/ssp-gray.png"))),
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 30, top: 70),
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
                    height: 10,
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
                        bookWidget("book1.jpg", "Book 1", backgroundColor, darkBlue,
                            context),
                        bookWidget("book2.png", "Book 2", backgroundColor, darkBlue,
                            context),
                        bookWidget("book3.jpg", "Book 3", backgroundColor, darkBlue,
                            context),
                        bookWidget("book4.jpg", "Book 4", backgroundColor, darkBlue,
                            context),
                        bookWidget("book1.jpg", "Book 5", backgroundColor, darkBlue,
                            context),
                        bookWidget("book2.png", "Book 6", backgroundColor, darkBlue,
                            context),
                        bookWidget("book3.jpg", "Book 7", backgroundColor, darkBlue,
                            context),
                        bookWidget("book4.jpg", "Book 8", backgroundColor, darkBlue,
                            context),
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
