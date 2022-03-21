import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PLF/ColorScheme.dart';
import 'package:PLF/HomePage.dart';

import 'SubProgramWidget.dart';

class ProgramDetailPage extends StatefulWidget {
  @override
  _ProgramDetailPageState createState() => _ProgramDetailPageState();
}

class _ProgramDetailPageState extends State<ProgramDetailPage> {
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
                        tag: "boy1Big",
                        child: Container(
                          height: 220,
                          width: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('asset/images/boy1Big.png'))),
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
                        "Incredible Libraries",
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'product'),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Program Description",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: darkBlue,
                            fontFamily: 'circe'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            "Sub title or Description",
                            style: TextStyle(fontFamily: 'circe'),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'asset/images/palette.png'))),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Program History",
                            style: TextStyle(fontFamily: 'circe'),
                          )
                        ],
                      ),
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
                      "About Program",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          fontFamily: 'product'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "At Pakistan Learning Festival, we are committed to providing learning opportunities for all. Over the years, we witnessed that one of the major contributing factors to the learning deficiency amongst our children especially in remote areas of Pakistan is the lack of easy access to books and lack of guidance.",
                      style: TextStyle(
                        fontFamily: 'circe',
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Sub programs or any text suggested",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          fontFamily: 'product'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            subProgramWidget("icon1", "Digi Kutub Khana",
                                "GRADE 0-1", lightBlue, darkBlue),
                            subProgramWidget("icon2", "Kitab Gari", "GRADE 0-2",
                                yellow, Color(0xff4d4d4d)),
                            subProgramWidget(
                                "icon3",
                                "Any other \n sub program",
                                "GRADE 0-3",
                                pink,
                                Color(0xff4a155f))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        "Any other instructions of Specific Text",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            fontFamily: 'product'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "Can Go here",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            fontFamily: 'product'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Container(
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Row(
                    //         children: [
                    //           timeSlotWidget("11:00 AM", false),
                    //           timeSlotWidget("12:00 PM", false),
                    //           timeSlotWidget("01:00 PM", false),
                    //           timeSlotWidget("03:00 PM", true),
                    //         ],
                    //       ),
                    //       Row(
                    //         children: [
                    //           timeSlotWidget("04:00 PM", false),
                    //           timeSlotWidget("06:00 PM", false),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(HomePage());
            },
            child: Container(
              color: Colors.white,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(bottom: 20, right: 30, left: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: darkBlue),
                child: Center(
                  child: Text(
                    "Check Other Programs",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'circe',
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          )
        ],
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
