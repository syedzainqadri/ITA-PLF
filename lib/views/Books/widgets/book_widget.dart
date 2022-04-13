import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../book_details.dart';

GestureDetector bookWidget(img, name, color, darkBlue, context) {
  return GestureDetector(
    onTap: () {
      Get.to(BookDetials());
    },
    child: Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('asset/images/${img}'))),
          ),
          Text(
            name,
            style: TextStyle(
              color: const Color(0xff4d4d4d),
              fontSize: 14,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                padding: EdgeInsets.all(5),
                //margin: EdgeInsets.only(bottom: 20, right: 30, left: 30),
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
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
    ),
  );
}
