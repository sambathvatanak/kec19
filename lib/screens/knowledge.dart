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
      image: DecorationImage(
        image: AssetImage('assets/Group 8456.png'),
        fit: BoxFit.cover,
      ),
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

Widget _information_detail(){
  return Container(
    padding: EdgeInsets.all(8.0),
    child: Center(
      child: RichText(
        text: TextSpan(
          text: 'ករណីដែលបានរាយការណ៍ មានចាប់ពីរោគសញ្ញាស្រាល រហូតដល់ជំងឺធ្ងន់ធ្ងរនិងការស្លាប់ចំពោះករណីឆ្លងជំងឺកូវីត-១៩ (COVID-19) ។ \n\n',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: ScreenUtil().setSp(38.0),
          ),
          children: <TextSpan> [
            TextSpan(
              text: 'អាក្ការៈខាងក្រោមនេះអាចនឹងបញ្ចេញអោយដឹងកំឡុងពេលពី២ទៅ១៤ថ្ងៃក្រោយមានការប៉ះពាល់ផ្ទាល់ជាមួយមេរោគ ។',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: ScreenUtil().setSp(38.0),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _information_image(){
  return Container(
    padding: EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(
                'ក្តៅខ្លួន',
                style: TextStyle(
                  color: Color(0xff1AA9E8),
                  fontSize: ScreenUtil().setSp(45.0),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              child: Text(
                'ក្អក (ឈឺបំពង់ក)​',
                style: TextStyle(
                  color: Color(0xff1AA9E8),
                  fontSize: ScreenUtil().setSp(45.0),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: Image(
                image: AssetImage('assets/Mask Group 15.png'),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Image(
                image: AssetImage('assets/Mask Group 16.png'),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.0,),
        Container(
          child: Text(
            'ពិបាកដកដង្ហើម',
            style: TextStyle(
              color: Color(0xff1AA9E8),
              fontSize: ScreenUtil().setSp(45.0),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Image(
            image: AssetImage('assets/Mask Group 17.png'),
          ),
        ),
      ],
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
              onPressed: () => Navigator.pop(context,false),
              icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
              label: Text(
                'ត្រលប់',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(32.0),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
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
            heightFactor: 0.798,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _information_title(context),
                    _information_detail(),
                    _information_image(),
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
