import 'package:flutter/material.dart';

Container subProgramWidget(
    String img, String name, String grade, Color color, Color textColor) {
  return Container(
    height: 100,
    margin: EdgeInsets.only(right: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)), color: color),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                name,
                style: TextStyle(
                    color: textColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                grade,
                style: TextStyle(color: Colors.grey, fontSize: 11),
              )
            ],
          ),
        ),
        Container(
          height: 90,
          width: 70,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('asset/images/$img.png'),
                  fit: BoxFit.contain)),
        )
      ],
    ),
  );
}
