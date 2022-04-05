import 'package:flutter/material.dart';
import 'package:PLF/ColorScheme.dart';

import 'programWidget.dart';

class AllUpcomingEvents extends StatefulWidget {
  const AllUpcomingEvents({Key key}) : super(key: key);

  @override
  State<AllUpcomingEvents> createState() => _AllUpcomingEventsState();
}

class _AllUpcomingEventsState extends State<AllUpcomingEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Upcoming Events",
          style: TextStyle(color: Color.fromARGB(255, 34, 33, 33)),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.navigate_before,
            color: Color.fromARGB(255, 34, 33, 33),
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width/1.1,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              ]
            ),
          ),
        ),
      ),
    );
  }
}
