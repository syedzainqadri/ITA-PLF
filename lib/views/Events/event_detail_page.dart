import 'package:PLF/utils/url_base.dart';
import 'package:PLF/utils/url_paths.dart';
import 'package:PLF/webview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PLF/utils/ColorScheme.dart';
import 'package:PLF/views/Home/HomePage.dart';

import '../../SubProgramWidget.dart';
import '../../models/event_model.dart';

class EventDetailPage extends StatefulWidget {
  String img, name, subText, date;
  EventModel eventModel;

  EventDetailPage(img, name, subText, date, eventModel) {
    this.img = img;
    this.name = name;
    this.subText = subText;
    this.date = date;
    this.eventModel = eventModel;
  }

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  int selectedDate = DateTime.now().day;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe7f4f5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Row(
            children: [
              Container(
                width: 200,
                height: 260,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 200,
                        height: 240,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('asset/images/iconBg.png'),
                                fit: BoxFit.contain)),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 20,
                      child: Hero(
                        tag: widget.img,
                        child: Container(
                          height: 220,
                          width: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(widget.img))),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'product'),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      // Text(
                      //   "Program Description",
                      //   style: TextStyle(
                      //       fontSize: 16,
                      //       fontWeight: FontWeight.w500,
                      //       color: darkBlue,
                      //       fontFamily: 'circe'),
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // Row(
                      //   children: [
                      //     Text(
                      //       widget.subText,
                      //       // style: TextStyle(fontFamily: 'circe'),
                      //     )
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(30),
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Event Details",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          fontFamily: 'product'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.subText,
                      style: TextStyle(
                        fontFamily: 'circe',
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Wrap(
                      runAlignment: WrapAlignment.start,
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      spacing: 10.0,
                      // runSpacing: 0.0,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            widget.eventModel.tarana
                                ? InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Tarana",
                                          url: UrlBase.buttonURL +
                                              UrlPathHelper.getValue(
                                                  UrlPath.tarana)));
                                    },
                                    child: buttonWidget("Tarana"))
                                : buildEmptyContainer(context),
                            SizedBox(
                              width: 10,
                            ),
                            widget.eventModel.poster
                                ? InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Poster",
                                          url: UrlBase.buttonURL +
                                              UrlPathHelper.getValue(
                                                  UrlPath.poster)));
                                    },
                                    child: buttonWidget("Poster"))
                                : buildEmptyContainer(context),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            widget.eventModel.sponsors
                                ? InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Sponsors",
                                          url: UrlBase.buttonURL +
                                              UrlPathHelper.getValue(
                                                  UrlPath.sponsors)));
                                    },
                                    child: buttonWidget("Sponsors"))
                                : buildEmptyContainer(context),
                            SizedBox(
                              width: 10,
                            ),
                            widget.eventModel.program
                                ? InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Program",
                                          url: UrlBase.buttonURL +
                                              UrlPathHelper.getValue(
                                                  UrlPath.program)));
                                    },
                                    child: buttonWidget("Program"))
                                : buildEmptyContainer(context),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            widget.eventModel.resource_Persons
                                ? InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Resource Persons",
                                          url: UrlBase.buttonURL +
                                              UrlPathHelper.getValue(
                                                  UrlPath.resourcePerson)));
                                    },
                                    child: buttonWidget("Resource Persons"))
                                : buildEmptyContainer(context),
                            SizedBox(
                              width: 10,
                            ),
                            widget.eventModel.gallery
                                ? InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Gallery",
                                          url: UrlBase.buttonURL +
                                              UrlPathHelper.getValue(
                                                  UrlPath.gallery)));
                                    },
                                    child: buttonWidget("Gallery"))
                                : buildEmptyContainer(context),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            widget.eventModel.media
                                ? InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Media",
                                          url: UrlBase.buttonURL +
                                              UrlPathHelper.getValue(
                                                  UrlPath.media)));
                                    },
                                    child: buttonWidget("Media"))
                                : buildEmptyContainer(context),
                            SizedBox(
                              width: 10,
                            ),
                            widget.eventModel.getInvolved
                                ? InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Get Involved",
                                          url: UrlBase.buttonURL +
                                              UrlPathHelper.getValue(
                                                  UrlPath.getInvolved)));
                                    },
                                    child: buttonWidget("Get Involved"))
                                : buildEmptyContainer(context),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            widget.eventModel.testimonials
                                ? InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Testimonials",
                                          url: UrlBase.buttonURL +
                                              UrlPathHelper.getValue(
                                                  UrlPath.testimonials)));
                                    },
                                    child: buttonWidget("Testimonials"))
                                : buildEmptyContainer(context),
                            SizedBox(
                              width: 10,
                            ),
                            widget.eventModel.venue
                                ? InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Venue",
                                          url: UrlBase.buttonURL +
                                              UrlPathHelper.getValue(
                                                  UrlPath.venue)));
                                    },
                                    child: buttonWidget("Venue"))
                                : buildEmptyContainer(context),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            widget.eventModel.registration
                                ? InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Registration",
                                          url: UrlBase.buttonURL +
                                              UrlPathHelper.getValue(
                                                  UrlPath.registration)));
                                    },
                                    child: buttonWidget("Registration"))
                                : buildEmptyContainer(context),
                            SizedBox(
                              width: 10,
                            ),
                            widget.eventModel.videos
                                ? InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Videos",
                                          url: UrlBase.buttonURL +
                                              UrlPathHelper.getValue(
                                                  UrlPath.videos)));
                                    },
                                    child: buttonWidget("Videos"))
                                : buildEmptyContainer(context),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            widget.eventModel.book_launches
                                ? InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Book Launches",
                                          url: UrlBase.buttonURL +
                                              UrlPathHelper.getValue(
                                                  UrlPath.bookLaunches)));
                                    },
                                    child: buttonWidget("Book Launches"))
                                : buildEmptyContainer(context),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildEmptyContainer(BuildContext context) {
    return Container(
        // width: MediaQuery.of(context).size.width / 2.5,
        // height: 55,
        // padding: EdgeInsets.all(15),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.all(Radius.circular(10)),
        // ),
        );
  }

  buttonWidget(buttonName) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)), color: darkBlue),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'circe',
              fontWeight: FontWeight.w700,
              fontSize: 14),
        ),
      ),
    );
  }

  Container timeSlotWidget(String time, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      margin: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: (isSelected) ? pink : lightBlue.withOpacity(0.5),
      ),
      child: Row(
        children: [
          Icon(
            Icons.watch_later,
            size: 13,
            color: Colors.grey,
          ),
          SizedBox(
            width: 3,
          ),
          Text(
            time,
            style: TextStyle(fontSize: 10, fontFamily: 'circe'),
          )
        ],
      ),
    );
  }

  InkWell dateWidget(int i) {
    DateTime tempDate = DateTime.now().add(Duration(days: i));
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(2),
        height: 60,
        width: MediaQuery.of(context).size.width * 0.11,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: (selectedDate == tempDate.day)
              ? offWhite
              : lightBlue.withOpacity(0.5),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                dayValue(tempDate.weekday),
                style: TextStyle(fontSize: 10),
              ),
              Text(
                tempDate.day.toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }

  String dayValue(int weekDayVal) {
    List<String> dayString = [
      '',
      "Mon",
      "Tue",
      "Wed",
      "Thu",
      "Fri",
      "Sat",
      'Sun'
    ];
    return dayString[weekDayVal];
  }
}
