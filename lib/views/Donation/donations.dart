import 'package:PLF/controllers/donate_controller.dart';
import 'package:PLF/views/Home/HomePage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:PLF/utils/ColorScheme.dart';

import '../../controllers/donate_banner_controller.dart';
import '../../models/banner_model.dart';
import '../../utils/helpers.dart';
import '../../utils/url_base.dart';
import '../Home/Widgets/home_navbar.dart';
import '../Webview/webview.dart';
import 'donate_dialog.dart';
import 'package:get/get.dart';

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
  final GetDonateBannerController _donateBannerController = Get.put(GetDonateBannerController());
  List<BannersModel> donationModel = [];

  @override
  void initState() {
    // TODO: implement initState
    appBarTitle = "Donate";
    getData();
    super.initState();
  }
  getData() async {
    donationModel = await _donateBannerController.getDonationBanner();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: vibrantAmber,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(height: 20),
                donationModel.length != 0 ?
                SizedBox(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: 1,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final donationBanner = donationModel[index];
                        return donationBanner.status ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      opaque: false,
                                      pageBuilder: (context, _, __) {
                                        return WebViewPage(title: "Ad", url: donationBanner.eventUrl);
                                      },
                                      transitionsBuilder:
                                          (_, __, ___, Widget child) {
                                        return child;
                                      }));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                child: CachedNetworkImage(
                                  imageUrl: donationBanner.url,
                                  fit: BoxFit.cover,
                                  placeholder: (context, val) => Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) => Icon(Icons.image),
                                ),
                              ),
                            ),
                            // Image.network(homeTopBanner.url)
                          ),
                        ): SizedBox.shrink();
                      }),
                ) : Center(child: Text("No Banner Added"),),
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
                    validator: (value) => value == null ?  "Select a Project": null,
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
                    if(nameController.text.isNotEmpty){
                      if(selectedProject != null){
                        if(amountController.text.isNotEmpty){
                          if(cityController.text.isNotEmpty){
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
                          }else{
                            errorToast("Error", "Add the City First");
                          }
                        }else{
                          errorToast("Error", "Add the Amount First");
                        }
                      }else{
                        errorToast("Error", "Select the Project First");
                      }
                    }else{
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
