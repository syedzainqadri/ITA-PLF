import 'package:PLF/LoginPage.dart';
import 'package:PLF/allEvent.dart';
import 'package:PLF/book_store.dart';
import 'package:PLF/eventWidget.dart';
import 'package:PLF/feedback.dart';
import 'package:flutter/material.dart';
import 'package:PLF/ColorScheme.dart';
import 'package:PLF/programWidget.dart';
import 'package:get/get.dart';

import 'donations.dart';
import 'event_history.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: lightBlue,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: darkBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: lightBlue,
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image:
                                AssetImage('asset/images/profilePhoto.png'))),
                  ),
                  Text(
                    'Student Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ],
              )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (context, _, __) {
                          return BookStore();
                        },
                        transitionsBuilder: (_, __, ___, Widget child) {
                          return child;
                        }));
              },
              child: ListTile(
                title: const Text(
                  'Book Store',
                  style: TextStyle(
                    color: Color.fromARGB(255, 38, 36, 36),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (context, _, __) {
                          return Donations();
                        },
                        transitionsBuilder: (_, __, ___, Widget child) {
                          return child;
                        }));
              },
              child: ListTile(
                title: const Text(
                  'Donations',
                  style: TextStyle(
                    color: Color.fromARGB(255, 38, 36, 36),
                  ),
                ),
              ),
            ),
            
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (context, _, __) {
                          return AllUpcomingEvents();
                        },
                        transitionsBuilder: (_, __, ___, Widget child) {
                          return child;
                        }));
              },
              child: ListTile(
                title: const Text(
                  'Upcoming Events',
                  style: TextStyle(
                    color: Color.fromARGB(255, 38, 36, 36),
                  ),
                ),
              ),
            ),
            
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (context, _, __) {
                          return EventsHistory();
                        },
                        transitionsBuilder: (_, __, ___, Widget child) {
                          return child;
                        }));
              },
              child: ListTile(
                title: const Text(
                  'Events History',
                  style: TextStyle(
                    color: Color.fromARGB(255, 38, 36, 36),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (context, _, __) {
                          return FeedbackPage();
                        },
                        transitionsBuilder: (_, __, ___, Widget child) {
                          return child;
                        }));
              },
              child: ListTile(
                title: const Text(
                  'Feedback',
                  style: TextStyle(
                    color: Color.fromARGB(255, 38, 36, 36),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (context, _, __) {
                          return LoginPage();
                        },
                        transitionsBuilder: (_, __, ___, Widget child) {
                          return child;
                        }));
              },
              child: ListTile(
                title: const Text(
                  'Log Out',
                  style: TextStyle(
                    color: Color.fromARGB(255, 38, 36, 36),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: lightBlue,
      appBar: AppBar(
        title: Center(child: Text("PLF")),
        backgroundColor: darkBlue,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(30),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
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
                        onTap: (){
                          
                          Get.to(AllUpcomingEvents());
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
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           eventWidget(
                            "boy1Big",
                            "Incredible Libraries",
                            "Event Description",
                            context
                          ),
                           eventWidget(
                            "girl",
                            "YAA",
                            "Event Description",
                            context
                          ),
                           eventWidget(
                            "boy2",
                            "Incredible Libraries",
                            "Event Description",
                            context
                          ),
                           eventWidget(
                            "boy1Big",
                            "Incredible Libraries",
                            "Event Description",
                            context
                          ),
                        ],
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
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(EventsHistory());
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
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          programWidget(
                            "boy1Big",
                            "Incredible Libraries",
                            "Program Description",
                            "0-5",
                            true,
                          ),
                          programWidget(
                              "yaa", "YAA", "Program Description", "0-5", true),
                          programWidget("boy2", "Online Book Club",
                              "Program Description", "0-2", false),
                          programWidget("story_bytes", "Story Bytes",
                              "Program Description", "0-2", false),
                          programWidget("girl", "Art & Craft Therapy",
                              "Program Description", "0-2", false),
                          programWidget("boy2", "Digital Learning Festival",
                              "Program Description", "0-2", false),
                          programWidget("boy1Big", "PLP Publications",
                              "Program Description", "0-2", false),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
