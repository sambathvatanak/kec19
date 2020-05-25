import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kec/screens/knowledge.dart';
import 'package:http/http.dart' as http;

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

var now = new DateTime.now();
var formatter = new DateFormat('dd-MM-yyyy');
String date = formatter.format(now);
DateTime date_format;
List data;

Widget _title(){
  return Container(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10.0,8.0,10.0,8.0),
      child: Text(
        'ទំព័រដើម',
        style: TextStyle(
          fontSize: ScreenUtil().setSp(35.0),
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
//          color: Colors.lightBlue,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Group 8458.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: ScreenUtil().setHeight(5.0),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
                      child: Text(
                        'ចំនួនអ្នកផ្ទុកបច្ចុប្បន្ន ($date)',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(30.0),
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Image(
                      image: AssetImage('assets/khmer_flag.png'),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
                  child: Text(
                    '89',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(50.0),
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                //SizedBox(height: ScreenUtil().setHeight(25.0),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'ករណីសរុប',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(30.0),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'ជាសះស្បើយ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(30.0),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'មរណភាព',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(30.0),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 10.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            color: Color(0xff0471FF),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          '102',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(30.0),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 10.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            color: Color(0xff04E762),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          '13',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(30.0),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 10.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            color: Colors.deepOrange[800],
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          '00',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(30.0),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _title_info(){
  return Container(
    child:  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
          child: Text(
            'ប្រចាំថ្ងៃ',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(35.0),
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
                fontSize: ScreenUtil().setSp(35.0),
                fontWeight: FontWeight.w600,
                color: Colors.lightBlue,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _Info(BuildContext context,index){
  return Container(
    height: ScreenUtil().setHeight(290),
    width: ScreenUtil().setWidth(640),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 5,),
        Container(
          height: ScreenUtil().setHeight(230),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Card(
                color: Color(0xffF8F8F8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      color: Colors.lightBlue,
                      height: ScreenUtil().setHeight(72.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 18.0),
                            child: Text(
                             //formatter.format(DateTime.parse(data[index]['date'].toString().replaceAll(new RegExp(r'[^\w\s]+'),''))),
                              data[index]['date'].toString(),
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(30.0),
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                    SizedBox(height: ScreenUtil().setHeight(10.0),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          'ករណីថ្មី',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(30.0),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'ជាសះស្បើយ',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(30.0),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'មរណភាព',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(30.0),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(20.0),),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              width: 10.0,
                              height: 10.0,
                              decoration: BoxDecoration(
                                color: Color(0xff0471FF),
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Text(
                              data[index]['confirmed'].toString(),
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(30.0),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 10.0,
                              height: 10.0,
                              decoration: BoxDecoration(
                                color: Color(0xff04E762),
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Text(
                              data[index]['recovered'].toString(),
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(30.0),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 10.0,
                              height: 10.0,
                              decoration: BoxDecoration(
                                color: Colors.deepOrange[800],
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Text(
                              data[index]['deaths'].toString(),
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(30.0),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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

Widget _knowledge(BuildContext context){
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
          child: Text(
            'ចំណេះដឹងអំពីកូវីត-១៩',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(35.0),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Knowledge()));
              },
              child: Container(
                height: ScreenUtil().setHeight(290),
                width: ScreenUtil().setWidth(369),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Group 8459.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'វិធីបង្ការ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(35.0),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Knowledge()));
              },
              child: Container(
                height: ScreenUtil().setHeight(290),
                width: ScreenUtil().setWidth(369),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Card(
                      color: Colors.lightBlue,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Group 8459.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'អាការះ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(35.0),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Knowledge()));
              },
              child: Container(
                height: ScreenUtil().setHeight(290),
                width: ScreenUtil().setWidth(369),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Card(
                      color: Colors.lightBlue,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Group 8459.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'វិធីបង្ការ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(35.0),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Knowledge()));
              },
              child: Container(
                height: ScreenUtil().setHeight(290),
                width: ScreenUtil().setWidth(369),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Card(
                      color: Colors.lightBlue,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Group 8459.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'វិធីបង្ការ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(35.0),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class _homeState extends State<home> {

  Future<List<dynamic>> fetchCorona() async {
    String country = 'Cambodia';
    var url = 'https://pomber.github.io/covid19/timeseries.json';
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

//    setState(() {
    var extractdata = json.decode(response.body);
    data = extractdata[country];
//    print(data);
//   // print(data);
//    });
    return data;
  }

  void initState(){
    this.fetchCorona();
//    get_datail_data();
//    print('hello');
//    //print(data);
  }

//  void get_datail_data() async {
//    data.add(d_data.fetchCorona());
//    await print(data.length);
//  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              _title_info(),
              FutureBuilder(
                future: fetchCorona(),
                builder: (context, AsyncSnapshot snapshot){
                  if(!snapshot.hasData){
                    return Center(child: CircularProgressIndicator());
                  }else{
                    return Container(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: data == null? 0: data.length,
                        itemBuilder: (BuildContext context, index){
                          return _Info(context,index);
                        },
                      ),
                    );
                  }
                },
              ),
//              _Info(context),
              SizedBox(height: 15,),
              _knowledge(context),
            ],
          ),
        ),
      ),

    );
  }
}
