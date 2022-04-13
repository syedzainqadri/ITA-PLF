import 'package:PLF/book_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PLF/ColorScheme.dart';
import 'package:PLF/bottombar/HomePage.dart';

import 'SubProgramWidget.dart';

class BookDetials extends StatefulWidget {
  @override
  _BookDetialsState createState() => _BookDetialsState();
}

class _BookDetialsState extends State<BookDetials> {
  

  int selectedDate = DateTime.now().day;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe7f4f5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Row(
            children: [
              Container(
                width: 200,
                height: 260,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 200,
                        height: 240,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('asset/images/iconBg.png'),
                                fit: BoxFit.contain)),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 20,
                      child: Hero(
                        tag: 'bookGuy.png',
                        child: Container(
                          height: 220,
                          width: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('asset/images/bookGuy.png'))),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Book Name',
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'product'),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Book Description",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: darkBlue,
                            fontFamily: 'circe'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            'Book Author',
                            style: TextStyle(fontFamily: 'circe'),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      
                    ],
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(30),
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About the Author",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          fontFamily: 'product'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Judith Blume is an American writer of children's, young adult and adult fiction. Blume began writing in 1959 and has published more than 25 novels. Among her best-known works are Are You There God? It's Me, Margaret, Tales of a Fourth Grade Nothing, Deenie, and Blubber.",
                      style: TextStyle(
                        fontFamily: 'circe',
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "More Books by this Author",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          fontFamily: 'product'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: bookWidget("book5.png","Spiderman", lightBlue,darkBlue,context),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: bookWidget("book4.png","Superman", lightBlue,darkBlue,context),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: bookWidget("book7.png","Batman", lightBlue,darkBlue,context),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: bookWidget("book3.png","Flash", lightBlue,darkBlue,context),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: bookWidget("book1.png","Wonder Woman", lightBlue,darkBlue,context),
                       ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(HomePage());
            },
            child: Container(
              color: Colors.white,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(bottom: 20, right: 30, left: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: darkBlue),
                child: Center(
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'circe',
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container timeSlotWidget(String time, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      margin: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: (isSelected) ? pink : lightBlue.withOpacity(0.5),
      ),
      child: Row(
        children: [
          Icon(
            Icons.watch_later,
            size: 13,
            color: Colors.grey,
          ),
          SizedBox(
            width: 3,
          ),
          Text(
            time,
            style: TextStyle(fontSize: 10, fontFamily: 'circe'),
          )
        ],
      ),
    );
  }

  InkWell dateWidget(int i) {
    DateTime tempDate = DateTime.now().add(Duration(days: i));
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(2),
        height: 60,
        width: MediaQuery.of(context).size.width * 0.11,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: (selectedDate == tempDate.day)
              ? yellow
              : lightBlue.withOpacity(0.5),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tempDate.day.toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }


}
