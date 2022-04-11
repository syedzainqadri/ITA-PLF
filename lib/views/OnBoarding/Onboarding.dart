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
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
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
    return Scaffold(
      backgroundColor: lightBlue,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(221, 26, 25, 25),
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
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Skip",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'circe'),
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
                          color: darkBlue,
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
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
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
