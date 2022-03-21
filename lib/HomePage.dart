import 'package:flutter/material.dart';
import 'package:PLF/ColorScheme.dart';
import 'package:PLF/programWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          onPressed: () {},
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
                        "Main Programs",
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
                      child: Column(
                        children: [
                          programWidget(
                            "boy1Big",
                            "Incredible Libraries",
                            "Program Description",
                            "0-5",
                          ),
                          programWidget(
                              "girl", "YAA", "Program Description", "0-5"),
                          programWidget("boy2", "Online Book Club",
                              "Program Description", "0-2"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
