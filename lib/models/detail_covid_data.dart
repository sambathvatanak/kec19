import 'dart:convert';
import 'package:http/http.dart' as http;

class Detail_Covid_Data{

  List data;
  String date;
  String confirmed;
  String deaths;
  String recovered;

  Detail_Covid_Data({this.date,this.confirmed,this.deaths,this.recovered});

  Future<List<dynamic>> fetchCorona() async {
    try {
      String country = 'Cambodia';
      var url = 'https://pomber.github.io/covid19/timeseries.json';
      var response = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
//    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata[country];
      print(data);
//    });
      return data;
    }catch(e){
      print(e.toString());
    }
  }
}