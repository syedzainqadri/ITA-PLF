import 'package:PLF/models/banner_model.dart';
import 'package:PLF/views/Events/allEvent.dart';
import 'package:PLF/views/Events/widgets/eventWidget.dart';
import 'package:PLF/utils/url_base.dart';
import 'package:PLF/views/Home/Widgets/home_navbar.dart';
import 'package:PLF/views/Webview/webview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:PLF/utils/ColorScheme.dart';
import 'package:PLF/views/Events/widgets/eventHistoryWidget.dart';
import '../../controllers/events_controller.dart';
import '../../controllers/home_bottom_banner_controller.dart';
import '../../controllers/home_top_banner_controller.dart';
import '../Events/event_history.dart';
import 'package:get/get.dart';

import '../../models/event_model.dart';
import '../../utils/url_paths.dart';
import 'Widgets/kitab_gaari_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ourStoryOpen = true;
  bool deepExpanded = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GetEventController _eventController = Get.put(GetEventController());
  final GetHomeTopBannerController _homeTopBannerController =
      Get.put(GetHomeTopBannerController());
  final GetHomeBottomBannerController _homeBottomBannerController =
      Get.put(GetHomeBottomBannerController());
  List<EventModel> eventModel = [];
  List<EventModel> upComingEventModel = [];
  List<EventModel> eventHistoryModel = [];
  List<BannersModel> homeTopBannerModel = [];
  List<BannersModel> homeBottomBannerModel = [];
  @override
  initState() {
    super.initState();
    getData();
  }

  getData() async {
    eventModel = await _eventController.getEventsData();
    homeTopBannerModel = await _homeTopBannerController.getHomeTopBanner();
    homeBottomBannerModel =
        await _homeBottomBannerController.getHomeBottomBanner();
    for (int i = 0; i < eventModel.length; i++) {
      if (eventModel[i].status == true) {
        upComingEventModel.add(eventModel[i]);
      } else if (eventModel[i].status == false) {
        eventHistoryModel.add(eventModel[i]);
      }
    }
    print(upComingEventModel.length);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Obx(() {
        if (_eventController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Container(
            padding: EdgeInsets.all(30),
            width: MediaQuery.of(context).size.width,
            color: vibrantAmber,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Upcoming Events",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AllUpcomingEvents(
                                  eventModel: upComingEventModel)));
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: vibrantRed,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(1, 4),
                              ),
                            ],
                          ),
                          child: Text(
                            "See all",
                            style: TextStyle(color: vibrantWhite, fontSize: 13),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.33,
                    width: double.infinity,
                    child: upComingEventModel.isNotEmpty
                        ? ListView.builder(
                            itemCount: upComingEventModel.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return eventWidget(
                                  upComingEventModel[index].url,
                                  upComingEventModel[index].name,
                                  upComingEventModel[index].description,
                                  context,
                                  upComingEventModel[index]);
                            })
                        : Center(
                            child:
                                CircularProgressIndicator(color: vibrantBlue),
                            // child: Text(
                            //   "No UpComing Events Available",
                            //   style: TextStyle(
                            //       fontSize: 16, fontWeight: FontWeight.w600),
                            // ),
                          ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  homeTopBannerModel.length != 0
                      ? SizedBox(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              itemCount: 1,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final homeTopBanner = homeTopBannerModel[index];
                                return homeTopBanner.status
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                    opaque: false,
                                                    pageBuilder:
                                                        (context, _, __) {
                                                      return WebViewPage(
                                                          title: "Ad",
                                                          url: homeTopBanner
                                                              .eventUrl);
                                                    },
                                                    transitionsBuilder: (_, __,
                                                        ___, Widget child) {
                                                      return child;
                                                    }));
                                          },
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10)),
                                            child: CachedNetworkImage(
                                              imageUrl: homeTopBanner.url,
                                              fit: BoxFit.cover,
                                              placeholder: (context, val) =>
                                                  Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.image),
                                            ),
                                          ),
                                          // Image.network(homeTopBanner.url)
                                        ),
                                      )
                                    : SizedBox.shrink();
                              }),
                        )
                      : Center(
                          child: CircularProgressIndicator(color: vibrantBlue),
                          // child: Text("No Banner Added"),
                        ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Events History",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EventsHistory(
                                  eventHistoryModel: eventHistoryModel)));
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: vibrantRed,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(1, 4),
                              ),
                            ],
                          ),
                          child: Text(
                            "See all",
                            style: TextStyle(color: vibrantWhite, fontSize: 13),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.infinity,
                    child: eventHistoryModel.isNotEmpty
                        ? ListView.builder(
                            itemCount: eventHistoryModel.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return eventHistoryWidget(
                                eventHistoryModel[index].url,
                                eventHistoryModel[index].name,
                                eventHistoryModel[index].description,
                                eventHistoryModel[index].description != null
                                    ? true
                                    : false,
                                context,
                                eventHistoryModel[index],
                              );
                            })
                        : Center(
                            child: CircularProgressIndicator(
                              color: vibrantBlue,
                            ),
                            // child: Text(
                            //   "No Events History Available",
                            //   style: TextStyle(
                            //       fontSize: 16, fontWeight: FontWeight.w600),
                            // ),
                          ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  homeBottomBannerModel.length != 0
                      ? SizedBox(
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              itemCount: 1,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final homeBottomBanner =
                                    homeBottomBannerModel[index];
                                return homeBottomBanner.status
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: InkWell(
                                          onTap: () {
                                            Get.to(KitabGaariPage());
                                            // Navigator.push(
                                            //   context,
                                            //   PageRouteBuilder(
                                            //     opaque: false,
                                            //     pageBuilder: (context, _, __) {
                                            //       return WebViewPage(
                                            //           title: "Ad",
                                            //           url: homeBottomBanner
                                            //               .eventUrl);
                                            //     },
                                            //     transitionsBuilder:
                                            //         (_, __, ___, Widget child) {
                                            //       return child;
                                            //     },
                                            //   ),
                                            // );
                                          },
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10)),
                                            child: CachedNetworkImage(
                                              imageUrl: homeBottomBanner.url,
                                              fit: BoxFit.cover,
                                              placeholder: (context, val) =>
                                                  Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.image),
                                            ),
                                          ),
                                          // Image.network(homeTopBanner.url)
                                        ),
                                      )
                                    : SizedBox.shrink();
                              }),
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            color: vibrantBlue,
                          ),
                          // child: Text("No Banner Added"),
                        ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  upcomingEvent() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.3,
        height: MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: lightBlue,
        ),
      ),
    );
  }
}

buttonWidget(buttonName) {
  return Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)), color: darkBlue),
    child: Center(
      child: Text(
        buttonName,
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'circe',
            fontWeight: FontWeight.w700,
            fontSize: 18),
      ),
    ),
  );
}

// class BannerImage extends StatelessWidget {
//   const BannerImage({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: (() {
//         Get.to(page);
//         // Navigator.push(
//         //   context,
//         //   PageRouteBuilder(
//         //     opaque: false,
//         //     pageBuilder: (context, _, __) {
//         //       return WebViewPage(
//         //         title: "Kitab Gari",
//         //         url: UrlBase.baseWebURL +
//         //             UrlPathHelper.getValue(UrlPath.kitabGarri),
//         //       );
//         //     },
//         //     transitionsBuilder: (_, __, ___, Widget child) {
//         //       return child;
//         //     },
//         //   ),
//         // );
//       }),
//       child: Container(
//         child: ClipRRect(
//           child: Image.network(
//               'https://childrensliteraturefestival.com/wp-content/uploads/2020/08/CLF_Kitab_Gari-1.jpg'),
//         ),
//       ),
//     );
//   }
// }
