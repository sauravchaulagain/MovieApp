import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/screens/homescreen.dart';
import 'package:movieapp/screens/notification.dart';
import 'package:movieapp/screens/setting.dart';

import 'screens/favourite.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int navIndex = 0;
  final screens = [
    HomeScreen(),
    Favourite(),
    NotificationScreen(),
    Setting(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(backgroundColor: Colors.white),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            "MovieApp",
            style: TextStyle(
              fontFamily: 'hello',
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: screens[navIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => setState(() {
                navIndex = index;
              }),
          currentIndex: navIndex,
          backgroundColor: Colors.black,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.white60,
          selectedFontSize: 14,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              backgroundColor: Colors.black,
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bell),
              backgroundColor: Colors.black,
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.settings),
              label: 'Settings',
            )
          ]),
    );
  }
}
