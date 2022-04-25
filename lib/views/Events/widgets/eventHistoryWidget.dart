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
        color: white,
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
