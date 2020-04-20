import 'package:flutter/material.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  final List<Widget> _children = [
    //country(),
    home(),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
//        backgroundColor: Colors.green[400],
        fixedColor: Colors.lightBlue,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 26,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('ទំព័រដើម'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.date_range),
            title: new Text('កំណត់ត្រា'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.add_circle_outline),
            title: new Text('បន្ថែម'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.map),
            title: new Text('ផែនទី'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person_outline),
            title: new Text('គណនី'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            print(_currentIndex);
          });
        },
      ),
    );
  }
}

