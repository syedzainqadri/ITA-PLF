import 'package:PLF/views/Home/HomePage.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:PLF/utils/ColorScheme.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://ewigsoldocs.awsapps.com/workdocs/index.html#/share/document/e9693b04ec1fef32f40c958e16aa45da897c59ca3f7bf2cf1bf3e3b08e8550eb')
      ..initialize().then((_) {
        setState(() {
          _controller.play();
          _controller.setLooping(true);
          _controller.setVolume(1.0);
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: vibrantAmber,
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Center(
                      child: Icon(
                      Icons.play_arrow,
                      size: 70,
                      color: vibrantPink,
                    )),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() async {
                        await _controller.pause();
                      });
                      Get.offAll(HomePage());
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'circe'),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Pakistan Learning Festival",
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'circe',
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "سیکھو سکھاؤ پاکستان",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'circe'),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Onboarding Text sample goes here \n according to client's guidance",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'circe'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 15,
                              color: Colors.black.withOpacity(0.1),
                            )),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() async {
                                await _controller.pause();
                              });
                              Get.offAll(HomePage());
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
