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

  List<LatLng> point = [];

  Iterable markers = [];
  int num = 0;
  Set<Polygon> polygon;

  @override
  void initState() {
    getData();
    addPoints();
    List< Polygon > addPolygon = [
      Polygon(
        polygonId: PolygonId( 'India' ),
        points: point,
        consumeTapEvents: true,
        strokeColor: Colors.grey,
        strokeWidth: 1,
        fillColor: Colors.redAccent,
      ),
    ];
   // polygon.addAll( addPolygon );

    super.initState();
  }
  void addPoints()
  {
    for( var i=0 ; i < GeoJson.IN.length ; i++ )
    {
      var ltlng= LatLng( GeoJson.IN[ i ][ 1 ], GeoJson.IN[ i ][ 0 ] );
      point.add( ltlng );
    }
  }

 void getData() async {
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
          width: MediaQuery.of(context).size.width,
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

  Widget _bar_number_info(){
    return Container(
      child: Positioned(
//        top: 560.0,
        top: MediaQuery.of(context).size.height / 1.5,
        right: 15.0,
        left: MediaQuery.of(context).size.width / 1.4,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: 130.0,
            margin: EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 10.0),
            padding: EdgeInsets.all(1.0),
            decoration: BoxDecoration(
              color: Color(0xffF8F8F8),
              borderRadius: BorderRadius.circular(10.0),
            ),
            //color: Colors.white,
            child: Card(
              color: Color(0xffF8F8F8),
              elevation: 0.0,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 15.0,
                          height: 15.0,
                          decoration: BoxDecoration(
                            color: Color(0xffFEDB82),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          '01-05',
                          style: TextStyle(
                            fontSize: 15,
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
                          width: 15.0,
                          height: 15.0,
                          decoration: BoxDecoration(
                            color: Color(0xffFAB962),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          '06-10',
                          style: TextStyle(
                            fontSize: 15,
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
                          width: 15.0,
                          height: 15.0,
                          decoration: BoxDecoration(
                            color: Color(0xffF99852),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          '11-20',
                          style: TextStyle(
                            fontSize: 15,
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
                          width: 15.0,
                          height: 15.0,
                          decoration: BoxDecoration(
                            color: Color(0xffFC5E41),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          '21-50',
                          style: TextStyle(
                            fontSize: 15,
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
    [77.83745079947457,35.494009507787766],[78.91226891471322,34.32193634697579],
    [78.81108646028574,33.50619802503242],[79.20889163606857,32.994394639613716],
    [79.17612877799553,32.48377981213771],[78.45844648632601,32.61816437431273],
    [78.73889448437401,31.515906073527063],[79.7213668151071,30.882714748654728],
    [81.11125613802932,30.183480943313402],[80.4767212259174,29.72986522065534],
    [80.08842451367627,28.79447011974014],[81.05720258985203,28.416095282499043],
    [81.99998742058497,27.925479234319994],[83.30424889519955,27.36450572357556],
    [84.6750179381738,27.234901231387536],[85.25177859898338,26.72619843190634],
    [86.02439293817918,26.63098460540857],[87.22747195836628,26.397898057556077],
    [88.06023766474982,26.41461538340249],[88.17480431514092,26.81040517832595],
    [88.04313276566123,27.445818589786825],[88.12044070836987,27.876541652939594],
    [88.73032596227856,28.086864732367516],[88.81424848832054,27.29931590423936],
    [88.83564253128938,27.098966376243762],[89.74452762243884,26.719402981059957],
    [90.37327477413407,26.87572418874288],[91.21751264848643,26.808648179628022],
    [92.03348351437509,26.83831045176356],[92.10371178585973,27.452614040633208],
    [91.69665652869668,27.77174184825166],[92.50311893104364,27.89687632904645],
    [93.41334760943268,28.640629380807226],[94.56599043170294,29.277438055939985],
    [95.40480228066464,29.03171662039213],[96.11767866413103,29.452802028922466],
    [96.58659061074749,28.830979519154344],[96.24883344928779,28.41103099213444],
    [97.32711388549004,28.26158274994634],[97.40256147663612,27.88253611908544],
    [97.0519885599681,27.69905894623315],[97.1339990580153,27.083773505149964],
    [96.41936567585097,27.264589341739224],[95.12476769407496,26.5735720891323],
    [95.1551534362626,26.001307277932085],[94.60324913938538,25.162495428970402],
    [94.55265791217164,24.675238348890332],[94.10674197792505,23.85074087167348],
    [93.3251876159428,24.078556423432204],[93.28632693885928,23.043658352139005],
    [93.06029422401463,22.70311066333557],[93.16612755734836,22.278459580977103],
    [92.67272098182556,22.041238918541254],[92.14603478390681,23.627498684172593],
    [91.86992760617132,23.624346421802784],[91.70647505083211,22.985263983649183],
    [91.15896325069971,23.50352692310439],[91.46772993364367,24.072639471934792],
    [91.91509280799443,24.13041372323711],[92.37620161333481,24.976692816664965],
    [91.79959598182207,25.147431748957317],[90.8722107279121,25.132600612889547],
    [89.92069258012185,25.26974986419218],[89.83248091019962,25.96508209889548],
    [89.35509402868729,26.014407253518073],[88.56304935094977,26.44652558034272],
    [88.2097892598025,25.76806570078271],[88.93155398962308,25.238692328384776],
    [88.30637251175602,24.866079413344206],[88.08442223506242,24.501657212821925],
    [88.69994022009092,24.23371491138856],[88.52976972855377,23.631141872649163],
    [88.87631188350309,22.879146429937826],[89.03196129756623,22.055708319582976],
    [88.88876590368542,21.690588487224748],[88.20849734899521,21.703171698487807],
    [86.97570438024027,21.49556163175521],[87.03316857294887,20.743307806882413],
    [86.49935102737378,20.151638495356607],[85.0602657409097,19.4785788029711],
    [83.94100589390001,18.302009792549725],[83.18921715691785,17.67122142177898],
    [82.19279218946592,17.016636053937813],[82.19124189649719,16.556664130107848],
    [81.69271935417748,16.310219224507904],[80.79199913933014,15.951972357644491],
    [80.32489586784388,15.899184882058348],[80.02506920768644,15.136414903214147],
    [80.2332735533904,13.835770778859981],[80.28629357292186,13.006260687710833],
    [79.8625468281285,12.056215318240888],[79.85799930208682,10.35727509199711],
    [79.340511509116,10.30885427493962],[78.88534549348918,9.546135972527722],
    [79.18971967968828,9.216543687370148],[78.2779407083305,8.933046779816934],
    [77.94116539908435,8.252959092639742],[77.53989790233794,7.965534776232333],
    [76.59297895702167,8.89927623131419],[76.13006147655108,10.299630031775521],
    [75.74646731964849,11.308250637248307],[75.39610110870957,11.781245022015824],
    [74.86481570831681,12.741935736537897],[74.61671715688354,13.99258291264968],
    [74.44385949086723,14.617221787977696],[73.5341992532334,15.99065216721496],
    [73.11990929554943,17.928570054592498],[72.82090945830865,19.208233547436166],
    [72.8244751321368,20.419503282141534],[72.6305334817454,21.356009426351008],
    [71.17527347197395,20.757441311114235],[70.4704586119451,20.877330634031384],
    [69.16413008003883,22.0892980005727],[69.64492760608239,22.450774644454338],
    [69.34959679553435,22.84317963306269],[68.1766451353734,23.69196503345671],
    [68.84259931831878,24.35913361256094],[71.04324018746823,24.3565239527302],
    [70.84469933460284,25.21510203704352],[70.28287316272558,25.72222870533983],
    [70.16892662952202,26.491871649678842],[69.51439293811312,26.940965684511372],
    [70.61649620960193,27.989196275335868],[71.77766564320032,27.913180243434525],
    [72.8237516620847,28.961591701772054],[73.45063846221743,29.97641347911987],
    [74.42138024282026,30.979814764931177],[74.40592898956501,31.69263947196528],
    [75.25864179881322,32.2711054550405],[74.45155927927871,32.7648996038055],
    [74.10429365427734,33.44147329358685],[73.74994835805195,34.31769887952785],
    [74.24020267120497,34.74888703057125],[75.75706098826834,34.50492259372132],
    [76.87172163280403,34.65354401299274],[77.83745079947457,35.494009507787766]];
}