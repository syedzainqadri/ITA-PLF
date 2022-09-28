import 'package:PLF/controllers/donate_controller.dart';
import 'package:PLF/views/Donation/DonationDialogFromEvent.dart';
import 'package:PLF/views/Home/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:PLF/utils/ColorScheme.dart';

import '../../utils/helpers.dart';
import '../../utils/url_base.dart';
import '../Home/Widgets/home_navbar.dart';
import '../Webview/webview.dart';
import 'donate_dialog.dart';

class DonationsScreenFromEvent extends StatefulWidget {
  const DonationsScreenFromEvent({Key key}) : super(key: key);

  @override
  State<DonationsScreenFromEvent> createState() =>
      _DonationsScreenFromEventState();
}

class _DonationsScreenFromEventState extends State<DonationsScreenFromEvent> {
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
      appBar: AppBar(
        backgroundColor: vibrantBlue,
        title: Text(
          "Donation",
          style: TextStyle(
            color: vibrantWhite,
          ),
        ),
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.navigate_before,
            color: vibrantWhite,
          ),
        ),
      ),
      backgroundColor: vibrantAmber,
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
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Full Name",
                      filled: true,
                      fillColor: white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) =>
                        value == null ? "Select a Project" : null,
                    dropdownColor: Colors.white,
                    hint: const Text("Select a Project"),
                    value: selectedProject,
                    onChanged: (String newValue) {
                      setState(() {
                        selectedProject = newValue;
                      });
                    },
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
                          enabled: true,
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ));
                    }).toList(),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                //   child: Container(
                //     decoration: BoxDecoration(
                //         color: white,
                //         border: Border.all(
                //           color: white,
                //         ),
                //         borderRadius: BorderRadius.circular(0)),
                //     height: 60,
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                //       children: [
                //         DropdownButton<String>(
                //           dropdownColor: vibrantOrange,
                //           autofocus: true,
                //           hint: Text('Please select a Project'),
                //           items: <String>[
                //             'YAA',
                //             'Incredible Libraries',
                //             'Online Book Club',
                //             'Story Bytes',
                //             'Art & Craft Therapy',
                //             'Digital Learning Festival',
                //             'PLP Publications',
                //           ].map((String value) {
                //             return DropdownMenuItem<String>(
                //                 enabled: true,
                //                 value: value,
                //                 child: Text(
                //                   value,
                //                   style: TextStyle(color: white, fontSize: 18),
                //                 ));
                //           }).toList(),
                //           onChanged: (value) {
                //             setState(() {
                //               selectedProject = value;
                //             });
                //             print(selectedProject);
                //           },
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: amountController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        // hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Ammount",
                        fillColor: white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: cityController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        // hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "City",
                        fillColor: white),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    if (nameController.text.isNotEmpty) {
                      if (selectedProject != null) {
                        if (amountController.text.isNotEmpty) {
                          if (cityController.text.isNotEmpty) {
                            showDialog(
                              barrierColor: Colors.black26,
                              context: context,
                              builder: (context) {
                                return DonateDialogFromEvent(
                                    name: nameController.text.trim(),
                                    project: selectedProject,
                                    amount: amountController.text.trim(),
                                    city: cityController.text.trim());
                              },
                            );
                          } else {
                            errorToast("Error", "Add the City First");
                          }
                        } else {
                          errorToast("Error", "Add the Amount First");
                        }
                      } else {
                        errorToast("Error", "Select the Project First");
                      }
                    } else {
                      errorToast("Error", "Add the Name First");
                    }
                  },
                  child: Container(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(bottom: 20, right: 30, left: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: vibrantOrange),
                      child: Center(
                        child: Text(
                          "Next",
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
