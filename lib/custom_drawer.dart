// ignore_for_file: missing_required_param

import 'package:PLF/utils/constants.dart';
import 'package:PLF/utils/url_base.dart';
import 'package:PLF/utils/url_paths.dart';
import 'package:flutter/material.dart';
import 'utils/ColorScheme.dart';
import 'views/AuthScreens/LoginPage.dart';
import 'views/Events/upcomingEvents.dart';
import 'book_store.dart';
import 'donations.dart';
import 'views/Events/event_history.dart';
import 'feedback.dart';
import 'webview.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: offWhite,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: darkBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
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
                    AppName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              )),
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
                        }));
              },
              child: ListTile(
                title: Text('Home', style: TextStyle(color: grey)),
              ),
            ),
            ExpansionTile(
              title: Text("Our Story", style: TextStyle(color: grey)),
              childrenPadding: EdgeInsets.all(10),
              iconColor: grey,
              collapsedIconColor: grey,
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
                    child: Center(
                        child: Text(
                      "About",
                      style: TextStyle(color: grey),
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
                    child: Center(
                        child: Text(
                      "PLF Advisors",
                      style: TextStyle(color: grey),
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
                    child: Center(
                        child: Text(
                      "PLF Tarana",
                      style: TextStyle(color: grey),
                    )),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text("Friends of PLFs", style: TextStyle(color: grey)),
              childrenPadding: EdgeInsets.all(10),
              iconColor: grey,
              collapsedIconColor: grey,
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
                    child: Center(
                        child: Text(
                      "Ambassadors",
                      style: TextStyle(color: grey),
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
                    child: Center(
                        child: Text(
                      "Resource Persons",
                      style: TextStyle(color: grey),
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
                    child: Center(
                        child: Text(
                      "Child Prodigies",
                      style: TextStyle(color: grey),
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
                    child: Center(
                        child: Text(
                      "Partner Organizations",
                      style: TextStyle(color: grey),
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
                    child: Center(
                        child: Text(
                      "Core Partners",
                      style: TextStyle(color: grey),
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
                    child: Center(
                        child: Text(
                      "Influencers & Storyteller",
                      style: TextStyle(color: grey),
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
                title: Text('Strands', style: TextStyle(color: grey)),
              ),
            ),
            ExpansionTile(
              title: Text("Programs", style: TextStyle(color: grey)),
              childrenPadding: EdgeInsets.all(10),
              iconColor: grey,
              collapsedIconColor: grey,
              children: <Widget>[
                ExpansionTile(
                  title: Text("Incredible Libraries",
                      style: TextStyle(color: grey)),
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
                        child: Center(
                            child: Text(
                          "Incredible Libraries",
                          style: TextStyle(color: grey),
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
                        child: Center(
                            child: Text(
                          "Digital kutab khanay",
                          style: TextStyle(color: grey),
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
                        child: Center(
                            child: Text(
                          "Kitab Garri",
                          style: TextStyle(color: grey),
                        )),
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
                ExpansionTile(
                  title:
                      Text("Young Author Award", style: TextStyle(color: grey)),
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
                        child: Center(
                            child: Text(
                          "Young Author Award",
                          style: TextStyle(color: grey),
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
                        child: Center(
                            child: Text(
                          "YAA 2021-2022 Launch",
                          style: TextStyle(color: grey),
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
                        child: Center(
                            child: Text(
                          "YAA 2020-2021 Winners",
                          style: TextStyle(color: grey),
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
                        child: Center(
                            child: Text(
                          "YAA 2019-2020 Winners",
                          style: TextStyle(color: grey),
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
                        child: Center(
                            child: Text(
                          "YAA 2019-2020 Members",
                          style: TextStyle(color: grey),
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
                        child: Center(
                            child: Text(
                          "YAA FAQs",
                          style: TextStyle(color: grey),
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
                    child: Center(
                        child: Text(
                      "Online Book Club",
                      style: TextStyle(color: grey),
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
                    child: Center(
                        child: Text(
                      "Every language Teaches Us",
                      style: TextStyle(color: grey),
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
                    child: Center(
                        child: Text(
                      "Story Bytes",
                      style: TextStyle(color: grey),
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
                    child: Center(
                        child: Text(
                      "Art & Craft Therapy",
                      style: TextStyle(color: grey),
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
                    child: Center(
                        child: Text(
                      "Digital Learning Festivals",
                      style: TextStyle(color: grey),
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
                    child: Center(
                        child: Text(
                      "PLF Publications",
                      style: TextStyle(color: grey),
                    )),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text("Happenings", style: TextStyle(color: grey)),
              childrenPadding: EdgeInsets.all(10),
              iconColor: grey,
              collapsedIconColor: grey,
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
                    child: Center(
                        child: Text(
                      "Upcoming PLFs",
                      style: TextStyle(color: grey),
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
                    child: Center(
                        child: Text(
                      "PLFs Workshops",
                      style: TextStyle(color: grey),
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
                    child: Center(
                        child: Text(
                      "Campaigns",
                      style: TextStyle(color: grey),
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
                    child: Center(
                        child: Text(
                      "School Reading Program",
                      style: TextStyle(color: grey),
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
                    child: Center(
                        child: Text(
                      "PLF Activities",
                      style: TextStyle(color: grey),
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
                    color: grey,
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
                          return Donations();
                        },
                        transitionsBuilder: (_, __, ___, Widget child) {
                          return child;
                        }));
              },
              child: ListTile(
                title: Text(
                  'Donations',
                  style: TextStyle(
                    color: grey,
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
                    color: grey,
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
                    color: grey,
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
                    color: grey,
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
                    color: grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
