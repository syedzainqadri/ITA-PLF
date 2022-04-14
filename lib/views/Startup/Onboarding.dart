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
        'https://firebasestorage.googleapis.com/v0/b/plfadminpanel.appspot.com/o/video%2FY2Mate.is%20-%20Fun%20k%20Rang%20Bachon%20k%20sang%20-%207th%20Episode-xH2v0xVFEuA-720p-1649895700077.mp4?alt=media&token=50f8ee90-91c7-46a5-b905-e0dab795b67b')
      ..initialize().then((_) {
        setState(() {
          _controller.play();
          _controller.setLooping(true);
          _controller.setVolume(0.0);
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
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
              color: backgroundColor,
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Center(
                      child: Icon(
                      Icons.play_arrow,
                      size: 70,
                      color: Colors.white,
                    )),
            ),
            // Expanded(
            //   child: Center(
            //     child: _chewieController != null &&
            //             _chewieController
            //                 .videoPlayerController.value.initialized
            //         ? Chewie(
            //             controller: _chewieController,
            //           )
            //         : Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: const [
            //               CircularProgressIndicator(),
            //               SizedBox(height: 20),
            //               Text('Loading'),
            //             ],
            //           ),
            //   ),
            // ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              color: backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(HomePage());
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
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height * 0.4,
            //   decoration: BoxDecoration(
            //       image: DecorationImage(
            //           image: AssetImage('asset/images/splash.png'),
            //           fit: BoxFit.contain)),
            // ),
            Expanded(
              child: Container(
                color: backgroundColor,
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
                              openHomePage();
                              setState(() {
                                _controller.pause();
                              });
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

  void openHomePage() {
    Navigator.pushNamed(context, '/HomePage');
  }
}
