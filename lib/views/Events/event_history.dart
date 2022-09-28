import 'package:PLF/utils/ColorScheme.dart';
import 'package:flutter/material.dart';

import '../../models/event_model.dart';
import 'widgets/eventHistoryWidget.dart';

class EventsHistory extends StatefulWidget {
  final List<EventModel> eventHistoryModel;
  const EventsHistory({Key key, this.eventHistoryModel}) : super(key: key);

  @override
  State<EventsHistory> createState() => _EventsHistoryState();
}

class _EventsHistoryState extends State<EventsHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: vibrantAmber,
      appBar: AppBar(
        title: Text(
          "Programs History",
          style: TextStyle(color: white),
        ),
        elevation: 0.0,
        backgroundColor: vibrantBlue,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: widget.eventHistoryModel.isNotEmpty
          ? ListView.builder(
              itemCount: widget.eventHistoryModel.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 20, right: 20),
                  child: eventHistoryWidget(
                    widget.eventHistoryModel[index].url != null ? widget.eventHistoryModel[index].url : "",
                    widget.eventHistoryModel[index].name,
                    widget.eventHistoryModel[index].description,
                    widget.eventHistoryModel[index].description != null
                        ? true
                        : false,
                    context,
                    widget.eventHistoryModel[index],
                  ),
                );
              })
          : Center(
              child: Text(
                "No Programs History Available",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
    );
  }
}
