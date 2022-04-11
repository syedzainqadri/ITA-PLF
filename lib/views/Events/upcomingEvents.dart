import 'package:PLF/models/event_model.dart';
import 'package:flutter/material.dart';
import 'widget/eventVerticalListWidget.dart';

class AllUpcomingEvents extends StatefulWidget {
  final List<EventModel> eventModel;
  const AllUpcomingEvents({Key key, @required this.eventModel})
      : super(key: key);

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
      body: widget.eventModel.isNotEmpty
          ? ListView.builder(
              itemCount: widget.eventModel.length,
              itemBuilder: (context, index) {
                return eventVerticalListWidget(
                    widget.eventModel[index].url,
                    widget.eventModel[index].name,
                    widget.eventModel[index].description,
                    context,
                    widget.eventModel[index]);
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
