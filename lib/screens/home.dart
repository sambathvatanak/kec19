import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

Widget _title(){
  return Container(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10.0,8.0,10.0,8.0),
      child: Text(
        'ទំព័រដើម',
        style: TextStyle(
          fontSize: ScreenUtil().setSp(35),
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

Widget _totalCard(BuildContext context){
  return Container(
    height: ScreenUtil().setHeight(300),
    width: MediaQuery.of(context).size.width,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Card(
          color: Colors.lightBlue,
          child: Column(
            children: <Widget>[

            ],
          ),
        ),
      ),
    ),
  );
}

Widget _Info(BuildContext context){
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
              child: Text(
                'ប្រចាំថ្ងៃ',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(35),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,8.0,0),
              child: GestureDetector(
                onTap: () {print('Hello');},
                child: Text(
                  'ទាំងអស់',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(35),
                    fontWeight: FontWeight.w600,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5,),
        Container(
          height: ScreenUtil().setHeight(230),
          width: ScreenUtil().setWidth(560),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Card(
                color: Colors.lightBlue,
                child: Column(
                  children: <Widget>[

                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _knowledge(){
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
          child: Text(
            'ចំណេះដឹងអំពីកូវីត-១៩',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(35),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(320),
              width: ScreenUtil().setWidth(380),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Card(
                    color: Colors.lightBlue,
                    child: Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage('assets/khmer_flag.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.grey,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: new Image.asset('assets/phone_call.png'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10,),
              _title(),
              _totalCard(context),
              SizedBox(height: 15,),
              _Info(context),
              SizedBox(height: 15,),
              _knowledge()
            ],
          ),
        ),
      ),

    );
  }
}
