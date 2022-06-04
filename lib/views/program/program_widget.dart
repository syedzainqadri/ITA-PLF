



import 'package:PLF/models/program_model.dart';
import 'package:PLF/views/program/program_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PLF/utils/ColorScheme.dart';

InkWell programWidget(
    String img, String name, String subText, context, ProgramModel programModel) {
  return InkWell(
    onTap: () {
      Get.to(ProgramDetailScreen(img, name, subText, "Date", programModel));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.3,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: img,
                child: SizedBox(
                  height: MediaQuery.of(context).size.width * 0.42,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(img, fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
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
  );
}
