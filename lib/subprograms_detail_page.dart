import 'package:flutter/material.dart';
import 'package:PLF/ColorScheme.dart';

class SubProgramDetailPage extends StatefulWidget {
  String img, name, grade;
  SubProgramDetailPage(img, name, grade){
    this.img=img;
    this.name=name;
    this.grade=grade;
  }
  @override
  _SubProgramDetailPageState createState() => _SubProgramDetailPageState();
}

class _SubProgramDetailPageState extends State<SubProgramDetailPage> {
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
                                  image:
                                      AssetImage('asset/images/${widget.img}.png'))),
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
                      Text(
                        widget.grade,
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
                            "Sub Program History",
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
                      "About this Sub Program",
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
                      height: 180,
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
              Navigator.pop(context);
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
                    "Check Other Sub Programs",
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
