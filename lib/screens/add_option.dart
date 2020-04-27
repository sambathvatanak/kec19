import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kec/models/place_data.dart';
import 'package:kec/models/symptom_data.dart';
import 'package:image_picker/image_picker.dart';

class Add_Option extends StatefulWidget {
  @override
  _Add_OptionState createState() => _Add_OptionState();
}

List<String> selectedPlaceList = List();
List<String> selectedSymptomList = List();
File _image;
int num_taken = 0;

Widget _title() {
  return Container(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 8.0),
      child: Text(
        'បន្ថែមកំណត់ត្រា',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

Widget _goesPlace_title() {
  return Container(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 20.0, 10.0, 0.0),
      child: Text(
        'កន្លែងបានទៅ',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

Widget _notedPeople_title() {
  return Container(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 20.0, 10.0, 0.0),
      child: Text(
        'សម្គាល់អ្នកនៅជំវិញខ្លួន',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

Widget _noted_Title() {
  return Container(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 8.0, 10.0, 0.0),
      child: Text(
        'ចំណាំ',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

Widget _symptom_title() {
  return Container(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 0.0),
      child: Text(
        'រោគសញ្ញា',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

Widget _listGoesData(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.all(8.0),
    child: MultiSelectChip(
      getPlace,
      onSelectionChanged: (selectedlist) {
        setState() {
          selectedPlaceList = selectedlist;
        }
      },
    ),
  );
}

Widget _listSymptomData() {
  return Container(
    padding: EdgeInsets.all(8.0),
    child: MultiSelectChip(
      getSymptom,
      onSelectionChanged: (selectedlist) {
        setState() {
          selectedSymptomList = selectedlist;
        }
      },
    ),
  );
}

Widget _image_from_camera() {
  return Row(
    children: <Widget>[
      Container(
        height: 60.0,
        width: 60.0,
        margin: EdgeInsets.fromLTRB(15.0, 20.0, 12.0, 12.0),
        decoration: new BoxDecoration(
          color: Colors.lightBlue,
          image: DecorationImage(
            image: FileImage(_image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12.0),
          shape: BoxShape.rectangle,
        ),
      ),
    ],
  );
}

//Widget _camera_image(){
//  return Container(
//    child: Row(
//      mainAxisAlignment: MainAxisAlignment.start,
//      children: <Widget>[
//        _camera_icon(),
//      ],
//    ),
//  );
//}

Widget _note_textbox(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(10.0),
    width: MediaQuery.of(context).size.width,
    child: new TextFormField(
      maxLines: 5,
      cursorColor: Colors.lightBlue,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffF7F8F9),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffF7F8F9)),
          borderRadius: BorderRadius.circular(25.0),
        ),
        //fillColor: Colors.green
      ),
      keyboardType: TextInputType.text,
      style: new TextStyle(
        fontFamily: "Poppins",
      ),
    ),
  );
}

Widget _save_button(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    padding: EdgeInsets.symmetric(vertical: 15),
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
        print('hello');
      },
      child: Text(
        'រក្សាទុក',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    ),
  );
}

class _Add_OptionState extends State<Add_Option> {
  Widget _camera_icon() {
    return GestureDetector(
      onTap: () async {
        var file = await ImagePicker.pickImage(source: ImageSource.camera);
        setState(() {
          _image = file;
        });
      },
      child: _image == null
          ? Container(
              height: 60.0,
              width: 60.0,
              margin: EdgeInsets.fromLTRB(15.0, 20.0, 12.0, 12.0),
              decoration: new BoxDecoration(
                color: Colors.lightBlue,
                image: DecorationImage(
                  image: new AssetImage('assets/face-id.png'),
                  // fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12.0),
                shape: BoxShape.rectangle,
              ),
            )
          : Row(
        children: <Widget>[
          Container(
            height: 60.0,
            width: 60.0,
            margin: EdgeInsets.fromLTRB(15.0, 20.0, 12.0, 12.0),
            decoration: new BoxDecoration(
              color: Colors.lightBlue,
              image: DecorationImage(
                image: new AssetImage('assets/face-id.png'),
                // fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12.0),
              shape: BoxShape.rectangle,
            ),
          ),
          _image_from_camera(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
//      child: AnnotatedRegion<SystemUiOverlayStyle>(
//        value: SystemUiOverlayStyle(
//          statusBarColor: Colors.white,
//        ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _title(),
                  _goesPlace_title(),
                  _listGoesData(context),
                  _symptom_title(),
                  _listSymptomData(),
                  _notedPeople_title(),
                  _camera_icon(),
                  _noted_Title(),
                  _note_textbox(context),
                  _save_button(context),
                ],
              ),
            ),
          ),
        ),
//        ),
      ),
    );
  }
}

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged;
  MultiSelectChip(this.reportList, {this.onSelectionChanged});
  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  List<String> selectedChoices = List();
  _buildChoiceList() {
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(Container(
        margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        child: ChoiceChip(
          backgroundColor: Color(0xffE7F7FE),
          label: Text(
            item,
            style: TextStyle(
              color: Color(0xff1AA9E8),
            ),
          ),
          selected: selectedChoices.contains(item),
          selectedColor: Colors.blue[100],
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              widget.onSelectionChanged(selectedChoices);
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
