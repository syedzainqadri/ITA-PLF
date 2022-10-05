import 'package:PLF/controllers/events_controller.dart';
import 'package:PLF/controllers/program_controller.dart';
import 'package:PLF/controllers/user_controller.dart';
import 'package:PLF/controllers/volunteer_banner_controller.dart';
import 'package:PLF/models/event_model.dart';
import 'package:PLF/models/program_model.dart';
import 'package:PLF/models/user_model.dart';
import 'package:PLF/utils/helpers.dart';
import 'package:PLF/views/Home/Widgets/home_navbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:PLF/utils/ColorScheme.dart';
import 'package:get/get.dart';
import '../../controllers/program_register_controller.dart';
import '../../models/banner_model.dart';
import '../Webview/webview.dart';

class ProgramRegisterScreen extends StatefulWidget {
  const ProgramRegisterScreen({Key key}) : super(key: key);

  @override
  State<ProgramRegisterScreen> createState() => _ProgramRegisterScreenState();
}

class _ProgramRegisterScreenState extends State<ProgramRegisterScreen> {
  final ProgramRegisterController _programRegisterController =
      Get.put(ProgramRegisterController());
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final cityController = TextEditingController();
  String selectedProject;
  String selectedType;
  String selectedEvent;

  final GetVolunteerBannerController _volunteerBannerController =
      Get.put(GetVolunteerBannerController());
  final UserController userController = Get.put(UserController());
  List<BannersModel> volunteerModel = [];
  List<UserModel> userModel = [];
  List<ProgramModel> programModel = [];
  List<EventModel> eventModel = [];
  bool numberUsed = false;
  final ProgramController programController = Get.put(ProgramController());
  final GetEventController eventController = Get.put(GetEventController());

  @override
  void initState() {
    appBarTitle = "User Register";
    getData();
    super.initState();
  }

  getData() async {
    volunteerModel = await _volunteerBannerController.getVolunteerBanner();
    userModel = await userController.getUserData();
    programModel = await programController.getProgramsData();
    eventModel = await eventController.getEventsData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return programModel == null && eventModel == null
        ? CircularProgressIndicator()
        : Scaffold(
            backgroundColor: vibrantAmber,
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          volunteerModel.length != 0
                              ? SizedBox(
                                  height: 70,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                      itemCount: 1,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        final volunteerBanner =
                                            volunteerModel[index];
                                        return volunteerBanner.status
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        PageRouteBuilder(
                                                            opaque: false,
                                                            pageBuilder:
                                                                (context, _,
                                                                    __) {
                                                              return WebViewPage(
                                                                  title: "Ad",
                                                                  url: volunteerBanner
                                                                      .eventUrl);
                                                            },
                                                            transitionsBuilder:
                                                                (_,
                                                                    __,
                                                                    ___,
                                                                    Widget
                                                                        child) {
                                                              return child;
                                                            }));
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(
                                                                      10)),
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            volunteerBanner.url,
                                                        fit: BoxFit.cover,
                                                        placeholder:
                                                            (context, val) =>
                                                                Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.image),
                                                      ),
                                                    ),
                                                  ),
                                                  // Image.network(homeTopBanner.url)
                                                ),
                                              )
                                            : SizedBox.shrink();
                                      }),
                                )
                              : Center(
                                  child: Text("No Banner Added"),
                                ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  hintStyle: TextStyle(color: Colors.grey[800]),
                                  hintText: "Full Name",
                                  fillColor: white),
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
                                  border: InputBorder.none,
                                  filled: true,
                                  hintStyle: TextStyle(color: Colors.grey[800]),
                                  hintText: "Email Address",
                                  fillColor: white),
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
                                  border: InputBorder.none,
                                  filled: true,
                                  hintStyle: TextStyle(color: Colors.grey[800]),
                                  hintText: "City",
                                  fillColor: white),
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
                                  border: InputBorder.none,
                                  filled: true,
                                  hintStyle: TextStyle(color: Colors.grey[800]),
                                  hintText: "Phone No",
                                  fillColor: white),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              validator: (value) => value == null
                                  ? "Select Participant Type"
                                  : null,
                              dropdownColor: Colors.white,
                              hint: const Text("Select Participant Type"),
                              value: selectedType,
                              onChanged: (String newValue) {
                                setState(() {
                                  selectedType = newValue;
                                });
                              },
                              items: <String>[
                                'Parent',
                                'Teacher',
                                'Student',
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                    enabled: true,
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ));
                              }).toList(),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
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
                              items: programModel
                                  // 'YAA',
                                  // 'Incredible Libraries',
                                  // 'Online Book Club',
                                  // 'Story Bytes',
                                  // 'Art & Craft Therapy',
                                  // 'Digital Learning Festival',
                                  // 'PLP Publications',
                                  .map((value) {
                                return DropdownMenuItem<String>(
                                    enabled: true,
                                    value: value.name,
                                    child: Text(
                                      value.name,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ));
                              }).toList(),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              validator: (value) =>
                                  value == null ? "Select an Event" : null,
                              dropdownColor: Colors.white,
                              hint: const Text("Select an Event"),
                              value: selectedEvent,
                              onChanged: (String newValue) {
                                setState(() {
                                  selectedEvent = newValue;
                                });
                              },
                              items: eventModel
                                  // 'YAA',
                                  // 'Incredible Libraries',
                                  // 'Online Book Club',
                                  // 'Story Bytes',
                                  // 'Art & Craft Therapy',
                                  // 'Digital Learning Festival',
                                  // 'PLP Publications',
                                  .map((value) {
                                return DropdownMenuItem<String>(
                                    enabled: true,
                                    value: value.name,
                                    child: Text(
                                      value.name,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ));
                              }).toList(),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          InkWell(
                            onTap: () {
                              if (userModel.isNotEmpty) {
                                for (int i = 0; i < userModel.length; i++) {
                                  if (phoneController.text ==
                                      userModel[i].phone) {
                                    setState(() {
                                      numberUsed = true;
                                    });
                                  } else {
                                    setState(() {
                                      numberUsed = false;
                                    });
                                  }
                                }
                              }
                              if (numberUsed == false) {
                                if (nameController.text.isNotEmpty) {
                                  if (emailController.text.isNotEmpty) {
                                    if (cityController.text.isNotEmpty) {
                                      if (phoneController.text.isNotEmpty) {
                                        if (selectedType != null) {
                                          if (selectedProject != null) {
                                            _programRegisterController
                                                .addProgramRegisterData(
                                                    nameController.text.trim(),
                                                    emailController.text.trim(),
                                                    cityController.text.trim(),
                                                    selectedType,
                                                    phoneController.text.trim(),
                                                    selectedProject,
                                                    selectedEvent);
                                            Get.offAll(HomeNavbar());
                                            successToast("Success",
                                                "Registered Successfully");
                                          } else {
                                            errorToast("Error",
                                                "Select the Project First");
                                          }
                                        } else {
                                          errorToast(
                                              "Error", "Select the Type First");
                                        }
                                      } else {
                                        errorToast(
                                            "Error", "Add the Name First");
                                      }
                                    } else {
                                      errorToast("Error", "Add the City First");
                                    }
                                  } else {
                                    errorToast("Error", "Add the Email First");
                                  }
                                } else {
                                  errorToast("Error", "Add the Name First");
                                }
                              } else {
                                errorToast(
                                    "Error", "This phone number already used");
                              }
                            },
                            child: Container(
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(15),
                                  margin: EdgeInsets.only(
                                      bottom: 20, right: 30, left: 30),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: vibrantOrange),
                                  child: Obx(() {
                                    return _programRegisterController
                                            .isLoading.isTrue
                                        ? Center(
                                            child: CircularProgressIndicator())
                                        : Center(
                                            child: Text(
                                              "Register",
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
