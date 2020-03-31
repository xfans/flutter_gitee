import 'package:flutter/material.dart';

class HomeNavigation extends StatefulWidget {
  HomeNavigation(this.changed);
  final ValueChanged<int> changed;

  @override
  _HomeNavigationState createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int _currentIndex = 0;
  void _handleTap(int index) {
    widget.changed(index);
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: getColor(0),
            ),
            title: Text(
              "Home",
              style: TextStyle(color: getColor(0)),
            )),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: getColor(1),
            ),
            title: Text(
              "Notifications",
              style: TextStyle(color: getColor(1)),
            )),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: getColor(2),
            ),
            title: Text(
              "Search",
              style: TextStyle(color: getColor(2)),
            )),
      ],
      currentIndex: _currentIndex,
      onTap: (int index) {
        _handleTap(index);
      },
    );
  }

  MaterialColor getColor(int index) =>
      _currentIndex == index ? Colors.blue : Colors.grey;
}
