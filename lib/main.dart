import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kec/screens/home_main.dart';

void main() => runApp(MaterialApp(
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/super': (BuildContext context) => HomePage()
      },
    ));

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
    Navigator.of(context).pushNamed('/super');
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
