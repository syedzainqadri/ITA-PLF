import 'package:flutter/material.dart';
import 'package:PLF/ColorScheme.dart';

class Volenteer extends StatefulWidget {
  const Volenteer({Key key}) : super(key: key);

  @override
  State<Volenteer> createState() => _VolenteerState();
}

class _VolenteerState extends State<Volenteer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          "Volenteer Now",
          style: TextStyle(color: Color.fromARGB(255, 34, 33, 33)),
        ),
        elevation: 0.0,
        backgroundColor: white,
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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Full Name",
                      fillColor: Colors.white70),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Email Address",
                      fillColor: Colors.white70),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "City",
                      fillColor: Colors.white70),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Phone No",
                      fillColor: Colors.white70),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20)),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.menu),
                      Text('Project'),
                      DropdownButton<String>(
                        items: <String>[
                          'YAA',
                          'Incredible Libraries',
                          'Online Book Club',
                          'Story Bytes'
                              'Art & Craft Therapy',
                          'Digital Learning Festival',
                          'PLP Publications',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.only(bottom: 20, right: 30, left: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: darkBlue),
                    child: Center(
                      child: Text(
                        "Donate",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'circe',
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
