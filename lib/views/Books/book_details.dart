import 'package:PLF/controllers/get_products.dart';
import 'package:PLF/views/Cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:PLF/utils/ColorScheme.dart';
import '../../controllers/add_to_cart.dart';
import '../../controllers/add_to_cart/add_to_cart.dart';
import '../../models/cart_model.dart';

class BookDetails extends StatefulWidget {
  String img, name, subText, price, bookId;
  final relatedIds;
  BookDetails(
      this.img, this.name, this.subText, @required this.price, this.relatedIds);
  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  var addToCartController = Get.put(AddToCart());
  var cartController = Get.put(CartController());
  var productController = Get.put(ProductsController());
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
                Get.to(CartPage());
              },
            ),
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
                  child: Image.network(widget.img, fit: BoxFit.fill),
                ),
              ),
            ),
            Container(
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
                        Expanded(
                          child: Text(
                            widget.name,
                            maxLines: 2,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                fontFamily: 'product'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.price,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          color: vibrantRed,
                          fontFamily: 'product'),
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
                    Container(
                        height: 200,
                        child: Html(data: widget.subText, style: {})),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                CartModel cart = CartModel(
                    quantity: 1, product_id: widget.bookId.toString());
                cartController.insert(cart);
                Get.to(CartPage());
              },
              child: Container(
                color: Colors.white,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.only(bottom: 20, right: 30, left: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: vibrantBlue),
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
