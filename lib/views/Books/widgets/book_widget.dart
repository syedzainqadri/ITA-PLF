import 'package:PLF/controllers/add_to_cart.dart';
import 'package:PLF/controllers/add_to_cart/add_to_cart.dart';
import 'package:PLF/models/cart_model.dart';
import 'package:PLF/utils/ColorScheme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../book_details.dart';

class BookWidget extends StatefulWidget {
  final img,
      name,
      color,
      darkBlue,
      bookId,
      context,
      price,
      subText,
      relatedProducts;
  const BookWidget(
      {Key key,
      this.subText,
      this.price,
      this.img,
      this.name,
      this.color,
      this.darkBlue,
      this.bookId,
      this.context,
      this.relatedProducts})
      : super(key: key);

  @override
  _BookWidgetState createState() => _BookWidgetState();
}

class _BookWidgetState extends State<BookWidget> {
  var addToCartController = Get.put(AddToCart());
  var cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(BookDetails(widget.img, widget.name, widget.subText,
            widget.price, widget.relatedProducts));
      },
      child: Container(
        // height: MediaQuery.of(context).size.height * .7,
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.width * 0.22,
                width: double.infinity,
                child: Hero(
                  tag: widget.img,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: CachedNetworkImage(
                      // height: MediaQuery.of(context).size.height * .14,
                      imageUrl: this.widget.img,
                      fit: BoxFit.cover,
                      placeholder: (context, val) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.image),
                    ),
                  ),
                )),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        widget.name,
                        style: TextStyle(
                          color: const Color(0xff4d4d4d),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                CartModel cart = CartModel(
                    quantity: 1,
                    product_id: widget.bookId.toString(),
                    price: double.parse(widget.price),
                    name: widget.name,
                    image: widget.img);
                cartController.insert(cart);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: vibrantWhite,
        ),
      ),
    );
  }
}
