import 'package:flutter/material.dart';
import 'package:petTracker/localizations.dart';
import 'package:petTracker/widgets/goal_list.dart';
import 'package:petTracker/widgets/last_sync_up.dart';
import 'package:petTracker/widgets/pet_container.dart';
import 'package:petTracker/widgets/pet_photo.dart';
import 'package:petTracker/widgets/settings_popup.dart';
import 'package:petTracker/widgets/weekly_walk.dart';

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
            SettingsPopup(),
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
