

import 'package:PLF/models/program_model.dart';
import 'package:PLF/views/Webview/webview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:PLF/utils/ColorScheme.dart';
import '../../controllers/event_banner_controller.dart';
import '../../models/banner_model.dart';
import '../Donation/DonationScreenFromEvent.dart';
import '../Feedback/feedback.dart';
import '../Volenteer/VolenteerScreenFromEvent.dart';

class ProgramDetailScreen extends StatefulWidget {
  String img, name, subText, date;
  ProgramModel programModel;

  ProgramDetailScreen(img, name, subText, date, eventModel) {
    this.img = img;
    this.name = name;
    this.subText = subText;
    this.date = date;
    this.programModel = eventModel;
  }

  @override
  _ProgramDetailScreenState createState() => _ProgramDetailScreenState();
}

class _ProgramDetailScreenState extends State<ProgramDetailScreen> {
  int selectedDate = DateTime.now().day;
  final GetEventBannerController _eventBannerController =
  Get.put(GetEventBannerController());
  List<BannersModel> eventModel = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    eventModel = await _eventBannerController.getEventBanner();
    setState(() {});
  }

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
                          height: 30,
                        ),

                        Center(
                          child: Wrap(
                              direction: Axis.horizontal,
                              spacing: 10,
                              runSpacing: 20,
                              alignment: WrapAlignment.spaceEvenly,
                              children: widget.programModel.buttonList.map((item) {
                                print(widget.programModel.buttonList);
                                return InkWell(
                                    onTap: () {
                                      Get.to(WebViewPage(title: item['buttonName'], url: item['buttonUrl']));
                                    },
                                    child: buttonWidget(item['buttonName'])
                                );
                              }).toList()
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
                                  Get.to(VolunteerScreenFromEvent());
                                },
                                child: staticButtonWidget("Volunteer")),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  Get.to(DonationsScreenFromEvent());
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
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
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

}
