import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:petTracker/localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final String title = 'TOP';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        Locale('ja', ''),
        Locale('en', 'US'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(title: title),
    );
  }
}

class Pet extends StatefulWidget {
  Pet({this.border = false});

  final bool border;
  @override
  _PetState createState() => _PetState();
}

class _PetState extends State<Pet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          border: widget.border ? Border.all() : null,
          shape: BoxShape.circle,
          color: Colors.grey),
    );
  }
}

class PetContainer extends StatefulWidget {
  @override
  _PetContainerState createState() => _PetContainerState();
}

class _PetContainerState extends State<PetContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Pet(border: true),
          Pet(),
          Pet(),
        ],
      ),
    );
  }
}

class StatusCircle extends StatefulWidget {
  @override
  _StatusCircleState createState() => _StatusCircleState();
}

class _StatusCircleState extends State<StatusCircle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        border: Border.all(),
        color: Colors.green,
        shape: BoxShape.circle,
      ),
    );
  }
}

class PetPhoto extends StatefulWidget {
  @override
  _PetPhotoState createState() => _PetPhotoState();
}

class _PetPhotoState extends State<PetPhoto> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
          child: Center(
            child: Text(
              'Pet Photo',
              style: TextStyle(fontSize: 22),
            ),
          ),
        ),
        Positioned(
            left: 30.0,
            top: 130,
            child: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Pet Name',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                Container(
                  child: Text(
                    'Pet breed and pet age',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ))),
        Positioned(
            right: 20.0,
            top: 20,
            child: Container(
              width: 120,
              height: 35,
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  StatusCircle(),
                  Container(
                      margin: EdgeInsets.only(left: 5), child: Text('Device')),
                  Icon(Icons.keyboard_arrow_right),
                ],
              ),
            )),
      ],
    );
  }
}

class LastSyncUp extends StatefulWidget {
  @override
  _LastSyncUpState createState() => _LastSyncUpState();
}

class _LastSyncUpState extends State<LastSyncUp> {
  String get time {
    return '18:32';
  }

  String get label {
    return 'Last sync up time: $time';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    "Today's Status",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(bottom: 20), child: Text(label)),
            ],
          ),
        ],
      ),
    );
  }
}

class GoalList extends StatefulWidget {
  @override
  _GoalListState createState() => _GoalListState();
}

class _GoalListState extends State<GoalList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GoalItem(
            title: 'Step count',
            goalValue: '8140',
            currentValue: '8140',
            measure: 'steps',
            result: 'Done!',
          ),
          GoalItem(
            title: 'Step count',
            goalValue: '1249',
            currentValue: '624',
            measure: 'm',
            result: '50%',
          ),
          GoalItem(
            title: 'Sleep hours',
            goalValue: '6:34',
            currentValue: '4:25',
            measure: 'hours',
            result: '70%',
          ),
        ],
      ),
    );
  }
}

class GoalItem extends StatefulWidget {
  final String title;
  final String goalValue;
  final String currentValue;
  final String measure;
  final String result;

  const GoalItem(
      {this.title,
      this.goalValue,
      this.currentValue,
      this.measure,
      this.result});

  @override
  _GoalItemState createState() => _GoalItemState();
}

class _GoalItemState extends State<GoalItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Stack(children: <Widget>[
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16.0)),
            ),
            Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  )),
            ),
            Container(
              width: 100,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        StatusCircle(),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            widget.title,
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Text(
                      widget.goalValue,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(widget.measure),
                  )
                ],
              ),
            ),
          ]),
          Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                widget.result,
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}

class WeeklyWalk extends StatefulWidget {
  @override
  _WeeklyWalkState createState() => _WeeklyWalkState();
}

class _WeeklyWalkState extends State<WeeklyWalk> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        // child:
        //   Slider(
        //   value: value,
        //   divisions: 5,
        //   min: 0,
        //   max: 5,
        //   label: '$value',
        //   onChanged: (double newValue) => setState(() {
        //     value = newValue;
        //   }),
        // ),
        );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          leading: IconButton(
            onPressed: () => print('more'),
            icon: Icon(Icons.more_horiz),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () => print('more'),
              icon: Icon(Icons.settings),
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            PetContainer(),
            PetPhoto(),
            LastSyncUp(),
            GoalList(),
            WeeklyWalk(),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                width: 200,
                child: RaisedButton(
                  onPressed: () => print('Action'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                  child: Text(
                    AppLocalizations.of(context).translate('action'),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
