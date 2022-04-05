import 'package:PLF/LoginPage.dart';
import 'package:PLF/book_store.dart';
import 'package:PLF/feedback.dart';
import 'package:flutter/material.dart';
import 'package:PLF/ColorScheme.dart';
import 'package:PLF/programWidget.dart';

import 'donations.dart';

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
        backgroundColor: Colors.transparent,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("asset/images/searchBg.png"))),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(fontSize: 16, fontFamily: 'circe'),
                  ),
                  Text(
                    "Student Name",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'circe',
                        fontWeight: FontWeight.w700),
                  ),
                  Expanded(child: Container()),
                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                        Expanded(
                          child: TextField(
                            style: TextStyle(fontSize: 18, fontFamily: 'circe'),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search for Programs or Events"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(30),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Upcoming Events",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "See all",
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 13),
                        )
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width/1.2,
                              height: MediaQuery.of(context).size.width/1.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey,
                              ),
                            ),Container(
                              width: MediaQuery.of(context).size.width/1.2,
                              height: MediaQuery.of(context).size.width/1.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey,
                              ),
                            ),Container(
                              width: MediaQuery.of(context).size.width/1.2,
                              height: MediaQuery.of(context).size.width/1.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey,
                              ),
                            ),
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

  eventsWidgets(name) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              "See all",
              style: TextStyle(color: Colors.blueAccent, fontSize: 13),
            )
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
