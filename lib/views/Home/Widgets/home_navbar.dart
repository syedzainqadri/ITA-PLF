import 'package:PLF/controllers/add_to_cart/add_to_cart.dart';
import 'package:PLF/utils/ColorScheme.dart';
import 'package:PLF/utils/custom_drawer.dart';
import 'package:PLF/views/Cart/cart.dart';
import 'package:PLF/views/Home/HomePage.dart';
import 'package:PLF/views/Volenteer/volenteer.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Books/book_store.dart';
import '../../Donation/donations.dart';

String appBarTitle = "Pakistan Learning Festival";

class HomeNavbar extends StatefulWidget {
  _HomeNavbarState createState() => _HomeNavbarState();
}

class _HomeNavbarState extends State<HomeNavbar> {
  int _currentIndex = 0;
  List<Widget> tabs = [
    HomePage(),
    DonationsScreen(),
    VolunteerScreen(),
    BookStore(),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      cartController.getCount();
    });
    super.initState();
  }

  var cartController = Get.put(CartController());
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        key: _scaffoldKey,
        appBar: _currentIndex == 3
            ? AppBar(
                toolbarHeight: 60,
                backgroundColor: vibrantBlue,
                elevation: 0,
                centerTitle: true,
                leading: IconButton(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Icon(
                      Icons.menu,
                      color: vibrantWhite,
                      size: 30,
                    ),
                  ),
                  onPressed: () {
                    _scaffoldKey.currentState.openDrawer();
                  },
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Buy Book",
                    style: TextStyle(color: vibrantWhite),
                  ),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Icon(
                          Icons.search,
                          color: white,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Obx(
                        () {
                          return Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Badge(
                              position: BadgePosition.topEnd(),
                              badgeContent: Text(
                                cartController.totalItem.value.toString(),
                                style: TextStyle(color: white),
                              ),
                              child: InkWell(
                                child: Icon(
                                  Icons.shopping_cart,
                                  color: vibrantWhite,
                                  size: 30,
                                ),
                                onTap: () {
                                  Get.to(CartPage());
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  // Mistake by Niaz ...
                  //     Obx(() {
                  //       if (cartController.isLoading.value) {
                  //         return Offstage();
                  //       } else {
                  //         return Padding(
                  //           padding: EdgeInsets.only(top: 8),
                  //           child: Badge(
                  //             position: BadgePosition.topEnd(),
                  //             badgeContent: Text(
                  //                 cartController.totalItem.value.toString()),
                  //             child: InkWell(
                  //               child: Icon(
                  //                 Icons.shopping_cart,
                  //                 color: vibrantWhite,
                  //                 size: 30,
                  //               ),
                  //               onTap: () {
                  //                 Get.to(CartPage());
                  //               },
                  //             ),
                  //           ),
                  //         );
                  //       }
                  //     }),
                  //   ],
                  // ),
                  SizedBox(
                    width: 20,
                  )
                ],
              )
            : AppBar(
                title: Center(
                    child: Text(
                  _currentIndex == 0
                      ? "Pakistan Learning Festival"
                      : _currentIndex == 1
                          ? "Donate"
                          : "Volunteer Now",
                  style: TextStyle(color: vibrantWhite),
                )),
                backgroundColor: vibrantBlue,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: vibrantWhite,
                    size: 30,
                  ),
                  onPressed: () {
                    _scaffoldKey.currentState.openDrawer();
                  },
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: vibrantWhite,
                      size: 30,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 10,
          unselectedFontSize: 8,
          showUnselectedLabels: true,
          elevation: 6,
          backgroundColor: vibrantBlue,
          selectedItemColor: vibrantAmber,
          unselectedItemColor: vibrantWhite,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: 'Donation',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Volunteer',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: 'Buy Books',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}
