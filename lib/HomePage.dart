import 'package:PLF/LoginPage.dart';
import 'package:PLF/allEvent.dart';
import 'package:PLF/book_store.dart';
import 'package:PLF/eventWidget.dart';
import 'package:PLF/feedback.dart';
import 'package:flutter/material.dart';
import 'package:PLF/ColorScheme.dart';
import 'package:PLF/programWidget.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'webview.dart';
import 'donations.dart';
import 'event_history.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedNode;
  List<Node> _nodes;
  TreeViewController _treeViewController;
  bool ourStoryOpen = true;
  bool deepExpanded = true;
  ExpanderPosition _expanderPosition = ExpanderPosition.start;
  ExpanderType _expanderType = ExpanderType.plusMinus;
  ExpanderModifier _expanderModifier = ExpanderModifier.none;
  bool _allowParentSelect = false;
  bool _supportParentDoubleTap = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  initState() {
    _nodes = [
      Node(label: 'Home', key: 'd1', icon: Icons.home),
      Node(
        label: 'Our Story',
        key: 'about',
        expanded: ourStoryOpen,
        children: [
          Node(
            label: 'About',
            key: 'd3',
            icon: Icons.input,
          ),
          Node(
            label: 'PLF Advisors',
            key: 'd3',
            icon: Icons.input,
          ),
          Node(
            label: 'PLF Tarana',
            key: 'd3',
            icon: Icons.input,
          ),
        ],
      ),
      Node(
        label: 'Friends of PLF',
        key: 'fplf',
        expanded: ourStoryOpen,
        children: [
          Node(
            label: 'Ambassadors',
            key: 'd3',
            icon: Icons.input,
          ),
          Node(
            label: 'Resource Persons',
            key: 'd3',
            icon: Icons.input,
          ),
          Node(
            label: 'Child Prodigies',
            key: 'd3',
            icon: Icons.input,
          ),
          Node(
            label: 'Partner Organizations',
            key: 'd3',
            icon: Icons.input,
          ),
          Node(
            label: 'Core Partners',
            key: 'd3',
            icon: Icons.input,
          ),
          Node(
            label: 'Story Tellers',
            key: 'd3',
            icon: Icons.input,
          ),
        ],
      ),
      Node(label: 'Strands', key: 'd1'),
      Node(
        label: 'Programs',
        key: 'fplf',
        expanded: ourStoryOpen,
        children: [
          Node(
            label: 'Incredible Libraries',
            key: 'd3',
            icon: Icons.input,
          ),
          Node(
            label: 'Young Author Award',
            key: 'd3',
            icon: Icons.input,
          ),
          Node(
            label: 'Online Book Club',
            key: 'd3',
            icon: Icons.input,
          ),
          Node(
            label: 'Partner Organizations',
            key: 'd3',
            icon: Icons.input,
          ),
          Node(
            label: 'Core Partners',
            key: 'd3',
            icon: Icons.input,
          ),
          Node(
            label: 'Story Tellers',
            key: 'd3',
            icon: Icons.input,
          ),
        ],
      ),
    ];
    _treeViewController = TreeViewController(
      children: _nodes,
      selectedKey: _selectedNode,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TreeViewTheme _treeViewTheme = TreeViewTheme(
      expanderTheme: ExpanderThemeData(
          type: _expanderType,
          modifier: _expanderModifier,
          position: _expanderPosition,
          // color: Colors.grey.shade800,
          size: 20,
          color: Colors.blue),
      labelStyle: TextStyle(
        fontSize: 16,
        letterSpacing: 0.3,
      ),
      parentLabelStyle: TextStyle(
        fontSize: 16,
        letterSpacing: 0.1,
        fontWeight: FontWeight.w800,
        color: Colors.blue.shade700,
      ),
      iconTheme: IconThemeData(
        size: 18,
        color: Colors.grey.shade800,
      ),
      colorScheme: Theme.of(context).colorScheme,
    );
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: lightBlue,
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
                        color: lightBlue,
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image:
                                AssetImage('asset/images/profilePhoto.png'))),
                  ),
                  Text(
                    'Student Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ],
              )),
            ),
            GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: double.infinity,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 160,
                        child: Column(
                          children: <Widget>[],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(10),
                          child: TreeView(
                            controller: _treeViewController,
                            allowParentSelect: _allowParentSelect,
                            supportParentDoubleTap: _supportParentDoubleTap,
                            onExpansionChanged: (key, expanded) =>
                                _expandNode(key, expanded),
                            onNodeTap: (key) {
                              debugPrint('Selected: $key');
                              setState(() {
                                _selectedNode = key;
                                _treeViewController = _treeViewController
                                    .copyWith(selectedKey: key);
                              });
                            },
                            theme: _treeViewTheme,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          debugPrint('Close Keyboard');
                          FocusScope.of(context).unfocus();
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 20),
                          alignment: Alignment.center,
                          child: Text(
                              _treeViewController.getNode(_selectedNode) == null
                                  ? ''
                                  : _treeViewController
                                      .getNode(_selectedNode)
                                      .label),
                        ),
                      )
                    ],
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
                          return BookStore();
                        },
                        transitionsBuilder: (_, __, ___, Widget child) {
                          return child;
                        }));
              },
              child: ListTile(
                title: const Text(
                  'Book Store',
                  style: TextStyle(
                    color: Color.fromARGB(255, 38, 36, 36),
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
                title: const Text(
                  'Donations',
                  style: TextStyle(
                    color: Color.fromARGB(255, 38, 36, 36),
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
                title: const Text(
                  'Upcoming Events',
                  style: TextStyle(
                    color: Color.fromARGB(255, 38, 36, 36),
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
                title: const Text(
                  'Events History',
                  style: TextStyle(
                    color: Color.fromARGB(255, 38, 36, 36),
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
                          return WebViewPage();
                        },
                        transitionsBuilder: (_, __, ___, Widget child) {
                          return child;
                        }));
              },
              child: ListTile(
                title: const Text(
                  'WebView',
                  style: TextStyle(
                    color: Color.fromARGB(255, 38, 36, 36),
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
                title: const Text(
                  'Feedback',
                  style: TextStyle(
                    color: Color.fromARGB(255, 38, 36, 36),
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
                title: const Text(
                  'Log Out',
                  style: TextStyle(
                    color: Color.fromARGB(255, 38, 36, 36),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: lightBlue,
      appBar: AppBar(
        title: Center(child: Text("PLF")),
        backgroundColor: darkBlue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(30),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Upcoming Events",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AllUpcomingEvents()));
                        },
                        child: Text(
                          "See all",
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 13),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          eventWidget("boy1Big", "Incredible Libraries",
                              "Event Description", context),
                          eventWidget(
                              "girl", "YAA", "Event Description", context),
                          eventWidget("boy2", "Incredible Libraries",
                              "Event Description", context),
                          eventWidget("boy1Big", "Incredible Libraries",
                              "Event Description", context),
                        ],
                      ),
                    ),
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
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EventsHistory()));
                        },
                        child: Text(
                          "See all",
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 13),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          programWidget(
                            "boy1Big",
                            "Incredible Libraries",
                            "Program Description",
                            "0-5",
                            true,
                          ),
                          programWidget(
                              "yaa", "YAA", "Program Description", "0-5", true),
                          programWidget("boy2", "Online Book Club",
                              "Program Description", "0-2", false),
                          programWidget("story_bytes", "Story Bytes",
                              "Program Description", "0-2", false),
                          programWidget("girl", "Art & Craft Therapy",
                              "Program Description", "0-2", false),
                          programWidget("boy2", "Digital Learning Festival",
                              "Program Description", "0-2", false),
                          programWidget("boy1Big", "PLP Publications",
                              "Program Description", "0-2", false),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _expandNode(String key, bool expanded) {
    String msg = '${expanded ? "Expanded" : "Collapsed"}: $key';
    debugPrint(msg);
    Node node = _treeViewController.getNode(key);
    if (node != null) {
      List<Node> updated;
      if (key == 'ourStory') {
        updated = _treeViewController.updateNode(
            key,
            node.copyWith(
              expanded: expanded,
              icon: expanded ? Icons.folder_open : Icons.folder,
            ));
      } else {
        updated = _treeViewController.updateNode(
            key, node.copyWith(expanded: expanded));
      }
      setState(() {
        if (key == 'ourStory') ourStoryOpen = expanded;
        _treeViewController = _treeViewController.copyWith(children: updated);
      });
    }
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
