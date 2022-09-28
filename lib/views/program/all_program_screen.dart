

import 'package:PLF/models/program_model.dart';
import 'package:PLF/views/program/program_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:PLF/utils/ColorScheme.dart';

class AllProgramsScreen extends StatefulWidget {
  final List<ProgramModel> programModel;

  const AllProgramsScreen({Key key, this.programModel}) : super(key: key);

  @override
  State<AllProgramsScreen> createState() => _AllProgramsScreenState();
}

class _AllProgramsScreenState extends State<AllProgramsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: vibrantAmber,
        appBar: AppBar(
          title: Text(
            "All Programs",
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
        body: widget.programModel.isNotEmpty ?
        ListView.builder(
            itemCount: widget.programModel.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 5.0, right: 20, left: 20),
                child: programHistoryWidget(
                    widget.programModel[index].url,
                    widget.programModel[index].name,
                    widget.programModel[index].description,
                    context,
                    widget.programModel[index]
                ));
            })
            : Center(
          child: Text(
            "No Programs Available",
            style:
            TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
    );
  }
}
