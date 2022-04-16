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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Events History",
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
      body: widget.eventHistoryModel.isNotEmpty
          ? ListView.builder(
              itemCount: widget.eventHistoryModel.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 10, right: 10),
                  child: eventHistoryWidget(
                    widget.eventHistoryModel[index].url,
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
                "No Events History Available",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
    );
  }
}
