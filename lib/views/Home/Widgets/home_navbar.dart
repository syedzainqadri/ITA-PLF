import 'package:PLF/utils/ColorScheme.dart';
import 'package:PLF/views/Home/HomePage.dart';
import 'package:PLF/views/Books/books_screen.dart';
import 'package:PLF/views/Volenteer/volenteer.dart';
import 'package:flutter/material.dart';

import '../../Donation/donations.dart';

class HomeNavbar extends StatefulWidget {
  _HomeNavbarState createState() => _HomeNavbarState();
}

class _HomeNavbarState extends State<HomeNavbar> {
  int _currentIndex = 0;
  List<Widget> tabs = [
    HomePage(),
    DonationsScreen(),
    VolunteerScreen(),
    BookScreen(),
  ];

  @override
  void initState() {
    tabs = [
      HomePage(),
      DonationsScreen(),
      VolunteerScreen(),
      BookScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 10,
          unselectedFontSize: 8,
          showUnselectedLabels: true,
          elevation: 6,
          backgroundColor: backgroundColor,
          selectedItemColor: black,
          unselectedItemColor: Colors.grey,
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
