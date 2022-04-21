import 'package:PLF/controllers/add_to_cart/add_to_cart.dart';
import 'package:PLF/models/cart_model.dart';
import 'package:PLF/utils/ColorScheme.dart';
import 'package:PLF/utils/custom_drawer.dart';
import 'package:PLF/views/Cart/cart.dart';
import 'package:PLF/views/Home/HomePage.dart';
import 'package:PLF/views/Volenteer/volenteer.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
    super.initState();
  }

  var cartController = Get.put(CartController());
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        appBar: _currentIndex == 3
            ? AppBar(
                toolbarHeight: 60,
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                leading: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    _scaffoldKey.currentState.openDrawer();
                  },
                ),
                title: Text(
                  "Buy Book",
                  style: TextStyle(color: black),
                ),
                actions: [
                  Obx(() {
                    if (cartController.isLoading.value) {
                      return Offstage();
                    } else {
                      return Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Badge(
                          position: BadgePosition.topEnd(),
                          badgeContent:
                              Text(cartController.totalItem.value.toString()),
                          child: InkWell(
                            child: Icon(
                              Icons.shopping_cart,
                              color: Colors.black,
                              size: 30,
                            ),
                            onTap: () {
                              Get.to(CartScreen());
                            },
                          ),
                        ),
                      );
                    }
                  }),
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
                  style: TextStyle(color: black),
                )),
                backgroundColor: white,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
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
                      color: Colors.black,
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
          backgroundColor: Colors.white,
          selectedItemColor: darkBlue,
          unselectedItemColor: Colors.grey.shade600,
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
