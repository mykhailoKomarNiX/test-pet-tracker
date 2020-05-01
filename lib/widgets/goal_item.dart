import 'package:flutter/material.dart';
import 'package:petTracker/widgets/status_circle.dart';

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

