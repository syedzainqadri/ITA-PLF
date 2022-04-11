import 'package:PLF/views/Events/event_detail_page.dart';
import 'package:PLF/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PLF/utils/ColorScheme.dart';

InkWell eventWidget(
    String img, String name, String subText, context, EventModel eventModel) {
  return InkWell(
    onTap: () {
      Get.to(EventDetailPage(img, name, subText, "Date", eventModel));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width / 1.3,
        // height: MediaQuery.of(context).size.width / 1.2,
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.all(Radius.circular(30)),
        //     color: lightBlue.withOpacity(0.5)),
        child: Column(
          children: [
            Hero(
              tag: img,
              child: SizedBox(
                  height: MediaQuery.of(context).size.width * 0.45,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(img, fit: BoxFit.fill))),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    ),
  );
}
