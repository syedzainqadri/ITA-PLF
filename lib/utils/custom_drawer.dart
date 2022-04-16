import 'package:PLF/utils/url_base.dart';
import 'package:PLF/utils/url_paths.dart';
import 'package:flutter/material.dart';
import 'ColorScheme.dart';
import '../views/Auth/LoginPage.dart';
import '../views/Events/allEvent.dart';
import '../views/Books/book_store.dart';
import '../views/Donation/donations.dart';
import '../views/Events/event_history.dart';
import '../views/Feedback/feedback.dart';
import '../views/Webview/webview.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

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
                color: white,
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
            GestureDetector(
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
              child: ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(
                      color: black, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
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
                InkWell(
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
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        "About",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                InkWell(
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
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        "PLF Advisors",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                InkWell(
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
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        "PLF Tarana",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
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
                InkWell(
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
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "Ambassadors",
                          style: TextStyle(
                              color: black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                InkWell(
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
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "Resource Persons",
                          style: TextStyle(
                              color: black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                InkWell(
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
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "Child Prodigies",
                          style: TextStyle(
                              color: black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                InkWell(
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
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "Partner Organizations",
                          style: TextStyle(
                              color: black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                InkWell(
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
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "Core Partners",
                          style: TextStyle(
                              color: black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                InkWell(
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
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "Influencers & Storyteller",
                          style: TextStyle(
                              color: black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
              ],
            ),
            GestureDetector(
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
              child: ListTile(
                title: Text(
                  'Strands',
                  style: TextStyle(
                      color: black, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ExpansionTile(
              title: Text(
                "Programs",
                style: TextStyle(
                    color: black, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              childrenPadding: EdgeInsets.all(10),
              iconColor: black,
              collapsedIconColor: black,
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    "Incredible Libraries",
                    style: TextStyle(
                        color: black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  childrenPadding: EdgeInsets.all(10),
                  children: <Widget>[
                    InkWell(
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
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              "Incredible Libraries",
                              style: TextStyle(
                                  color: black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    SizedBox(height: 5),
                    InkWell(
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
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              "Digital kutab khanay",
                              style: TextStyle(
                                  color: black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    SizedBox(height: 5),
                    InkWell(
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
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              "Kitab Garri",
                              style: TextStyle(
                                  color: black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Young Author Award",
                    style: TextStyle(
                        color: black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  childrenPadding: EdgeInsets.all(10),
                  children: <Widget>[
                    InkWell(
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
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              "Young Author Award",
                              style: TextStyle(
                                  color: black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    SizedBox(height: 5),
                    InkWell(
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
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              "YAA 2021-2022 Launch",
                              style: TextStyle(
                                  color: black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    SizedBox(height: 5),
                    InkWell(
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
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              "YAA 2020-2021 Winners",
                              style: TextStyle(
                                  color: black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    SizedBox(height: 5),
                    InkWell(
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
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              "YAA 2019-2020 Winners",
                              style: TextStyle(
                                  color: black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    SizedBox(height: 5),
                    InkWell(
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
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              "YAA 2019-2020 Members",
                              style: TextStyle(
                                  color: black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    SizedBox(height: 5),
                    InkWell(
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
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              "YAA FAQs",
                              style: TextStyle(
                                  color: black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (context, _, __) {
                              return WebViewPage(
                                  title: "Online Book Club",
                                  url: UrlBase.baseWebURL +
                                      UrlPathHelper.getValue(
                                          UrlPath.onlineBookClub));
                            },
                            transitionsBuilder: (_, __, ___, Widget child) {
                              return child;
                            }));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "Online Book Club",
                          style: TextStyle(
                              color: black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                InkWell(
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
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "Every language Teaches Us",
                          style: TextStyle(
                              color: black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                InkWell(
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
                                      UrlPathHelper.getValue(
                                          UrlPath.storyBytes));
                            },
                            transitionsBuilder: (_, __, ___, Widget child) {
                              return child;
                            }));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "Story Bytes",
                          style: TextStyle(
                              color: black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                InkWell(
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
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "Art & Craft Therapy",
                          style: TextStyle(
                              color: black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    // Navigator.push(context,
                    //     PageRouteBuilder(opaque: false,
                    //         pageBuilder: (context, _, __) {
                    //           return WebViewPage(title: "Digital Learning Festivals", url: UrlBase.baseWebURL + UrlPathHelper.getValue(UrlPath.digitalLearningFestivals));},
                    //         transitionsBuilder: (_, __, ___, Widget child) {
                    //           return child;
                    //         }));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "Digital Learning Festivals",
                          style: TextStyle(
                              color: black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                InkWell(
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
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "PLF Publications",
                          style: TextStyle(
                              color: black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
              ],
            ),
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
                InkWell(
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
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "Upcoming PLFs",
                          style: TextStyle(
                              color: black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                InkWell(
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
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "PLFs Workshops",
                          style: TextStyle(
                              color: black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                InkWell(
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
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "Campaigns",
                          style: TextStyle(
                              color: black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                InkWell(
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
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "School Reading Program",
                          style: TextStyle(
                              color: black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                InkWell(
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
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "PLF Activities",
                          style: TextStyle(
                              color: black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
              ],
            ),
            GestureDetector(
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
              child: ListTile(
                title: Text(
                  'Book Store',
                  style: TextStyle(
                    color: black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            GestureDetector(
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
                        }));
              },
              child: ListTile(
                title: Text(
                  'Donations',
                  style: TextStyle(
                    color: black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (context, _, __) {
                          return AllUpcomingEvents();
                        },
                        transitionsBuilder: (_, __, ___, Widget child) {
                          return child;
                        }));
              },
              child: ListTile(
                title: Text(
                  'Upcoming Events',
                  style: TextStyle(
                    color: black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (context, _, __) {
                          return EventsHistory();
                        },
                        transitionsBuilder: (_, __, ___, Widget child) {
                          return child;
                        }));
              },
              child: ListTile(
                title: Text(
                  'Events History',
                  style: TextStyle(
                    color: black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            GestureDetector(
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
              child: ListTile(
                title: Text(
                  'Feedback',
                  style: TextStyle(
                      color: black, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            GestureDetector(
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
              child: ListTile(
                title: Text(
                  'Log Out',
                  style: TextStyle(
                      color: black, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
