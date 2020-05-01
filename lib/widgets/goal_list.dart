import 'package:flutter/material.dart';
import 'package:petTracker/localizations.dart';
import 'package:petTracker/widgets/goal_item.dart';

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

