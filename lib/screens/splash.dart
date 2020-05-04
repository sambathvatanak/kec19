import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kec/screens/home_main.dart';
import 'package:intl/date_symbol_data_local.dart';

//void main() {
//  initializeDateFormatting().then((_) => runApp(MaterialApp(
//    home: new SplashScreen(),
//    routes: <String, WidgetBuilder>{
//      '/home': (BuildContext context) => HomePage()
//    },
//  ),
//  ),
//  );
//}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, _navigationPage);
  }

  void _navigationPage() {
//    Navigator.of(context).pushNamed('/home');
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
  }

  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/Splash.png'),
            ),
          ),
        )
    );
  }
}
