import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
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
  Iterable markers = [];
  int num = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      final response =
      await http.get('https://coronavirus-tracker-api.herokuapp.com/v2/locations');

      final int statusCode = response.statusCode;
      if (statusCode == 201 || statusCode == 200) {
        Map responseBody = json.decode(response.body);
        List results = responseBody["locations"];

        Iterable _markers = Iterable.generate(240, (index) {
          Map result = results[index];
          Map location = result["coordinates"];
          // print(result['coordinates']);
          LatLng latLngMarker = LatLng(double.parse(location["latitude"]), double.parse(location["longitude"]));
          return Marker(markerId: MarkerId("marker$index"),position: latLngMarker);
        });
        print(_markers);
        setState(() {
          markers = _markers;
          //print(markers);
        });
      } else {
        throw Exception('Error');
      }
    } catch(e) {
      print("Error" + e.toString());
    }
  }

  Widget _bar_map_title(){
    return Container(
      child: Positioned(
        top: 10,
        right: 15,
        left: 15,
        child: Container(
          margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
          //color: Colors.white,
          child: Text(
            'ផែនទីតំបន់ប្រឈម',
            style: TextStyle(
              fontSize: 24,
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          //color: Colors.white,
          child: Card(
            elevation: 0.0,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                      Text(
                        'ករណីសរុប',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    Text(
                      'ជាសះស្បើយ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'មរណភាព',
                      style: TextStyle(
                        fontSize: 15,
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
                            fontSize: 15,
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
                            fontSize: 15,
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
                            fontSize: 15,
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

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            GoogleMap(
              markers: Set.from(
                markers,
              ),
              initialCameraPosition: CameraPosition(target: latlng, zoom: 6.8),
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              onMapCreated: (GoogleMapController controller) {},
            ),
            _bar_map_title(),
            _bar_information(),
          ],
        ),
      ),
    );
  }
}