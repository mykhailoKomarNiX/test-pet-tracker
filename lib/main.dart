import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:petTracker/localizations.dart';

void main() => runApp(PetTrackerApp());

class PetTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ja', ''),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(),
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
  String get device => AppLocalizations.of(context).translate('device');
  String get petPhoto => AppLocalizations.of(context).translate('petPhoto');
  String get petName => AppLocalizations.of(context).translate('petName');
  String get petBreedAndPetAge => AppLocalizations.of(context).translate('petBreedAndPetAge');

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
              petPhoto,
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
                    petName,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                Container(
                  child: Text(
                    petBreedAndPetAge,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ))),
        Positioned(
            right: 20.0,
            top: 20,
            child: Container(
              width: 125,
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
                      margin: EdgeInsets.only(left: 5), child: Text(device)),
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
  String get time => '18:32';
  String get label => '$lastSyncUpTime: $time';
  String get todaysStatus =>
      AppLocalizations.of(context).translate('todaysStatus');
  String get lastSyncUpTime =>
      AppLocalizations.of(context).translate('lastSyncUpTime');

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
                    todaysStatus,
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
  String get stepCount => AppLocalizations.of(context).translate('stepCount');
  String get distance => AppLocalizations.of(context).translate('distance');
  String get sleepHours => AppLocalizations.of(context).translate('sleepHours');
  String get hours => AppLocalizations.of(context).translate('hours');
  String get steps => AppLocalizations.of(context).translate('steps');
  String get done => AppLocalizations.of(context).translate('done');

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GoalItem(
            title: stepCount,
            goalValue: '8140',
            currentValue: '8140',
            measure: steps,
            result: done,
          ),
          GoalItem(
            title: distance,
            goalValue: '1249',
            currentValue: '624',
            measure: 'm',
            result: '50%',
          ),
          GoalItem(
            title: sleepHours,
            goalValue: '6:34',
            currentValue: '4:25',
            measure: hours,
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
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String get title => AppLocalizations.of(context).translate('title');
  String get action => AppLocalizations.of(context).translate('action');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
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
                    action,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
