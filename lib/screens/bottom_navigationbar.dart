import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kec/screens/account.dart';
import 'package:kec/screens/add_option.dart';
import 'package:kec/screens/map.dart';
import 'home.dart';
import 'note_option.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    //country(),
    home(),
    Note_Option(),
    Add_Option(),
    map(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        //height: ScreenUtil().setHeight(120.0),
        child: BottomNavigationBar(
//        backgroundColor: Colors.green[400],
          fixedColor: Colors.lightBlue,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          iconSize: ScreenUtil().setHeight(50.0),
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text(
                'ទំព័រដើម',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(30.0),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.date_range),
              title: new Text(
                'កំណត់ត្រា',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(30.0),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.add_circle_outline),
              title: new Text(
                'បន្ថែម',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(30.0),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.map),
              title: new Text(
                'ផែនទី',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(30.0),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.person_outline),
              title: new Text(
                'គណនី',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(30.0),
                ),
              ),
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              print(_currentIndex);
            });
          },
        ),
      ),
    );
  }
}
