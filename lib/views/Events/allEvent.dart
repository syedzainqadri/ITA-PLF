import 'package:PLF/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:PLF/utils/ColorScheme.dart';

import 'widgets/eventWidget.dart';
import 'widgets/eventHistoryWidget.dart';

class AllUpcomingEvents extends StatefulWidget {
  final List<EventModel> eventModel;
  const AllUpcomingEvents({Key key, this.eventModel}) : super(key: key);

  @override
  State<AllUpcomingEvents> createState() => _AllUpcomingEventsState();
}

class _AllUpcomingEventsState extends State<AllUpcomingEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          "Upcoming Events",
          style: TextStyle(color: Color.fromARGB(255, 34, 33, 33)),
        ),
        elevation: 0.0,
        backgroundColor: white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: widget.eventModel.isNotEmpty
          ? ListView.builder(
              itemCount: widget.eventModel.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5.0, right: 10, left: 10),
                  child: eventHistoryWidget(
                      widget.eventModel[index].url,
                      widget.eventModel[index].name,
                      widget.eventModel[index].description,
                      widget.eventModel[index].description != null
                          ? true
                          : false,
                      context,
                      widget.eventModel[index]),
                );
              })
          : Center(
              child: Text(
                "No UpComing Events Available",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
    );
  }
}
