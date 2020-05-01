import 'package:flutter/material.dart';
import 'package:petTracker/localizations.dart';

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

