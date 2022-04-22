import 'package:PLF/views/Home/Widgets/home_navbar.dart';
import 'package:flutter/material.dart';
import 'package:PLF/utils/ColorScheme.dart';
import 'package:get/get.dart';
import '../../controllers/volunteer_controller.dart';
import '../../utils/url_base.dart';
import '../Webview/webview.dart';

class VolunteerScreen extends StatefulWidget {
  const VolunteerScreen({Key key}) : super(key: key);

  @override
  State<VolunteerScreen> createState() => _VolunteerScreenState();
}

class _VolunteerScreenState extends State<VolunteerScreen> {
  final VolunteerController _volunteerController =
      Get.put(VolunteerController());
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final cityController = TextEditingController();
  final phoneController = TextEditingController();
  String selectedProject;

  @override
  void initState() {
    // TODO: implement initState
    appBarTitle = "Volunteer Now";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      // appBar: AppBar(
      //   title: Text(
      //     "Volunteer Now",
      //     style: TextStyle(color: Color.fromARGB(255, 34, 33, 33)),
      //   ),
      //   elevation: 0.0,
      //   backgroundColor: Colors.transparent,
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.navigate_before,
      //       color: Color.fromARGB(255, 34, 33, 33),
      //       size: 30,
      //     ),
      //     onPressed: () {
      //       Get.back();
      //     },
      //   ),
      // ),
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
                    controller: emailController,
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
                    controller: cityController,
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
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
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
                        borderRadius: BorderRadius.circular(10)),
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
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    _volunteerController.addVolunteerData(
                        nameController.text.trim(),
                        emailController.text.trim(),
                        cityController.text.trim(),
                        phoneController.text.trim(),
                        selectedProject);
                  },
                  child: Container(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(15),
                        margin:
                            EdgeInsets.only(bottom: 20, right: 30, left: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: vibrantOrange),
                        child: Obx(() {
                          return _volunteerController.isLoading.isTrue
                              ? Center(child: CircularProgressIndicator())
                              : Center(
                                  child: Text(
                                    "Aplly Now",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'circe',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                );
                        })),
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
