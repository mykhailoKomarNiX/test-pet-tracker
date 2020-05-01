import 'package:flutter/material.dart';

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

