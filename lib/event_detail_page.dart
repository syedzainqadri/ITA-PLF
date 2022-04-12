import 'package:PLF/donations.dart';
import 'package:PLF/utils/url_base.dart';
import 'package:PLF/utils/url_paths.dart';
import 'package:PLF/volenteer.dart';
import 'package:PLF/webview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PLF/ColorScheme.dart';
import 'package:PLF/HomePage.dart';

import 'SubProgramWidget.dart';
import 'feedback.dart';
import 'models/event_model.dart';

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            Hero(
              tag: widget.img,
              child: ClipRRect(
                child: Image.network(widget.img, fit: BoxFit.fill),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                // color: Colors.white,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          widget.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              fontFamily: 'product'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.calendar_today),
                            SizedBox(width: 5),
                            Text(
                              "22-12-2022",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.subText,
                          style: TextStyle(
                            fontFamily: 'circe',
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Center(
                          child: Wrap(
                            direction: Axis.horizontal,
                            runSpacing: 20,
                            spacing: 10,
                            alignment: WrapAlignment.center,
                            children: [
                              if (widget.eventModel.tarana)
                                InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Tarana",
                                          url: UrlBase.buttonURL +
                                              UrlPathHelper.getValue(
                                                  UrlPath.tarana)));
                                    },
                                    child: buttonWidget("Tarana")),
                              if (widget.eventModel.poster)
                                InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Poster",
                                          url: UrlBase.buttonURL +
                                              UrlPathHelper.getValue(
                                                  UrlPath.poster)));
                                    },
                                    child: buttonWidget("Poster")),
                              if (widget.eventModel.sponsors)
                                InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Sponsors",
                                          url: UrlBase.buttonURL +
                                              UrlPathHelper.getValue(
                                                  UrlPath.sponsors)));
                                    },
                                    child: buttonWidget("Sponsors")),
                              if (widget.eventModel.program)
                                InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Program",
                                          url: UrlBase.buttonURL +
                                              UrlPathHelper.getValue(
                                                  UrlPath.program)));
                                    },
                                    child: buttonWidget("Program")),
                              if (widget.eventModel.resource_Persons)
                                InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Resource Persons",
                                          url: UrlBase.buttonURL +
                                              UrlPathHelper.getValue(
                                                  UrlPath.resourcePerson)));
                                    },
                                    child: buttonWidget("Resource Persons")),
                              if (widget.eventModel.gallery)
                                InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Gallery",
                                          url: UrlBase.buttonURL +
                                              UrlPathHelper.getValue(
                                                  UrlPath.gallery)));
                                    },
                                    child: buttonWidget("Gallery")),
                              if (widget.eventModel.media)
                                InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Media",
                                          url: UrlBase.buttonURL +
                                              UrlPathHelper.getValue(
                                                  UrlPath.media)));
                                    },
                                    child: buttonWidget("Media")),
                              if (widget.eventModel.getInvolved)
                                InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Get Involved",
                                          url: UrlBase.buttonURL +
                                              UrlPathHelper.getValue(
                                                  UrlPath.getInvolved)));
                                    },
                                    child: buttonWidget("Get Involved")),
                              if (widget.eventModel.testimonials)
                                InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Testimonials",
                                          url: UrlBase.buttonURL +
                                              UrlPathHelper.getValue(
                                                  UrlPath.testimonials)));
                                    },
                                    child: buttonWidget("Testimonials")),
                              if (widget.eventModel.venue)
                                InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Venue",
                                          url: UrlBase.buttonURL +
                                              UrlPathHelper.getValue(
                                                  UrlPath.venue)));
                                    },
                                    child: buttonWidget("Venue")),
                              if (widget.eventModel.registration)
                                InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Registration",
                                          url: UrlBase.buttonURL +
                                              UrlPathHelper.getValue(
                                                  UrlPath.registration)));
                                    },
                                    child: buttonWidget("Registration")),
                              if (widget.eventModel.videos)
                                InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Videos",
                                          url: UrlBase.buttonURL +
                                              UrlPathHelper.getValue(
                                                  UrlPath.videos)));
                                    },
                                    child: buttonWidget("Videos")),
                              if (widget.eventModel.book_launches)
                                InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Book Launches",
                                          url: UrlBase.buttonURL +
                                              UrlPathHelper.getValue(
                                                  UrlPath.bookLaunches)));
                                    },
                                    child: buttonWidget("Book Launches")),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.grey[300],
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {
                                  Get.to(FeedbackPage());
                                },
                                child: staticButtonWidget("Feedback")),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  Get.to(Volenteer());
                                },
                                child: staticButtonWidget("Volunteer")),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  Get.to(Donations());
                                },
                                child: staticButtonWidget("Donation")),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEmptyContainer(BuildContext context) {
    return SizedBox.shrink(
        // width: MediaQuery.of(context).size.width / 2.5,
        // height: 55,
        // padding: EdgeInsets.all(15),
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.all(Radius.circular(10)), color: grey)
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
              fontSize: 18),
        ),
      ),
    );
  }

  staticButtonWidget(buttonName) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)), color: darkBlue),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'circe',
              fontWeight: FontWeight.w700,
              fontSize: 18),
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
              ? yellow
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
