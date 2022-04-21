import 'package:PLF/controllers/add_to_cart.dart';
import 'package:PLF/controllers/add_to_cart/add_to_cart.dart';
import 'package:PLF/helper/shared_preferences/shared_preferences.dart';
import 'package:PLF/models/cart_model.dart';
import 'package:PLF/utils/ColorScheme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Cart/cart.dart';
import '../book_details.dart';

class bookWidget extends StatefulWidget {
  final img, name, color, darkBlue, bookId, context;
  const bookWidget(
      {Key key,
      this.img,
      this.name,
      this.color,
      this.darkBlue,
      this.bookId,
      this.context})
      : super(key: key);

  @override
  _bookWidgetState createState() => _bookWidgetState();
}

class _bookWidgetState extends State<bookWidget> {
  var addToCartController = Get.put(AddToCart());
  var cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(BookDetails("asset/books/${widget.img}", widget.name,
            "Judith Blume is an American writer of children's, young adult and adult fiction. Blume began writing in 1959 and has published more than 25 novels. Among her best-known works are Are You There God? It's Me, Margaret, Tales of a Fourth Grade Nothing, Deenie, and Blubber"));
      },
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                  // height: MediaQuery.of(context).size.width * 0.25,
                  width: double.infinity,
                  child: Hero(
                    tag: widget.img,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: CachedNetworkImage(
                        imageUrl: widget.img,
                        fit: BoxFit.cover,
                        placeholder: (context, val) => Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.image),
                      ),
                    ),
                  )),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        color: const Color(0xff4d4d4d),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: darkBlue,
                    ),
                    child: Center(
                      child: Text(
                        "3.5",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'circe',
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            InkWell(
              onTap: () {
                CartModel cart = CartModel(
                    quantity: 2, product_id: widget.bookId.toString());
                cartController.insert(cart);

                // addToCartController.addToCart(
                //     itemId: widget.bookId.toString(), quantity: "1");

                // Get.to(CartScreen());
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 5,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                        fontSize: 12),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cardColor,
        ),
      ),
    );
  }
}
