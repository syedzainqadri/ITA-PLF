import 'package:flutter/material.dart';
import 'package:PLF/utils/ColorScheme.dart';

import '../../models/event_model.dart';
import 'widget/eventVerticalListWidget.dart';

class EventsHistory extends StatefulWidget {
  final List<EventModel> eventHistoryModel;
  const EventsHistory({Key key, @required this.eventHistoryModel})
      : super(key: key);

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
      body: widget.eventHistoryModel.isNotEmpty
          ? ListView.builder(
              itemCount: widget.eventHistoryModel.length,
              itemBuilder: (context, index) {
                return eventVerticalListWidget(
                    widget.eventHistoryModel[index].url,
                    widget.eventHistoryModel[index].name,
                    widget.eventHistoryModel[index].description,
                    context,
                    widget.eventHistoryModel[index]);
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
