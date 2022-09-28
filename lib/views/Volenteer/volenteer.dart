import 'package:PLF/controllers/volunteer_banner_controller.dart';
import 'package:PLF/utils/helpers.dart';
import 'package:PLF/views/Home/Widgets/home_navbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:PLF/utils/ColorScheme.dart';
import 'package:get/get.dart';
import '../../controllers/volunteer_controller.dart';
import '../../models/banner_model.dart';
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

  final GetVolunteerBannerController _volunteerBannerController = Get.put(GetVolunteerBannerController());
  List<BannersModel> volunteerModel = [];

  @override
  void initState() {
    appBarTitle = "Volunteer Now";
    getData();
    super.initState();
  }

  getData() async {
    volunteerModel = await _volunteerBannerController.getVolunteerBanner();
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
                volunteerModel.length != 0 ?
                SizedBox(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: 1,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final volunteerBanner = volunteerModel[index];
                        return volunteerBanner.status ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      opaque: false,
                                      pageBuilder: (context, _, __) {
                                        return WebViewPage(title: "Ad", url: volunteerBanner.eventUrl);
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
                                  imageUrl: volunteerBanner.url,
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
                SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    if(nameController.text.isNotEmpty){
                      if(emailController.text.isNotEmpty){
                        if(cityController.text.isNotEmpty){
                          if(phoneController.text.isNotEmpty){
                            if(selectedProject != null){
                              _volunteerController.addVolunteerData(
                                  nameController.text.trim(),
                                  emailController.text.trim(),
                                  cityController.text.trim(),
                                  phoneController.text.trim(),
                                  selectedProject);
                            }else{
                              errorToast("Error", "Select the Project First");
                            }
                          }else{
                            errorToast("Error", "Add the Name First");
                          }
                        }else{
                          errorToast("Error", "Add the City First");
                        }
                      }else{
                        errorToast("Error", "Add the Email First");
                      }
                    }else{
                      errorToast("Error", "Add the Name First");
                    }
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
