import 'package:flutter/material.dart';

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
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

Widget _totalCard(BuildContext context){
  return Container(
    height: 180,
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
                  fontSize: 21,
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
                    fontSize: 21,
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
          height: 150,
          width: 350,
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
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 150,
              width: 200,
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
