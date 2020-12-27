import 'package:flutter/material.dart';
import 'package:covid19/views/chart.dart';
import 'package:covid19/views/world.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    World(),
    ChartPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid Tracker'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.language),
            title: new Text('World'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.location_on),
            title: new Text('India'),
          ),
        ],
      ),
      body:_children[_currentIndex],
    );
  }

}



