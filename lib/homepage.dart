import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
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
    Size size = MediaQuery.of(context).size;
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FullScreenWidget(
              backgroundColor: Colors.transparent,
              disposeLevel: DisposeLevel.Low,
              child: Hero(
                tag: "customTag",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    "assets/243-2439806_iron-man-png-iron-man-face-vector-png-removebg-preview.png",
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: screens[navIndex],
      bottomNavigationBar: SizedBox(
        height: size.height * 0.07,
        child: BottomNavigationBar(
            onTap: (index) => setState(() {
                  navIndex = index;
                }),
            currentIndex: navIndex,
            backgroundColor: Colors.black,
            showUnselectedLabels: false,
            selectedItemColor: Colors.greenAccent,
            unselectedItemColor: Colors.white60,
            selectedFontSize: 12,
            iconSize: 28,
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
      ),
    );
  }
}
