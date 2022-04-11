
import 'package:PLF/allEvent.dart';
import 'package:PLF/custom_drawer.dart';
import 'package:PLF/eventWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:PLF/ColorScheme.dart';
import 'package:PLF/programWidget.dart';
import 'controllers/events_controller.dart';
import 'event_history.dart';
import 'package:get/get.dart';

import 'models/event_model.dart';

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

  getData() async{
    eventModel = await _eventController.getEventsData();
    for(int i=0; i<eventModel.length; i++){
      if(eventModel[i].status == true){
        upComingEventModel.add(eventModel[i]);

      }else if(eventModel[i].status == false){
        eventHistoryModel.add(eventModel[i]);
      }
    }
    print(upComingEventModel.length);
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Center(child: Text("PLF")),
        backgroundColor: appbarColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
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
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Obx(() {
        return _eventController.isLoadingEvents.isTrue ? const Center(child: CircularProgressIndicator()) :
        Column(
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
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AllUpcomingEvents(eventModel: upComingEventModel)));
                          },
                          child: Text(
                            "See all",
                            style:
                            TextStyle(color: Colors.blueAccent, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: upComingEventModel.isNotEmpty ?
                        ListView.builder(
                            itemCount: upComingEventModel.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                             return  eventWidget(
                                 upComingEventModel[index].url,
                                 upComingEventModel[index].name,
                                 upComingEventModel[index].description,
                                 context,
                                 upComingEventModel[index]
                             );
                            })
                      : Center(child: Text("No UpComing Events Available",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),),
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       eventWidget("boy1Big", "Incredible Libraries",
                      //           "Event Description", context),
                      //       eventWidget(
                      //           "girl", "YAA", "Event Description", context),
                      //       eventWidget("boy2", "Incredible Libraries",
                      //           "Event Description", context),
                      //       eventWidget("boy1Big", "Incredible Libraries",
                      //           "Event Description", context),
                      //     ],
                      //   ),
                      // ),
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
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EventsHistory(eventHistoryModel: eventHistoryModel)));
                          },
                          child: Text(
                            "See all",
                            style:
                            TextStyle(color: Colors.blueAccent, fontSize: 13),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: eventHistoryModel.isNotEmpty ?
                      ListView.builder(
                          itemCount: eventHistoryModel.length,
                          itemBuilder: (context, index) {
                            return  programWidget(
                                eventHistoryModel[index].url,
                                eventHistoryModel[index].name,
                                eventHistoryModel[index].description,
                                eventHistoryModel[index].description != null ? true : false,
                                context,
                                eventHistoryModel[index],
                            );
                          })
                          : Center(child: Text("No Events History Available",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),),
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.vertical,
                      //   child: Column(
                      //     children: [
                      //       programWidget(
                      //           "boy1Big",
                      //           "Incredible Libraries",
                      //           "Program Description",
                      //           "0-5",
                      //           true,
                      //           context
                      //       ),
                      //       programWidget(
                      //           "yaa", "YAA", "Program Description", "0-5", true, context),
                      //       programWidget("boy2", "Online Book Club",
                      //           "Program Description", "0-2", false, context),
                      //       programWidget("story_bytes", "Story Bytes",
                      //           "Program Description", "0-2", false, context),
                      //       programWidget("girl", "Art & Craft Therapy",
                      //           "Program Description", "0-2", false, context),
                      //       programWidget("boy2", "Digital Learning Festival",
                      //           "Program Description", "0-2", false, context),
                      //       programWidget("boy1Big", "PLP Publications",
                      //           "Program Description", "0-2", false, context),
                      //     ],
                      //   ),
                      // ),
                    ),
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
