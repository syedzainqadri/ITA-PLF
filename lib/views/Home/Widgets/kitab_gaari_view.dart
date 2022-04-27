

import 'package:PLF/views/Donation/donations.dart';
import 'package:PLF/utils/url_base.dart';
import 'package:PLF/utils/url_paths.dart';
import 'package:PLF/views/Volenteer/volenteer.dart';
import 'package:PLF/views/Webview/webview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PLF/utils/ColorScheme.dart';

import '../../Feedback/feedback.dart';

class KitabGaariPage extends StatefulWidget {


  @override
  _KitabGaariPageState createState() => _KitabGaariPageState();
}

class _KitabGaariPageState extends State<KitabGaariPage> {
  int selectedDate = DateTime.now().day;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: vibrantWhite,
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
                color: vibrantRed,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back,
                  color: vibrantWhite,
                ),
              ),
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            Hero(
              tag: "img",
              child: SizedBox(
                height: 350,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  child: Image.network("https://childrensliteraturefestival.com/wp-content/uploads/2020/08/CLF_Kitab_Gari-1.jpg", fit: BoxFit.fill),
                ),
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
                          "Kitab Gari",
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
                          "Kitab Gari, a project initiated by Children’s Literature Festival (CLF), a flagship program of Idara-e-Taleem-o-Aagahi (ITA), aims to promote reading habits for imagination and pleasure, increase the accessibility of books for our young generation, teachers and communities. This mobile rickshaw library is stocked with 500+ books, both fiction and non-fiction for children up to 16 years and for teachers. The Kitab Gari visits bring along several inquiry based and fun-filled learning activities for the children. It focuses on 4 main learning strands: Storytelling /reading (voice/digital), Arts and Crafts, Documentaries/Movies and Board Games. The Kitab Gari has been on the go since its launch in August 2019 ,reaching out to many underprivileged areas, schools and communities, attracting students and providing them with a platform to unlock their hidden potential!"
                         "We at CLF, would love to join hands with “YOU” through the facilitation of Kitab Gari visits in your school/ locality. All our visits have brought immense excitement and enthusiasm among children and have been a skyrocketing success in boosting the love for books alongside reigniting the passion for reading. We also have from time to time ‘special ambassadors and resource persons promoting reading’ who also come and present during the Kitab Garee visits. We aim to keep the wheels rolling and reach out to as many children and teachers as possible at very low cost.",
                          style: TextStyle(
                            fontFamily: 'circe',
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                        opaque: false,
                                        pageBuilder: (context, _, __) {
                                          return WebViewPage(
                                              title: "Ad",
                                              url: UrlBase.baseWebURL);
                                        },
                                        transitionsBuilder:
                                            (_, __, ___, Widget child) {
                                          return child;
                                        }));
                              },
                              child: Image.network(
                                  "https://childrensliteraturefestival.com/wp-content/uploads/2021/03/Peace-ing_Together.gif")),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Wrap(
                            direction: Axis.horizontal,
                            runSpacing: 20,
                            spacing: 10,
                            alignment: WrapAlignment.center,
                            children: [
                                InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(
                                          title: "Photos",
                                          url: "https://childrensliteraturefestival.com/clf-kitab-gari#photos"));
                                    },
                                    child: buttonWidget("Photos")
                                ),

                              InkWell(
                                  onTap: () {
                                    Get.to(WebViewPage(
                                        title: "Videos",
                                        url: "https://childrensliteraturefestival.com/clf-kitab-gari#videos"));
                                  },
                                  child: buttonWidget("Videos")
                              ),

                              InkWell(
                                  onTap: () {
                                    Get.to(WebViewPage(
                                        title: "Media",
                                        url: "https://childrensliteraturefestival.com/clf-kitab-gari#media"));
                                  },
                                  child: buttonWidget("Media")
                              ),

                              InkWell(
                                  onTap: () {
                                    Get.to(WebViewPage(
                                        title: "Book a Visit",
                                        url: "https://childrensliteraturefestival.com/clf-kitab-gari#book-a-visit"));
                                  },
                                  child: buttonWidget("Book a Visit")
                              ),

                              InkWell(
                                  onTap: () {
                                    Get.to(WebViewPage(
                                        title: "Sessions",
                                        url: "https://childrensliteraturefestival.com/clf-kitab-gari#sessions"));
                                  },
                                  child: buttonWidget("Sessions")
                              ),


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
                                  Get.to(VolunteerScreen());
                                },
                                child: staticButtonWidget("Volunteer")),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  Get.to(DonationsScreen());
                                },
                                child: staticButtonWidget("Donation")),
                          ],
                        ),
                        SizedBox(
                          height: 15,
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
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: vibrantPurple),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'circe',
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  staticButtonWidget(buttonName) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: vibrantOrange),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'circe',
              fontWeight: FontWeight.w700),
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
