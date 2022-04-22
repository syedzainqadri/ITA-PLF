import 'package:PLF/utils/url_base.dart';
import 'package:PLF/utils/url_paths.dart';
import 'package:flutter/material.dart';
import '../models/event_model.dart';
import '../views/Feedback/feedback.dart';
import 'ColorScheme.dart';
import '../views/Auth/LoginPage.dart';
import '../views/Books/book_store.dart';
import '../views/Donation/donations.dart';
import '../views/Webview/webview.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

List<EventModel> upComingEventModel = [];
List<EventModel> eventHistoryModel = [];

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        // backgroundColor: Color.fromRGBO(255, 243, 228, 10),
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: vibrantAmber,
              ),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        // color: lightBlue,
                        // borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage('asset/images/logo.png'))),
                  ),
                  Text(
                    'Pakistan Learning Festival',
                    style: TextStyle(
                      color: black,
                      fontSize: 18,
                    ),
                  ),
                ],
              )),
            ),
            Divider(
              color: Colors.grey.shade300,
              height: 1,
            ),
            MainMenuItem(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (context, _, __) {
                        return WebViewPage(
                            title: "Home", url: UrlBase.baseWebURL);
                      },
                      transitionsBuilder: (_, __, ___, Widget child) {
                        return child;
                      },
                    ),
                  );
                },
                name: 'Home'),
            ExpansionTile(
              title: Text(
                "Our Story",
                style: TextStyle(
                    color: black, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              childrenPadding: EdgeInsets.all(10),
              iconColor: black,
              collapsedIconColor: black,
              children: <Widget>[
                MenuItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (context, _, __) {
                                return WebViewPage(
                                    title: "About",
                                    url: UrlBase.baseWebURL +
                                        UrlPathHelper.getValue(UrlPath.about));
                              },
                              transitionsBuilder: (_, __, ___, Widget child) {
                                return child;
                              }));
                    },
                    name: 'About'),
                MenuItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (context, _, __) {
                                return WebViewPage(
                                    title: "PLF Advisors",
                                    url: UrlBase.baseWebURL +
                                        UrlPathHelper.getValue(
                                            UrlPath.plfAdvisor));
                              },
                              transitionsBuilder: (_, __, ___, Widget child) {
                                return child;
                              }));
                    },
                    name: 'PLF Advisors'),
                MenuItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (context, _, __) {
                                return WebViewPage(
                                    title: "PLF Tarana",
                                    url: UrlBase.baseWebURL +
                                        UrlPathHelper.getValue(
                                            UrlPath.plfTarana));
                              },
                              transitionsBuilder: (_, __, ___, Widget child) {
                                return child;
                              }));
                    },
                    name: 'PLF Tarana'),
              ],
            ),
            ExpansionTile(
              title: Text(
                "Friends of PLFs",
                style: TextStyle(
                    color: black, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              childrenPadding: EdgeInsets.all(10),
              iconColor: black,
              collapsedIconColor: black,
              children: <Widget>[
                MenuItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (context, _, __) {
                                return WebViewPage(
                                    title: "Ambassadors",
                                    url: UrlBase.baseWebURL +
                                        UrlPathHelper.getValue(
                                            UrlPath.ambassadors));
                              },
                              transitionsBuilder: (_, __, ___, Widget child) {
                                return child;
                              }));
                    },
                    name: "Ambassadors"),
                MenuItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (context, _, __) {
                                return WebViewPage(
                                    title: "Resource Persons",
                                    url: UrlBase.baseWebURL +
                                        UrlPathHelper.getValue(
                                            UrlPath.resourcePersons));
                              },
                              transitionsBuilder: (_, __, ___, Widget child) {
                                return child;
                              }));
                    },
                    name: "Resource Persons"),
                MenuItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (context, _, __) {
                                return WebViewPage(
                                    title: "Child Prodigies",
                                    url: UrlBase.baseWebURL +
                                        UrlPathHelper.getValue(
                                            UrlPath.childProdigies));
                              },
                              transitionsBuilder: (_, __, ___, Widget child) {
                                return child;
                              }));
                    },
                    name: 'Child Prodigies'),
                MenuItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (context, _, __) {
                                return WebViewPage(
                                    title: "Partner Organizations",
                                    url: UrlBase.baseWebURL +
                                        UrlPathHelper.getValue(
                                            UrlPath.partnerOrganization));
                              },
                              transitionsBuilder: (_, __, ___, Widget child) {
                                return child;
                              }));
                    },
                    name: 'Partner Organizations'),
                MenuItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (context, _, __) {
                                return WebViewPage(
                                    title: "Core Partners",
                                    url: UrlBase.baseWebURL +
                                        UrlPathHelper.getValue(
                                            UrlPath.corePartners));
                              },
                              transitionsBuilder: (_, __, ___, Widget child) {
                                return child;
                              }));
                    },
                    name: 'Core Partners'),
                MenuItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (context, _, __) {
                                return WebViewPage(
                                    title: "Influencers & StoryTeller",
                                    url: UrlBase.baseWebURL +
                                        UrlPathHelper.getValue(
                                            UrlPath.influencers));
                              },
                              transitionsBuilder: (_, __, ___, Widget child) {
                                return child;
                              }));
                    },
                    name: 'Influencers & StoryTeller'),
              ],
            ),
            MainMenuItem(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (context, _, __) {
                            return WebViewPage(
                                title: "Strands",
                                url: UrlBase.baseWebURL +
                                    UrlPathHelper.getValue(UrlPath.strands));
                          },
                          transitionsBuilder: (_, __, ___, Widget child) {
                            return child;
                          }));
                },
                name: 'Strands'),
            Divider(),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
              child: Text(
                'Programs',
                style: TextStyle(
                    color: black, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            ExpansionTile(
              title: Text(
                "Incredible Libraries",
                style: TextStyle(
                  color: black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              childrenPadding: EdgeInsets.all(10),
              children: <Widget>[
                MenuItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (context, _, __) {
                                return WebViewPage(
                                    title: "Incredible Libraries",
                                    url: UrlBase.baseWebURL +
                                        UrlPathHelper.getValue(
                                            UrlPath.incredibleLibraries));
                              },
                              transitionsBuilder: (_, __, ___, Widget child) {
                                return child;
                              }));
                    },
                    name: 'Incredible Libraries'),
                SizedBox(height: 5),
                MenuItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (context, _, __) {
                                return WebViewPage(
                                    title: "Digital Kutab Khanay",
                                    url: UrlBase.baseWebURL +
                                        UrlPathHelper.getValue(
                                            UrlPath.digitalKutab));
                              },
                              transitionsBuilder: (_, __, ___, Widget child) {
                                return child;
                              }));
                    },
                    name: 'Digital kutab khanay'),
                SizedBox(height: 5),
                MenuItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (context, _, __) {
                                return WebViewPage(
                                    title: "Kitab Garri",
                                    url: UrlBase.baseWebURL +
                                        UrlPathHelper.getValue(
                                            UrlPath.kitabGarri));
                              },
                              transitionsBuilder: (_, __, ___, Widget child) {
                                return child;
                              }));
                    },
                    name: 'Kitab Garri'),
                SizedBox(height: 5),
              ],
            ),
            ExpansionTile(
              title: Text(
                "Young Author Award",
                style: TextStyle(
                    color: black, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              childrenPadding: EdgeInsets.all(10),
              children: <Widget>[
                MenuItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (context, _, __) {
                                return WebViewPage(
                                    title: "Young Author Award",
                                    url: UrlBase.baseWebURL +
                                        UrlPathHelper.getValue(
                                            UrlPath.youngAuthorAward));
                              },
                              transitionsBuilder: (_, __, ___, Widget child) {
                                return child;
                              }));
                    },
                    name: 'Young Author Award'),
                SizedBox(height: 5),
                MenuItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (context, _, __) {
                                return WebViewPage(
                                    title: "YAA 2021-2022 Launch",
                                    url: UrlBase.baseWebURL +
                                        UrlPathHelper.getValue(
                                            UrlPath.yAA2022Launch));
                              },
                              transitionsBuilder: (_, __, ___, Widget child) {
                                return child;
                              }));
                    },
                    name: 'YAA 2021-2022 Launch'),
                SizedBox(height: 5),
                MenuItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (context, _, __) {
                                return WebViewPage(
                                    title: "YAA 2020-2021 Winners",
                                    url: UrlBase.baseWebURL +
                                        UrlPathHelper.getValue(
                                            UrlPath.yAA2021Winners));
                              },
                              transitionsBuilder: (_, __, ___, Widget child) {
                                return child;
                              }));
                    },
                    name: 'YAA 2020-2021 Winners'),
                SizedBox(height: 5),
                MenuItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (context, _, __) {
                                return WebViewPage(
                                    title: "YAA 2019-2020 Winners",
                                    url: UrlBase.baseWebURL +
                                        UrlPathHelper.getValue(
                                            UrlPath.yAA1920Winners));
                              },
                              transitionsBuilder: (_, __, ___, Widget child) {
                                return child;
                              }));
                    },
                    name: 'YAA 2019-2020 Winners'),
                SizedBox(height: 5),
                MenuItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (context, _, __) {
                                return WebViewPage(
                                    title: "YAA 2019-2020 Members",
                                    url: UrlBase.baseWebURL +
                                        UrlPathHelper.getValue(
                                            UrlPath.yAA1920Members));
                              },
                              transitionsBuilder: (_, __, ___, Widget child) {
                                return child;
                              }));
                    },
                    name: 'YAA 2019-2020 Members'),
                SizedBox(height: 5),
                MenuItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (context, _, __) {
                                return WebViewPage(
                                    title: "YAA FAQs",
                                    url: UrlBase.baseWebURL +
                                        UrlPathHelper.getValue(
                                            UrlPath.yAAFaqs));
                              },
                              transitionsBuilder: (_, __, ___, Widget child) {
                                return child;
                              }));
                    },
                    name: 'YAA FAQs'),
                SizedBox(height: 5),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            MenuItem(
              name: 'Online Book Club',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (context, _, __) {
                          return WebViewPage(
                              title: 'Online Book Club',
                              url: UrlBase.baseWebURL +
                                  UrlPathHelper.getValue(
                                      UrlPath.onlineBookClub));
                        },
                        transitionsBuilder: (_, __, ___, Widget child) {
                          return child;
                        }));
              },
            ),
            MenuItem(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (context, _, __) {
                            return WebViewPage(
                                title: "Every Language Teaches Us",
                                url: UrlBase.baseWebURL +
                                    UrlPathHelper.getValue(
                                        UrlPath.languageTeaches));
                          },
                          transitionsBuilder: (_, __, ___, Widget child) {
                            return child;
                          }));
                },
                name: 'Every Language Teaches Us'),
            MenuItem(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (context, _, __) {
                            return WebViewPage(
                                title: "Story Bytes",
                                url: UrlBase.baseWebURL +
                                    UrlPathHelper.getValue(UrlPath.storyBytes));
                          },
                          transitionsBuilder: (_, __, ___, Widget child) {
                            return child;
                          }));
                },
                name: 'Story Bytes'),
            MenuItem(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (context, _, __) {
                            return WebViewPage(
                                title: "Art & Craft Theraphy",
                                url: UrlPathHelper.getValue(
                                    UrlPath.artCraftTherapy));
                          },
                          transitionsBuilder: (_, __, ___, Widget child) {
                            return child;
                          }));
                },
                name: 'Art & Craft Theraphy'),
            MenuItem(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (context, _, __) {
                            return WebViewPage(
                                title: "Digital Learning Festivals",
                                url: UrlBase.baseWebURL +
                                    UrlPathHelper.getValue(
                                        UrlPath.digitalLearningFestivals));
                          },
                          transitionsBuilder: (_, __, ___, Widget child) {
                            return child;
                          }));
                },
                name: 'Digital Learning Festivals'),
            MenuItem(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (context, _, __) {
                            return WebViewPage(
                                title: "PLF Publications",
                                url: UrlBase.baseWebURL +
                                    UrlPathHelper.getValue(
                                        UrlPath.plfPublications));
                          },
                          transitionsBuilder: (_, __, ___, Widget child) {
                            return child;
                          }));
                },
                name: 'PLF Publications'),
            ExpansionTile(
              title: Text(
                "Happenings",
                style: TextStyle(
                    color: black, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              childrenPadding: EdgeInsets.all(10),
              iconColor: black,
              collapsedIconColor: black,
              children: <Widget>[
                MenuItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (context, _, __) {
                                return WebViewPage(
                                    title: "UpComing PLFs",
                                    url: UrlBase.baseWebURL +
                                        UrlPathHelper.getValue(
                                            UrlPath.plfUpComings));
                              },
                              transitionsBuilder: (_, __, ___, Widget child) {
                                return child;
                              }));
                    },
                    name: 'UpComing PLFs'),
                MenuItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (context, _, __) {
                                return WebViewPage(
                                    title: "PLFs Workshops",
                                    url: UrlBase.baseWebURL +
                                        UrlPathHelper.getValue(
                                            UrlPath.plfWorkshops));
                              },
                              transitionsBuilder: (_, __, ___, Widget child) {
                                return child;
                              }));
                    },
                    name: 'PLFs Workshops'),
                MenuItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (context, _, __) {
                                return WebViewPage(
                                    title: "Campaigns",
                                    url: UrlBase.baseWebURL +
                                        UrlPathHelper.getValue(
                                            UrlPath.campaigns));
                              },
                              transitionsBuilder: (_, __, ___, Widget child) {
                                return child;
                              }));
                    },
                    name: 'Campaigns'),
                MenuItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (context, _, __) {
                                return WebViewPage(
                                    title: "School Reading Program",
                                    url: UrlBase.baseWebURL +
                                        UrlPathHelper.getValue(
                                            UrlPath.schoolReadingProgram));
                              },
                              transitionsBuilder: (_, __, ___, Widget child) {
                                return child;
                              }));
                    },
                    name: 'School Reading Program'),
                MenuItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (context, _, __) {
                                return WebViewPage(
                                    title: "PLFs Activities",
                                    url: UrlBase.baseWebURL +
                                        UrlPathHelper.getValue(
                                            UrlPath.plfActivities));
                              },
                              transitionsBuilder: (_, __, ___, Widget child) {
                                return child;
                              }));
                    },
                    name: 'PLFs Activities'),
              ],
            ),
            MainMenuItem(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (context, _, __) {
                            return BookStore();
                          },
                          transitionsBuilder: (_, __, ___, Widget child) {
                            return child;
                          }));
                },
                name: 'Book Store'),
            MainMenuItem(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (context, _, __) {
                        return DonationsScreen();
                      },
                      transitionsBuilder: (_, __, ___, Widget child) {
                        return child;
                      },
                    ),
                  );
                },
                name: 'Donations'),
            MainMenuItem(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (context, _, __) {
                            return FeedbackPage();
                          },
                          transitionsBuilder: (_, __, ___, Widget child) {
                            return child;
                          }));
                },
                name: 'Feedback'),
            MainMenuItem(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (context, _, __) {
                            return LoginPage();
                          },
                          transitionsBuilder: (_, __, ___, Widget child) {
                            return child;
                          }));
                },
                name: 'Log Out'),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  String name;
  Function onTap;
  MenuItem({
    @required this.onTap,
    @required this.name,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width,
        child: Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              name,
              style: TextStyle(
                color: vibrantBlack,
                fontSize: 18,
              ),
            )),
      ),
    );
  }
}

class MainMenuItem extends StatelessWidget {
  String name;
  Function onTap;
  MainMenuItem({
    @required this.onTap,
    @required this.name,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width,
        child: Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              name,
              style: TextStyle(
                color: vibrantBlack,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )),
      ),
    );
  }
}
