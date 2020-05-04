import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/date_symbol_data_local.dart';

class Note_Option extends StatefulWidget {
  @override
  _Note_OptionState createState() => _Note_OptionState();
}

class _Note_OptionState extends State<Note_Option> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  TextEditingController _eventController;
  SharedPreferences prefs;

  void initState() {
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
    initializeDateFormatting('km_KM', null);
    initPrefs();
  }

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _events = Map<DateTime, List<dynamic>>.from(
          decodeMap(json.decode(prefs.getString("events") ?? "{}")));
    });
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  Widget _title() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 8.0),
        child: Text(
          'កំណត់ត្រា',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(50.0),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _calendar() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Color(0xffF8F8F8),
              ),
              child: TableCalendar(
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                    fontSize: ScreenUtil().setSp(32.0),
                  ),
                  weekendStyle: TextStyle(
                    fontSize: ScreenUtil().setSp(32.0),
                    color: Colors.red,
                  ),
                ),
                locale: 'km_KM',
                events: _events,
                initialCalendarFormat: CalendarFormat.month,
                calendarStyle: CalendarStyle(
                  markersColor: Colors.pink,
                  canEventMarkersOverflow: true,
                  todayColor: Colors.orange,
                  selectedColor: Theme.of(context).primaryColor,
                  todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(35.0),
                      color: Colors.white),
                ),
                headerStyle: HeaderStyle(
                  centerHeaderTitle: true,
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  formatButtonTextStyle: TextStyle(color: Colors.white),
                  formatButtonShowsNext: false,
                ),
                startingDayOfWeek: StartingDayOfWeek.monday,
                onDaySelected: (date, events) {
                  setState(() {
                    _selectedEvents = events;
//                  _showAddDialog();
                  });
                },
                builders: CalendarBuilders(
                  outsideWeekendDayBuilder: (context, date, events) =>
                      Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xffF8F8F8),
                        borderRadius: BorderRadius.circular(0.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: ScreenUtil().setSp(30.0),
                      ),
                    ),
                  ),
                  outsideDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xfff0f0f0),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: ScreenUtil().setSp(30.0),
                      ),
                    ),
                  ),
                  dayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xffE8E9EE),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: ScreenUtil().setSp(30.0),
                      ),
                    ),
                  ),
                  selectedDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(30.0),
                        ),
                      )),
                  todayDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(30.0),
                        ),
                      )),
//                markersBuilder: (context, date, events, holidays) {
//                  final children = <Widget>[];
//                  return children;
//                },
                ),
                calendarController: _controller,
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 0.0),
                child: Text(
                  'ទិន្នន័យរបស់អ្នក',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(35.0),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            ..._selectedEvents.map((event) => Container(
                  //margin: const EdgeInsets.all(15.0),
                  decoration: new BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.lightBlue),
                    ),
                    // borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.event,
                      color: Colors.lightBlue,
                    ),
                    title: Text(event),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                )),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }

  _showAddDialog() async {
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              title: Text(
                'សូមវាយបញ្ចូលកំណត់ត្រា',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(35),
                ),
              ),
              content: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: _eventController,
              ),
              actions: <Widget>[
                Container(
                  // margin: EdgeInsets.all(5.0),
                  child: FlatButton(
                    child: Text(
                      'បោះបង់',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.lightBlue,
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: FlatButton(
                    child: Text(
                      'រក្សាទុក',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.lightBlue,
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (_eventController.text.isEmpty) return;
                      if (_events[_controller.selectedDay] != null) {
                        _events[_controller.selectedDay]
                            .add(_eventController.text);
                      } else {
                        _events[_controller.selectedDay] = [
                          _eventController.text
                        ];
                      }
                      prefs.setString(
                          "events", json.encode(encodeMap(_events)));
                      _eventController.clear();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ));
    if (_events[_controller.selectedDay] != null) {
      setState(() {
        _selectedEvents = _events[_controller.selectedDay];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _title(),
                _calendar(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _showAddDialog,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
