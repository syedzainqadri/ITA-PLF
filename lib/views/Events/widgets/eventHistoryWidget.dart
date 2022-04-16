import 'package:PLF/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PLF/utils/ColorScheme.dart';
import '../event_detail_page.dart';

InkWell eventHistoryWidget(String img, String name, String subText,
    bool hasSubProgram, context, EventModel eventModel) {
  return InkWell(
    onTap: () {
      Get.to(EventDetailPage(img, name, subText, "Date", eventModel));
    },
    child: Container(
      margin: EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Hero(
            tag: img,
            child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.28,
                width: MediaQuery.of(context).size.width / 3,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(img, fit: BoxFit.fill))),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_today, size: 15),
                        SizedBox(width: 5),
                        Text(
                          "22-12-2022",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

//Container(
//             child: Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
//                   child: Container(
//                     height: 125,
//                     width: 150,
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                             image: AssetImage('asset/images/iconBgNew.png'),
//                             fit: BoxFit.contain)),
//                   ),
//                 ),
//                 // Container(
//                 //   height: 130,
//                 //   padding: EdgeInsets.only(left: 5, top: 5),
//                 //   child: Stack(
//                 //     children: [
//                 //       Container(
//                 //         width: 60,
//                 //         height: 60,
//                 //         child: RotatedBox(
//                 //           quarterTurns: 2,
//                 //           child: Icon(
//                 //             Icons.star,
//                 //             color: darkBlue,
//                 //             size: 60,
//                 //           ),
//                 //         ),
//                 //       ),
//                 //       Container(
//                 //         width: 60,
//                 //         height: 60,
//                 //         child: Center(
//                 //           child: Text(
//                 //             "4.5",
//                 //             style: TextStyle(
//                 //                 fontSize: 10,
//                 //                 fontWeight: FontWeight.w700,
//                 //                 color: Colors.white),
//                 //           ),
//                 //         ),
//                 //       )
//                 //     ],
//                 //   ),
//                 // ),
//                 Positioned(
//                   left: 50,
//                   child: Hero(
//                     tag: img,
//                     child: Container(
//                       width: 100,
//                       height: 130,
//                       decoration: BoxDecoration(
//                           image: DecorationImage(
//                               image: AssetImage('asset/images/$img.png'),
//                               fit: BoxFit.cover)),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.all(15),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text(
//                         "GRADE $grade",
//                         style: TextStyle(fontSize: 10, color: Colors.grey),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Text(
//                     name,
//                     style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
//                   ),
//                   Text(
//                     '$subText',
//                     style: TextStyle(
//                         fontSize: 13,
//                         fontWeight: FontWeight.w500,
//                         color: darkBlue),
//                   ),
//                   Expanded(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Click Here to Learn More",
//                           style: TextStyle(
//                               fontSize: 12, fontWeight: FontWeight.w500),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )
