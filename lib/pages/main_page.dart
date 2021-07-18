import 'package:eczaneistanbul/pages/map_page.dart';
import 'package:eczaneistanbul/pages/settings_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currPage = 0;
  final _pageOptions = [
    MapPage(),
    MapPage(),
    MapPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pageOptions[_currPage],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              border:
                  Border(top: BorderSide(color: Colors.black26, width: 0.75))),
          child: bottomNavigationBar(),
        ));
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currPage,
      onTap: (int index) {
        setState(() {
          _currPage = index;
        });
      },
      elevation: 4,
      type: BottomNavigationBarType.fixed,
      iconSize: 32.0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey[900],
      // unselectedItemColor: Color(0xFF183266),
      // unselectedItemColor: Color(0xFF6883B8),
      selectedItemColor: Colors.grey[900],
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            activeIcon: Icon(Icons.map),
            label: 'Parkuur'),
        BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
            label: 'Explore'),
        BottomNavigationBarItem(
            icon: Icon(Icons.warning_amber_outlined),
            activeIcon: Icon(Icons.warning),
            label: 'Notifications'),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Profile'),
      ],
    );
  }
}
