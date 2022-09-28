import 'package:PLF/controllers/feedback_banner_controller.dart';
import 'package:PLF/controllers/feedback_controller.dart';
import 'package:PLF/utils/ColorScheme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../models/banner_model.dart';
import '../../utils/helpers.dart';
import '../../utils/url_base.dart';
import '../Webview/webview.dart';
import 'package:get/get.dart';

class FeedbackPage extends StatefulWidget {
  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final FeedbackController _feedbackController = Get.put(FeedbackController());
  final remarksController = TextEditingController();
  String selectedProject;
  double myRating;

  final GetFeedbackBannerController _feedbackBannerController = Get.put(GetFeedbackBannerController());
  List<BannersModel> feedbackModel = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    feedbackModel = await _feedbackBannerController.getFeedbackBanner();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: vibrantAmber,
      appBar: AppBar(
        backgroundColor: vibrantBlue,
        title: Text(
          "Feedback",
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              feedbackModel.length != 0 ?
              SizedBox(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: 1,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final feedbackBanner = feedbackModel[index];
                      return feedbackBanner.status ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    opaque: false,
                                    pageBuilder: (context, _, __) {
                                      return WebViewPage(title: "Ad", url: feedbackBanner.eventUrl);
                                    },
                                    transitionsBuilder:
                                        (_, __, ___, Widget child) {
                                      return child;
                                    }));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: CachedNetworkImage(
                              imageUrl: feedbackBanner.url,
                              fit: BoxFit.cover,
                              placeholder: (context, val) => Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) => Icon(Icons.image),
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
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  maxLines: 5,
                  controller: remarksController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Your Remarks",
                      fillColor: Colors.white70),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: white,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                  myRating = rating;
                },
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  if(selectedProject != null){
                    if(remarksController.text.isNotEmpty){
                      if(myRating != null){
                        _feedbackController.addFeedbackData(
                            selectedProject, remarksController.text.trim(), myRating);
                      }else{
                        errorToast("Error", "Add your Ratings First");
                      }
                    }else{
                      errorToast("Error", "Add your Remarks First");
                    }
                  }else{
                    errorToast("Error", "Select the Project First");
                  }

                  setState(() {});
                },
                child: Container(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(bottom: 20, right: 30, left: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: vibrantOrange),
                      child: Obx(() {
                        return _feedbackController.isLoading.isTrue
                            ? Center(child: CircularProgressIndicator())
                            : Center(
                                child: Text(
                                  "Submit",
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
            ],
          ),
        ),
      ),
    );
  }
}
