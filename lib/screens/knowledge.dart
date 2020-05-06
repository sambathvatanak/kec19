import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Knowledge extends StatefulWidget {
  @override
  _KnowledgeState createState() => _KnowledgeState();
}

Widget _buildCoverImage(Size screenSize) {
  return Container(
    height: screenSize.height / 4.2,
    decoration: BoxDecoration(
//      image: DecorationImage(
//        image: AssetImage('assets/images/cover.jpeg'),
//        fit: BoxFit.cover,
//      ),
      color: Colors.lightBlue,
    ),
  );
}

Widget _information_title(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 20.0),
    //color: Colors.white,
    child: Text(
      'អាក្ការះ',
      style: TextStyle(
        fontSize: ScreenUtil().setSp(50.0),
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

class _KnowledgeState extends State<Knowledge> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.30,
            child: Container(
              child: _buildCoverImage(screenSize),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.868,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _information_title(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
