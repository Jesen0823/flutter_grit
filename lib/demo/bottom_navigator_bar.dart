import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigatorBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomNavigatorBarDemoState();
  }
}

class BottomNavigatorBarDemoState extends State<BottomNavigatorBarDemo> {
  int _currentIndex = 0;

  void _onTapHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      fixedColor: Colors.yellowAccent,
      onTap: _onTapHandler,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: "explore",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: "message",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "person",
        ),
      ],
    );
  }
}
