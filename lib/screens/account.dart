import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kec/screens/login.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

Widget _information_title(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
    //color: Colors.white,
    child: Text(
      'ព័ត៌មានរបស់អ្នក',
      style: TextStyle(
        fontSize: ScreenUtil().setSp(40.0),
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

Widget _languages_title(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
    //color: Colors.white,
    child: Text(
      'ភាសា',
      style: TextStyle(
        fontSize: ScreenUtil().setSp(40.0),
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

Widget _languages() {
  return Container(
    //height: ScreenUtil().setHeight(120.0),
    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 18),
    child: TextField(
        decoration: InputDecoration(
      hintText: 'ខ្មែរ',
      prefixIcon: Icon(
        Icons.translate,
        size: 24,
      ),
      border: InputBorder.none,
      fillColor: Color(0xffF8F8F8),
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(color: Color(0xffF8F8F8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(color: Color(0xffF8F8F8)),
      ),
    )),
  );
}

Widget _information() {
  return Container(
    child: Column(
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                    decoration: InputDecoration(
                  hintText: 'User Name',
                  prefixIcon: Icon(
                    Icons.person_outline,
                    size: 32,
                  ),
                  border: InputBorder.none,
                  fillColor: Color(0xffF8F8F8),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Color(0xffF8F8F8)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Color(0xffF8F8F8)),
                  ),
                )),
                Divider(
                  thickness: 1.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: '012 345 678',
                    prefixIcon: Icon(
                      Icons.phone,
                      size: 28,
                    ),
                    border: InputBorder.none,
                    fillColor: Color(0xffF8F8F8),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Color(0xffF8F8F8)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Color(0xffF8F8F8)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildCoverImage(Size screenSize) {
  return Container(
    height: screenSize.height / 4.2,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/Group 8456.png'),
        fit: BoxFit.cover,
      ),
      color: Colors.lightBlue,
    ),
  );
}

Widget _buildProfileImage() {
  return Center(
    child: Stack(
      fit: StackFit.loose,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(240.0),
              height: ScreenUtil().setHeight(230.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Splash.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(80.0),
                border: Border.all(
                  color: Colors.white,
                  width: 5.0,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: ScreenUtil().setHeight(150.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: ScreenUtil().setHeight(60.0),
                ),
                onTap: () {
                  print('hello');
                },
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget _save_button(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: ScreenUtil().setHeight(120.0),
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    //padding: EdgeInsets.symmetric(vertical: 20),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: <BoxShadow>[
          //box shadow of login button
          BoxShadow(
            color: Colors.grey.shade200,
            offset: Offset(2, 4),
            blurRadius: 5,
            spreadRadius: 2,
          )
        ],
        gradient: LinearGradient(
          // start to shape the login button
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xff00B1F5), Color(0xff007FC7)],
        )),
    child: new GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
      },
      child: Text(
        'Sign Out',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    ),
  );
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.40,
            child: Container(
              child: Stack(
                children: <Widget>[
                  _buildCoverImage(screenSize),
                ],
              ),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.768,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 60,),
                    _information_title(context),
                    _information(),
                    _languages_title(context),
                    _languages(),
                    SizedBox(height: 60.0,),
                    _save_button(context),
                  ],
                ),
              ),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.86,
            child: Column(
              children: <Widget>[
                //SizedBox(height: screenSize.height / 8.1),
                _buildProfileImage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
