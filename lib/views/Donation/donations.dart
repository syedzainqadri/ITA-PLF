import 'package:PLF/controllers/donate_controller.dart';
import 'package:PLF/views/Home/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:PLF/utils/ColorScheme.dart';


import '../../utils/url_base.dart';
import '../Home/Widgets/home_navbar.dart';
import '../Webview/webview.dart';
import 'donate_dialog.dart';

class DonationsScreen extends StatefulWidget {
  const DonationsScreen({Key key}) : super(key: key);

  @override
  State<DonationsScreen> createState() => _DonationsScreenState();
}

class _DonationsScreenState extends State<DonationsScreen> {


  final nameController = TextEditingController();
  final amountController = TextEditingController();
  final cityController = TextEditingController();

  String selectedProject;

  @override
  void initState() {
    // TODO: implement initState
    appBarTitle = "Donate";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (context, _, __) {
                                  return WebViewPage(
                                      title: "Ad", url: UrlBase.baseWebURL);
                                },
                                transitionsBuilder: (_, __, ___, Widget child) {
                                  return child;
                                }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.network(
                            "https://childrensliteraturefestival.com/wp-content/uploads/2021/03/Peace-ing_Together.gif"),
                      )),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
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
                  padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.menu),
                        Text('Project'),
                        DropdownButton<String>(
                          items: <String>[
                            'YAA',
                            'Incredible Libraries',
                            'Online Book Club',
                            'Story Bytes',
                            'Art & Craft Therapy',
                            'Digital Learning Festival',
                            'PLP Publications',
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedProject = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller: amountController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Ammount",
                        fillColor: Colors.white70),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller: cityController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "City",
                        fillColor: Colors.white70),
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                //   child: Container(
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         border: Border.all(),
                //         borderRadius: BorderRadius.circular(10)),
                //     height: 60,
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                //       children: [
                //         Icon(Icons.menu),
                //         Text('Payment Method'),
                //         DropdownButton<String>(
                //           items: <String>[
                //             'Bank Account',
                //             'Jazz Cash',
                //             'EasyPaisa',
                //           ].map((String value) {
                //             return DropdownMenuItem<String>(
                //               value: value,
                //               child: Text(value),
                //             );
                //           }).toList(),
                //           onChanged: (_) {},
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      barrierColor: Colors.black26,
                      context: context,
                      builder: (context) {
                        return DonateDialog(
                            name: nameController.text.trim(),
                            project: selectedProject,
                            amount: amountController.text.trim(),
                            city: cityController.text.trim());
                      },
                    );
                  },
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
      ),
    );
  }
}



