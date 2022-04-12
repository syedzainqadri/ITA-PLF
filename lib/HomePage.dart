import 'package:PLF/allEvent.dart';
import 'package:PLF/custom_drawer.dart';
import 'package:PLF/eventWidget.dart';
import 'package:PLF/feedback.dart';
import 'package:PLF/utils/url_base.dart';
import 'package:PLF/webview.dart';
import 'package:flutter/material.dart';
import 'package:PLF/ColorScheme.dart';
import 'package:PLF/eventHistoryWidget.dart';
import 'controllers/events_controller.dart';
import 'donations.dart';
import 'event_history.dart';
import 'package:get/get.dart';

import 'models/event_model.dart';
import 'utils/url_paths.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ourStoryOpen = true;
  bool deepExpanded = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GetEventController _eventController = Get.put(GetEventController());
  List<EventModel> eventModel = [];
  List<EventModel> upComingEventModel = [];
  List<EventModel> eventHistoryModel = [];

  @override
  initState() {
    super.initState();
    getData();
  }

  getData() async {
    eventModel = await _eventController.getEventsData();
    for (int i = 0; i < eventModel.length; i++) {
      if (eventModel[i].status == true) {
        upComingEventModel.add(eventModel[i]);
      } else if (eventModel[i].status == false) {
        eventHistoryModel.add(eventModel[i]);
      }
    }
    print(upComingEventModel.length);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Center(
            child: Text(
          "Pakistan Learning Festival",
          style: TextStyle(color: black),
        )),
        backgroundColor: white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Obx(() {
        return _eventController.isLoadingEvents.isTrue
            ? const Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(30),
                      width: MediaQuery.of(context).size.width,
                      color: backgroundColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Upcoming Events",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => AllUpcomingEvents(
                                          eventModel: upComingEventModel)));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                                  child: Text(
                                    "See all",
                                    style: TextStyle(
                                        color: Colors.blueAccent, fontSize: 13),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            child: upComingEventModel.isNotEmpty
                                ? ListView.builder(
                                    itemCount: upComingEventModel.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return eventWidget(
                                          upComingEventModel[index].url,
                                          upComingEventModel[index].name,
                                          upComingEventModel[index].description,
                                          context,
                                          upComingEventModel[index]);
                                    })
                                : Center(
                                    child: Text(
                                      "No UpComing Events Available",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Events History",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => EventsHistory(
                                          eventHistoryModel:
                                              eventHistoryModel)));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                                  child: Text(
                                    "See all",
                                    style: TextStyle(
                                        color: Colors.blueAccent, fontSize: 13),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            child: eventHistoryModel.isNotEmpty
                                ? ListView.builder(
                                    itemCount: eventHistoryModel.length,
                                    itemBuilder: (context, index) {
                                      return eventHistoryWidget(
                                        eventHistoryModel[index].url,
                                        eventHistoryModel[index].name,
                                        eventHistoryModel[index].description,
                                        eventHistoryModel[index].description !=
                                                null
                                            ? true
                                            : false,
                                        context,
                                        eventHistoryModel[index],
                                      );
                                    })
                                : Center(
                                    child: Text(
                                      "No Events History Available",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                          ),
                          //  Wrap(
                          //   direction: Axis.horizontal,
                          //   runSpacing: 20,
                          //   spacing: 10,
                          //   alignment: WrapAlignment.center,
                          //   children: [
                          //     InkWell(
                          //         onTap: () {
                          //           Get.to(FeedbackPage());
                          //         },
                          //         child: buttonWidget("Feedback")),
                          //     InkWell(
                          //         onTap: () {
                          //           Get.to(FeedbackPage());
                          //         },
                          //         child: buttonWidget("Volunteer")),
                          //     InkWell(
                          //         onTap: () {
                          //           Get.to(Donations());
                          //         },
                          //         child: buttonWidget("Donation")),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
      }),
    );
  }

  upcomingEvent() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.3,
        height: MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: lightBlue,
        ),
      ),
    );
  }
}

buttonWidget(buttonName) {
  return Container(
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

class BannerImage extends StatelessWidget {
  const BannerImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.push(
            context,
            PageRouteBuilder(
                opaque: false,
                pageBuilder: (context, _, __) {
                  return WebViewPage(
                      title: "Kitab Gari",
                      url: UrlBase.baseWebURL +
                          UrlPathHelper.getValue(UrlPath.kitabGarri));
                },
                transitionsBuilder: (_, __, ___, Widget child) {
                  return child;
                }));
      }),
      child: Container(
        child: ClipRRect(
          child: Image.network(
              'https://childrensliteraturefestival.com/wp-content/uploads/2020/08/CLF_Kitab_Gari-1.jpg'),
        ),
      ),
    );
  }
}
