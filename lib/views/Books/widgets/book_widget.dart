import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Cart/cart.dart';
import '../book_details.dart';

Widget bookWidget(img, name, color, darkBlue, context) {
  return GestureDetector(
    onTap: () {
      Get.to(BookDetails("asset/books/$img", name,
          "Judith Blume is an American writer of children's, young adult and adult fiction. Blume began writing in 1959 and has published more than 25 novels. Among her best-known works are Are You There God? It's Me, Margaret, Tales of a Fourth Grade Nothing, Deenie, and Blubber"));
    },
    child: Container(
      child: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.width * 0.25,
              width: double.infinity,
              child: Hero(
                tag: img,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.asset("asset/books/$img", fit: BoxFit.fill),
                ),
              )),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: const Color(0xff4d4d4d),
                    fontSize: 14,
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
              Get.to(CartScreen());
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
        color: color,
      ),
    ),
  );
}
