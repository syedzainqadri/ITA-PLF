import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PLF/ColorScheme.dart';
import 'package:PLF/ProgramDetailPage.dart';

InkWell eventWidget(String img, String name, String subText,context) {
  return InkWell(
    onTap: () {
      
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.only(top: 20),
          width: MediaQuery.of(context).size.width / 1.3,
          height: MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: lightBlue.withOpacity(0.5)),
        child: Row(
          children: [
            Container(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
                    child: Container(
                      height: 125,
                      width: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('asset/images/iconBgNew.png'),
                              fit: BoxFit.contain)),
                    ),
                  ),
                  // Container(
                  //   height: 130,
                  //   padding: EdgeInsets.only(left: 5, top: 5),
                  //   child: Stack(
                  //     children: [
                  //       Container(
                  //         width: 60,
                  //         height: 60,
                  //         child: RotatedBox(
                  //           quarterTurns: 2,
                  //           child: Icon(
                  //             Icons.star,
                  //             color: darkBlue,
                  //             size: 60,
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         width: 60,
                  //         height: 60,
                  //         child: Center(
                  //           child: Text(
                  //             "4.5",
                  //             style: TextStyle(
                  //                 fontSize: 10,
                  //                 fontWeight: FontWeight.w700,
                  //                 color: Colors.white),
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  Positioned(
                    left: 50,
                    child: Hero(
                      tag: img,
                      child: Container(
                        width: 100,
                        height: 130,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('asset/images/$img.png'),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Launch Date ",
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      name,
                      style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '$subText',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: darkBlue),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Click Here to Learn More",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
