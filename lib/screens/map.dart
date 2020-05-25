import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class map extends StatefulWidget {
  @override
  _mapState createState() => _mapState();
}

class _mapState extends State<map> {
  LatLng latlng = LatLng(
    12.469156, 105.229416,
  );

  List<LatLng> point = [];

  Iterable markers = [];
  int num = 0;
  Set <Polygon> polygon = new Set();

  @override
  void initState() {
    addPoints();
    List< Polygon > addPolygon = [
      Polygon(
        polygonId: PolygonId('India'),
        points: point,
        consumeTapEvents: true,
        strokeColor: Colors.grey,
        strokeWidth: 1,
        fillColor: Colors.redAccent,
      )
    ];
    polygon.addAll(addPolygon);

    print('hello world');
    print(addPolygon);
    super.initState();
  }

  Future add_polygon() async {

  }

  void addPoints()
  {
    for( var i=0 ; i < GeoJson.IN.length ; i++ )
    {
      var ltlng= LatLng( GeoJson.IN[ i ][ 1 ], GeoJson.IN[ i ][ 0 ] );
      point.add(ltlng);
      //print(point);
    }
  }

  Widget _bar_map_title(){
    return Container(
      child: Positioned(
        top: 10,
        right: 15,
        left: 15,
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
          //color: Colors.white,
          child: Text(
            'ផែនទីតំបន់ប្រឈម',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(40.0),
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }

  Widget _bar_information(){
    return Container(
      child: Positioned(
        top: 80,
        right: 15,
        left: 15,
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
          padding: EdgeInsets.all(1.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10.0),
          ),
          //color: Colors.white,
          child: Card(
            color: Colors.white.withOpacity(0.5),
            elevation: 0.0,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                      Text(
                        'ករណីសរុប',
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
          )
        ),
      ),
    );
  }

  Widget _bar_number_info(){
    return Container(
      child: Positioned(
//        top: 560.0,
        top: ScreenUtil().setHeight(305.0) / 0.368,
        right: 15.0,
        left: ScreenUtil().setWidth(200.0) / 0.37,
        child: Container(
            width: MediaQuery.of(context).size.width,
            //height: ScreenUtil().setHeight(275.0),
            margin: EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 10.0),
            padding: EdgeInsets.all(1.0),
            decoration: BoxDecoration(
              color: Color(0xffF8F8F8).withOpacity(0.5),
              borderRadius: BorderRadius.circular(10.0),
            ),
            //color: Colors.white,
            child: Card(
              color: Color(0xffF8F8F8).withOpacity(0.5),
              elevation: 0.0,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(30.0),
                          height: ScreenUtil().setWidth(30.0),
                          decoration: BoxDecoration(
                            color: Color(0xffFEDB82),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          '01-05',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(30.0),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(30.0),
                          height: ScreenUtil().setWidth(30.0),
                          decoration: BoxDecoration(
                            color: Color(0xffFAB962),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          '06-10',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(30.0),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(30.0),
                          height: ScreenUtil().setWidth(30.0),
                          decoration: BoxDecoration(
                            color: Color(0xffF99852),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          '11-20',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(30.0),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(30.0),
                          height: ScreenUtil().setWidth(30.0),
                          decoration: BoxDecoration(
                            color: Color(0xffFC5E41),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          '21-50',
                          style: TextStyle(
                            fontSize:  ScreenUtil().setSp(30.0),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(target: latlng, zoom: 6.8),
                mapType: MapType.normal,
                trafficEnabled: true,
                zoomControlsEnabled: false,
                onMapCreated: (GoogleMapController controller) {},
                polygons: polygon,
              ),
            ),
            _bar_map_title(),
            _bar_information(),
            _bar_number_info(),
          ],
        ),
      ),
    );
  }
}

class GeoJson
{

  static const List IN = [
    [102.5849324890267,12.186594956913282],[101.68715783081996,12.645740057826572],
    [100.83180952352487,12.627084865769206],[100.9784672383692,13.412721665902566],
    [100.0977974792511,13.406856390837433],[100.01873253784456,12.307001044153354],
    [99.47892052612363,10.846366685423547],[99.15377241414316,9.963061428258554],
    [99.22239871622676,9.239255479362427],[99.87383182169813,9.20786204674512],
    [100.27964684448622,8.295152899606052],[100.45927412313276,7.429572658717177],
    [101.01732791545273,6.856868597842478],[101.62307905477806,6.74062246340192],
    [102.14118696493638,6.221636053894628],[101.81428185425798,5.810808417174242],
    [101.15421878459387,5.691384182147715],[101.07551557821336,6.204867051615921],
    [100.25959638875696,6.642824815289543],[100.0857568705271,6.46448944745029],
    [99.69069054565574,6.848212795433597],[99.51964155476963,7.34345388430276],
    [98.9882528015123,7.907993068875327],[98.503786248776,8.382305202666288],
    [98.339661899817,7.794511623562386],[98.15000939330581,8.350007432483878],
    [98.25915001830624,8.973922837759801],[98.55355065307305,9.932959906448545],
    [99.03812055867398,10.960545762572437],[99.58728600463972,11.892762762901697],
    [99.19635379435167,12.80474843998867],[99.21201175333609,13.269293728076464],
    [99.09775516153876,13.827502549693278],[98.43081912637987,14.622027696180835],
    [98.1920740091914,15.12370250087035],[98.53737592976572,15.308497422746084],
    [98.90334842325676,16.177824204976115],[98.49376102091135,16.83783559820793],[
      97.85912275593486,17.567946071843664],[97.37589643757354,18.445437730375815],
    [97.7977828308044,18.627080389881755],[98.25372399291561,19.708203029860044],
    [98.95967573445488,19.752980658440947],[99.54330936075931,20.186597601802063],
    [100.11598758341783,20.417849636308187],[100.54888105672688,20.109237982661128],
    [100.60629357300316,19.508344427971224],[101.2820146016517,19.462584947176765],
    [101.03593143107777,18.408928330961615],[101.05954756063517,17.51249725999449],
    [102.11359175009248,18.109101670804165],[102.41300499879162,17.932781683824288],
    [102.9987056823877,17.9616946476916],[103.20019209189373,18.309632066312773],
    [103.95647667848529,18.24095408779688],[104.7169470560925,17.42885895433008],
    [104.7793205098688,16.44186493577145],[105.58903852745016,15.570316066952858],
    [105.54433841351769,14.723933620660416],[105.21877689007887,14.273211778210694],
    [104.28141808473661,14.416743068901367],[102.98842207236163,14.225721136934467],
    [102.348099399833,13.394247341358223],[102.5849324890267,12.186594956913282]
  ];
}