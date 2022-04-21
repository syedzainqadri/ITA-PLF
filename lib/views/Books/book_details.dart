import 'package:PLF/views/Books/widgets/book_widget.dart';
import 'package:PLF/views/Cart/cart.dart';
import 'package:PLF/views/Events/widgets/add_review_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PLF/utils/ColorScheme.dart';
import 'package:PLF/views/Home/HomePage.dart';

class BookDetails extends StatefulWidget {
  String img, name, subText;
  BookDetails(this.img, this.name, this.subText);
  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  int selectedDate = DateTime.now().day;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
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
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: InkWell(
            //     onTap: () {
            //       showDialog(
            //         barrierColor: Colors.black26,
            //         context: context,
            //         builder: (context) {
            //           return AddReviewDialog();
            //         },
            //       );
            //     },
            //     child: Container(
            //       height: 30,
            //       width: 45,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(40),
            //         color: white,
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.grey.withOpacity(0.5),
            //             spreadRadius: 3,
            //             blurRadius: 3,
            //             offset: Offset(4, 4),
            //           ),
            //         ],
            //       ),
            //       child: Center(
            //         child: Icon(
            //           Icons.add_box,
            //           size: 30,
            //           color: Colors.black,
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            Hero(
              tag: widget.img,
              child: SizedBox(
                height: 250,
                width: double.infinity,
                child: ClipRRect(
                  child: Image.asset(widget.img, fit: BoxFit.fill),
                ),
              ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                fontFamily: 'product'),
                          ),
                          Text(
                            "Rs. 450",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                                fontFamily: 'product'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "About the Book",
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
                        "Top Related Books",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            fontFamily: 'product'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                  height: 140,
                                  width: 200,
                                  child: bookWidget(
                                      img: "book1.jpg",
                                      name: "Spiderman",
                                      color: backgroundColor,
                                      darkBlue: darkBlue,
                                      context: context,
                                      bookId: "1")),
                            );
                          },
                          itemCount: 6,
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
                Get.to(CartScreen());
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
