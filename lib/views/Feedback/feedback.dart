import 'package:PLF/controllers/feedback_controller.dart';
import 'package:PLF/utils/ColorScheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Feedback",
          style: TextStyle(
            color: Color.fromARGB(255, 34, 33, 33),
          ),
        ),
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.navigate_before,
            color: Color.fromARGB(255, 34, 33, 33),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

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
                                    title: "Ad",
                                    url: UrlBase.baseWebURL);
                              },
                              transitionsBuilder:
                                  (_, __, ___, Widget child) {
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
                  color: Colors.amber,
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
                  _feedbackController.addFeedbackData(selectedProject, remarksController.text.trim(), myRating);
                  setState(() {});
                },
                child: Container(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.only(bottom: 20, right: 30, left: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: darkBlue),
                    child: Obx(() {
                      return _feedbackController.isLoading.isTrue ?
                      Center(child: CircularProgressIndicator())
                          :
                      Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'circe',
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                      );
                    })
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
